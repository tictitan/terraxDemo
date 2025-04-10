locals {
  cloudflare_filter = fileexists("${path.module}/data/imported_cloudflare_filter.json") ? jsondecode(file("${path.module}/data/imported_cloudflare_filter.json")) : []

  cloudflared_cloudflare_filter = fileexists("${path.module}/data/cloudflared_cloudflare_filter.json") ? jsondecode(file("${path.module}/data/cloudflared_cloudflare_filter.json")) : []
}

resource "cloudflare_filter" "cloudflare_filter" {
   for_each = { for record in flatten(local.cloudflare_filter) : record.idSpring => record }
  description = try(each.value.description , null)
  expression = try(each.value.expression , null)
  paused = try(each.value.paused , null)
  ref = try(each.value.ref , null)
  zone_id =  try(trimspace(each.value.zone_id)=="" ? null : each.value.zone_id , null)
}

import {
  for_each = { for record in flatten(local.cloudflared_cloudflare_filter) : record.id => record }
  to = cloudflare_filter.cloudflared_cloudflare_filter[each.value.id]
  id = "${each.value.zone_id}/${each.value.id}"
}

resource "cloudflare_filter" "cloudflared_cloudflare_filter" {
   for_each = { for record in flatten(local.cloudflared_cloudflare_filter) : record.id => record }
  description = try(each.value.description , null)
  expression = try(each.value.expression , null)
  paused = try(each.value.paused , null)
  ref = try(each.value.ref , null)
  zone_id =  try(trimspace(each.value.zone_id)=="" ? null : each.value.zone_id , null)
}

