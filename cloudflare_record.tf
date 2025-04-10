locals {
  cloudflare_record = fileexists("${path.module}/data/imported_cloudflare_record.json") ? jsondecode(file("${path.module}/data/imported_cloudflare_record.json")) : []

  cloudflared_cloudflare_record = fileexists("${path.module}/data/cloudflared_cloudflare_record.json") ? jsondecode(file("${path.module}/data/cloudflared_cloudflare_record.json")) : []
}

resource "cloudflare_record" "cloudflare_record" {
   for_each = { for record in flatten(local.cloudflare_record) : record.idSpring => record }
  allow_overwrite = try(each.value.allow_overwrite , null)
  comment = try(each.value.comment , null)
  content = try(each.value.content , null)
  name = try(each.value.name , null)
  priority = try(each.value.priority , null)
  proxied = try(each.value.proxied , null)
  tags = try(each.value.tags , null)
  ttl = try(each.value.ttl , null)
  type = try(each.value.type , null)
  value = try(each.value.value , null)
  zone_id =  try(trimspace(each.value.zone_id)=="" ? null : each.value.zone_id , null)

  dynamic "data" {
    for_each = try(each.value.data != null ? each.value.data : [], [])
    content {
  algorithm = try(data.value.algorithm , null)
  altitude = try(data.value.altitude , null)
  certificate = try(data.value.certificate , null)
  content = try(data.value.content , null)
  digest = try(data.value.digest , null)
  digest_type = try(data.value.digest_type , null)
  fingerprint = try(data.value.fingerprint , null)
  flags = try(data.value.flags , null)
  key_tag = try(data.value.key_tag , null)
  lat_degrees = try(data.value.lat_degrees , null)
  lat_direction = try(data.value.lat_direction , null)
  lat_minutes = try(data.value.lat_minutes , null)
  lat_seconds = try(data.value.lat_seconds , null)
  long_degrees = try(data.value.long_degrees , null)
  long_direction = try(data.value.long_direction , null)
  long_minutes = try(data.value.long_minutes , null)
  long_seconds = try(data.value.long_seconds , null)
  matching_type = try(data.value.matching_type , null)
  name = try(data.value.name , null)
  order = try(data.value.order , null)
  port = try(data.value.port , null)
  precision_horz = try(data.value.precision_horz , null)
  precision_vert = try(data.value.precision_vert , null)
  preference = try(data.value.preference , null)
  priority = try(data.value.priority , null)
  proto = try(data.value.proto , null)
  protocol = try(data.value.protocol , null)
  public_key = try(data.value.public_key , null)
  regex = try(data.value.regex , null)
  replacement = try(data.value.replacement , null)
  selector = try(data.value.selector , null)
  service = try(data.value.service , null)
  size = try(data.value.size , null)
  tag = try(data.value.tag , null)
  target = try(data.value.target , null)
  type = try(data.value.type , null)
  usage = try(data.value.usage , null)
  value = try(data.value.value , null)
  weight = try(data.value.weight , null)
    }
  }

  dynamic "timeouts" {
    for_each =try(each.value.timeouts != null ? each.value.timeouts : [], [])
    content {
  create = try(timeouts.value.create , null)
  update = try(timeouts.value.update , null)
    }
  }
}

import {
  for_each = { for record in flatten(local.cloudflared_cloudflare_record) : record.id => record }
  to = cloudflare_record.cloudflared_cloudflare_record[each.value.id]
  id = "${each.value.zone_id}/${each.value.id}"
}

resource "cloudflare_record" "cloudflared_cloudflare_record" {
   for_each = { for record in flatten(local.cloudflared_cloudflare_record) : record.id => record }
    allow_overwrite = try(each.value.allow_overwrite , null)
    comment = try(each.value.comment , null)
    content = try(each.value.content , null)
    name = try(each.value.name , null)
    priority = try(each.value.priority , null)
    proxied = try(each.value.proxied , null)
    tags = try(each.value.tags , null)
    ttl = try(each.value.ttl , null)
    type = try(each.value.type , null)
    value = try(each.value.value , null)
    zone_id =  try(trimspace(each.value.zone_id)=="" ? null : each.value.zone_id , null)


  dynamic "data" {
    for_each = try(each.value.data != null ? each.value.data : [], [])
    content {
  algorithm = try(data.value.algorithm , null)
  altitude = try(data.value.altitude , null)
  certificate = try(data.value.certificate , null)
  content = try(data.value.content , null)
  digest = try(data.value.digest , null)
  digest_type = try(data.value.digest_type , null)
  fingerprint = try(data.value.fingerprint , null)
  flags = try(data.value.flags , null)
  key_tag = try(data.value.key_tag , null)
  lat_degrees = try(data.value.lat_degrees , null)
  lat_direction = try(data.value.lat_direction , null)
  lat_minutes = try(data.value.lat_minutes , null)
  lat_seconds = try(data.value.lat_seconds , null)
  long_degrees = try(data.value.long_degrees , null)
  long_direction = try(data.value.long_direction , null)
  long_minutes = try(data.value.long_minutes , null)
  long_seconds = try(data.value.long_seconds , null)
  matching_type = try(data.value.matching_type , null)
  name = try(data.value.name , null)
  order = try(data.value.order , null)
  port = try(data.value.port , null)
  precision_horz = try(data.value.precision_horz , null)
  precision_vert = try(data.value.precision_vert , null)
  preference = try(data.value.preference , null)
  priority = try(data.value.priority , null)
  proto = try(data.value.proto , null)
  protocol = try(data.value.protocol , null)
  public_key = try(data.value.public_key , null)
  regex = try(data.value.regex , null)
  replacement = try(data.value.replacement , null)
  selector = try(data.value.selector , null)
  service = try(data.value.service , null)
  size = try(data.value.size , null)
  tag = try(data.value.tag , null)
  target = try(data.value.target , null)
  type = try(data.value.type , null)
  usage = try(data.value.usage , null)
  value = try(data.value.value , null)
  weight = try(data.value.weight , null)
    }
  }

  dynamic "timeouts" {
    for_each = try(each.value.timeouts != null ? each.value.timeouts : [], [])
    content {
  create = try(timeouts.value.create , null)
  update = try(timeouts.value.update , null)
    }
  }

  lifecycle {ignore_changes = [name]}
}

