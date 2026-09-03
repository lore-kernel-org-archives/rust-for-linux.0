Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021099.outbound.protection.outlook.com [52.101.95.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF9C4D8D94;
	Thu,  3 Sep 2026 15:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448919; cv=fail; b=e5LcKnTt2T5oZ6y2P7/2dvyaQwdYocqUhHuj1DG/4pNPGwa00QCvsvI2rf5Gg7o1DvyFrqeCw+4LA6XZW3O/ZQrtzikuwhhsuiz80ow3WdmujJXOE/2MhDl6Kzo8yd5bN0CFwQfoHNfnyuE+KWRK+8e+4Cw2SOfVd1Mh4fzCr38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448919; c=relaxed/simple;
	bh=lvtfVzwPxvRo09lXFstPfdf48RfRYslCf7ruhSPKOgA=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=iQwSJHWpBvSXSpeGF4H0TuK5fR2OM8CgZnWHI6DpLKsTg+ok37CwwMxRX7NTeoLYhUkw/0+XtD5i1uknJRcCKJhjNiOyFw1GZX7yIlpfeKYbuZ9HJ18J0ftkFiKQBOYC0JVkfAzLytZqJdsOrxATJmhSxRNiwC37EoqlENHicgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Z4MpIRqT; arc=fail smtp.client-ip=52.101.95.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Z4MpIRqT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=giB1mctTLxjyVZvXVCTod5DFrgNF5Y8Avd60wm7dywt0IFPM1stmlPVC44thpfnfiiD6VezlyAqq0EGAn/UdKIeYHWDjXBey/m9dckY2fZs8iJ/zoDhPjbnsU2iAhhns1/2RHe83i3owAmxysVMSPFuQaZBYz9mJ6VUiX7td0JlJzxiEghxvpHFnDunn4LKsZ+q3mdsnOGzaKg3OW5T3fnA/OGbxb0/MQlHwzm3GYuNJW5viP4E4RYcJCpvfzjRgCBnrFXWRFbumNMIpJKs9M4NGH7FYONNoeWq6EQ/vXtH0B/jkJQWXTkBIO5ny0ribSl9ihvcxvwVUM1f3DMzX1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3VWZe78BodNjZxtfVThfXvYSu47G4UmWUaIG/VPvMI=;
 b=NcL7yv8BGCyHGhxi9bjqaUNebyGrFFa6ljPwAKWxTEvL1VJeJTJo5bh3tQgipAe3NFUWMLrgJ6mVJW0dybf77uj0nBZ00ohVFNUg3QXDWA08vW+x1fyEhWtPkL1V6LwtnJH3keqmLQ7v4N94CiTX+m2Vyu/jnTrrQ+0BCUHRHMUWpgMfJ9jrF5pnwlLmJIz50Iv3X8FTTl5tPOQZ/kd5thA9oyMdJIjXG0DPZWfcJtzbur9XDRY+53tTdF1anRJW92Z+XLwBxocSvC5nwSoKGGbsV1Q8PeGbjneJPTyQB3mPyOnNjWVdbcChuMAYrf0CNaOi2yycHxhAzVAvDEmGEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3VWZe78BodNjZxtfVThfXvYSu47G4UmWUaIG/VPvMI=;
 b=Z4MpIRqTr8olMxwN6I7TDARbkVoh64jfF0zkd5Ml3M7e5tM85QgOue13ukzynYrxGanAEPqB1WrLw7z9OAa4he2aSWJVwVmd8cmGqUptmd6VNJiKxU36WLRpF/QxmAq1i+CkbnjHzmocjkZpGr3uGsKVp0+7OQOZiEMh9n5qF8k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LOYP265MB2223.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:11d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 15:21:54 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 15:21:54 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH v2 0/3] rust: const_eval: add a mechanism to do const trait
 calls
Date: Thu, 03 Sep 2026 16:21:43 +0100
Message-Id: <20260903-cv-v2-0-e93b1613e40c@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIeQmWoC/1WOwRKCIBRFf8VhHQVkpK36j8bFEx9KU9gAMjoO/
 57YquV5c969dyUenUFPbsVKHEbjzWg3EIeCqAFsj9R0GxPBhGSVqKiKFBToc8lYx6Uim/hxqM2
 8hzyaH/upfaIK+TMbLXikrQOrhnx6GTvN1OIcTm/wAV12BuPD6JZ9SeQ56680csqorEuQ9UVrf
 tX3HtzST+PRYiBNSukL28KtNswAAAA=
X-Change-ID: 20260828-cv-acaf3400d16c
To: Eliot Courtney <ecourtney@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788448914; l=1655;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=lvtfVzwPxvRo09lXFstPfdf48RfRYslCf7ruhSPKOgA=;
 b=8AQQPQVEAY2+6FuKvLqYOqjE5YAeZ6wHbu4IyYozl6g5sX9CRH7KsajJP517+G/AMs+UlEUGd
 8yO69MW3izrD9l+b/oZ6eJJEnfScFkZ+95D3FbXwr0HUjyG+NRK8i6A
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::17) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LOYP265MB2223:EE_
X-MS-Office365-Filtering-Correlation-Id: 04afef84-bb33-4a7e-79af-08df09cf1640
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|23010399003|366016|921020|10067099003|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UA73d8u/PN+5YDB/7jzqVioJxkm7JyzZ/Ba2sdAJpHJm7OYWI1fhw89iyxb+0SSi5Y/eLqU3rSL5AJHZShR8CFWQQov3hBjqlc+sYfSXRoP+s40Cf6CAEfxDk5mXIO7EMTOyFffyKJHvsV8S6SCB7GRi60FSr1ayh2fkP+OR/Kpt+n7A/omkEMPSrhdmhzjCCyvLqyWcfAo3Z63Xm5K0iKIJ79Wva9YSkA0AjejevxIocaV6lZv3ZYRsEnDNdqr2PtecVYXtJchB6Y9a0iXHZ4b9wT5TRCD3zDK6nko3XXR+uorzPRabtIMWASsigQWYPAOPgEJKl0TnytNKQkJ3Wermhr/8MmGh+AjMJfWNYBwHdOtcDWLINLmvLffEtVAjblXvul0txw4/m39Y9NR83U2N5MCpDw6SRs4PqmxCZmHibPP++03q/gPhgH7uUIJP3GDr/vwkuzpKcGk4WTfXHPMkfL3JjrsFK4UMgOqGNMKd2+kxV5HrJjMIQLQkSeXnSNd5SH8pJZMePI/YnGSYrEJMFZ9o9mzFjGgicX/lENE+gSkXLuX9Ioa9aSCyH18zO9uMVfUJMxzJFYxgprepgma/qLG0NJBxjwNQl3nSqmxw2/tT8rxxFmHCsQWd/ZYaY1JBPm5uhLSH/abx/sk1F12Cvsg5W0YFYviOe7rJfKA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(23010399003)(366016)(921020)(10067099003)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3VEK3VsTmU1Z1lvL2IwOGRWMUtFWmlqQndaOFNjbkoybG1oQlNiK3F3WjFK?=
 =?utf-8?B?Wm1MOVlreDlTR1VoZmhKbE9jRDFSSUpQY0ZMKzZkYUZoMkJvd0pYZ091dGVY?=
 =?utf-8?B?ZVdBSTVjU3d4Z3N1Rm5MUU5EeXI3WUhLQ1BBWERtTDBzWm1qbnFoYzBIcldL?=
 =?utf-8?B?SWVkdm5qcG5BNFFQYkwyV2R6Q2EvZEVEMVJIenFwK2hhOUVyb3l4bmorRVBJ?=
 =?utf-8?B?dDlOQzR3ZE5sa1dGV3A3dlBoNENHNUpLTzlLMmdIWDVFSnVaZVpLUVBqRlZI?=
 =?utf-8?B?OUFIZzN5MFpjOHp2SnFpWnlzQTNBYnY4UzJZR2owTGUxbnFteDNneEY4c2ZO?=
 =?utf-8?B?MVdGZ1k0YnIwMHpYVm5EYVRrbmVxaVRuRFVTVHVSWEhSWEVId2dVMUw1NXRE?=
 =?utf-8?B?NG9XY0hDYVBFUEFETnlESisyNVBOVy9jczZJQ1oybEVIU2kzWGVxaXc3ajBD?=
 =?utf-8?B?eVpiUmV1RHdjZFNDL0RFMUpZSkJNek5SZjF2YzE2SzZnMWRBQVVFMHd3R0FT?=
 =?utf-8?B?c3pGWEtjZ0lRaTZNYUlOb2lscDFQU3E2OFlSdDk3eTNqL3hHcVlxcGhHN2NB?=
 =?utf-8?B?MjZMbmk4TGhqR0s2ZlE1NG9PMnBOWmJZK0xXWERIZ05FQjVoZEpPWVZuUWZC?=
 =?utf-8?B?Uk1hK2ZJQnJhaWE5TmY1VFQ1QUtyNC9UQURTMGpieVZocUtIOTIraE1KMlVP?=
 =?utf-8?B?am9HN00wZ1NMSUdjUWhNcUN5cXAyR2M1TnQzU3d2MmZZR29hdWpkM0lFakQy?=
 =?utf-8?B?d1FFdGJPbnFReUZsQ3V4YU1LaEdqTG5ROEhkTW85bnlmOWdWNmxOcUo2M2lz?=
 =?utf-8?B?RU9lSjk5Z2gyNFJhcThROFBUVkk0WGFvTjhEbnJpM0hsVXV2RmZMUTlpSmtr?=
 =?utf-8?B?RUcyMkR3bUt4VnExSFlETTkxNE1MdDNxb3VzR08rZC9qcTBTRmhxN1JCNEtZ?=
 =?utf-8?B?bW91OFQvTWxZK0k3TklyTVFPNjN1NVhVOWd4M1lPRDFmZzZaOVpQVVBaUjhM?=
 =?utf-8?B?MHZxWk8weldsanU1K3kwVUM1VW9nS1BURDVTcmpyTmpMZ1RHOWxjNkRyMm90?=
 =?utf-8?B?U3c0Qm1kMUpRbEVGWko5dFM5anNicmZTTElJWVlPM3BseG5JZ1gxUXNneWdh?=
 =?utf-8?B?UXVvSnZGTFpicXhNM0hJSXlra2o2VThVODQ4K2RPdjE5N3gycjBCY3JlMEN4?=
 =?utf-8?B?a0RLOEdZeDEwL3hDWXBlQ1ZocmdTZ2N5N1lGVGswUUtpRWpXVlE0WGhmdnRl?=
 =?utf-8?B?U29YK1c1UmFac0FFYWV6MEYzMlpoaUs4SXQyV1Z4cmlUaXZ1MHhxeStLV1NQ?=
 =?utf-8?B?bVhUNzRvUGpCajk1eW01NDk1UGJ1RlN4b1JEeThLMXBiUE9nZmpwUkI5YTU5?=
 =?utf-8?B?N1BoS3pjaXBGclk4RlpLVTJjT3NMYndNZTJQdFhGek00R3E3Z1Q3c2dVUldD?=
 =?utf-8?B?dkdhanFYWFBGUXp6cGZCRmdPSGlqRU40cUlEQUtBMWpzOC9EZ1FWMVRObHJx?=
 =?utf-8?B?NmNvdU5lNDdPN1hLRlBMaHI2M0dTb3NKbjlYd2dEUWsybFk2d2p2WWZTNDJj?=
 =?utf-8?B?VTE4K21ZVFUwTFpCQldQYklZVjM3Smw5M3VIcmNBNGVRSlVpK0JiRzdTc3ll?=
 =?utf-8?B?dnViV3hOaGIwdjNUd3lxK0JBN1A0RUV6Q2FkdGFnaDNjRElnMHpPdGdRdEtq?=
 =?utf-8?B?V1RIWjhsRWtIeWwra1dBcHJJMGhoTTA3eGJzSWl2R2h5SE9ZaWcrY0JWSkdM?=
 =?utf-8?B?WFVOU2c1dkRLYkh3Q0ViNEdZMjY1bnN3SGlKVTVieTQwcjRnQ1JRa0U4bWdm?=
 =?utf-8?B?cEpyeUR6bkJ3Y0J2d1lQS1NiRGV2TzhvTUhUWkJRemhocUl4cmRUZEw4NSsy?=
 =?utf-8?B?OHExT2Izako1ZG1wVGF3ZWY4VW40SXhyYXl4NzZXS0pXQUNsV3c1ZjFheFFH?=
 =?utf-8?B?VFNXQkYxWTlQeFhJV2ZrbW5PYzlXQTdTdmtleDA5WHZvVHR0UUFDMTlGeVA1?=
 =?utf-8?B?Zmh5Y0N0YnBuVWszanZBYkxiZ1VSaXBibnJYaDg4YmZWWWttVjArS25OOTNG?=
 =?utf-8?B?TTlpTTkxNzNvamhuQ1RlWXc0ejRrWUs3d0VsRzlhbjhUQjN1YWZldWtiWGxS?=
 =?utf-8?B?aGgrd3ZQckhEU0NJN1BIL0Q3VWpTMzJLcVd0bndyZnJxR2QvLytKaElsbmRr?=
 =?utf-8?B?eC9XWjRQeVlZOWVoSitRSE1GQlVVZGhmOTQ3ckJMdU1YemFnRnJhWUcrVlZW?=
 =?utf-8?B?Rm5SQzBOaldOM2tXdXF3TnBVTnhJM2hXclo4bFpCajhuWlI2R0Y4U1BzM2wy?=
 =?utf-8?B?VEhtMVpOUDErZVppQUJaZXNLVHZteEJrSzB5dklaZHY1UGJKZjMvQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 04afef84-bb33-4a7e-79af-08df09cf1640
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 15:21:54.7010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1xILSibemUvG/QyQbFAUpxPig/AEY/E2FJoGsEGzYZKkhHXmHy4Qh19e7XilNJKD+ab3+K7Wpn/h8d9zEfpaNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2223

Add a mechanism to perform const trait method calls, with the same type
inference capabilities. This would only work for concrete types (not inside
generic functions).

As an example, convert `as_char_ptr_in_const_context`, so instead of

    kernel::str::as_char_ptr_in_const_context(c_str)

one may write

    const_call!(c_str.as_char_ptr())

instead.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
Changes in v2:
- Split from `cv!()` alt series, and become a general infra instead.
- Link to v1: https://patch.msgid.link/20260828-cv-v1-0-694a695ff17f@garyguo.net

---
Gary Guo (3):
      rust: const_eval: add `#[const_eval_only]` attribute
      rust: const_eval: allow const trait method invocation in some contexts
      rust: str: convert `as_char_ptr` to work with `const_call!`

 rust/build_error.rs       |   7 +++
 rust/kernel/configfs.rs   |   2 +-
 rust/kernel/const_eval.rs | 115 ++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/device_id.rs  |   4 ++
 rust/kernel/drm/device.rs |   4 +-
 rust/kernel/drm/ioctl.rs  |   4 +-
 rust/kernel/kunit.rs      |   6 +--
 rust/kernel/lib.rs        |   1 +
 rust/kernel/miscdevice.rs |   2 +-
 rust/kernel/net/phy.rs    |   2 +-
 rust/kernel/prelude.rs    |   1 +
 rust/kernel/str.rs        |  15 +++---
 rust/macros/const_eval.rs |  51 ++++++++++++++++++++
 rust/macros/lib.rs        |  39 ++++++++++++++++
 rust/macros/module.rs     |   4 +-
 15 files changed, 237 insertions(+), 20 deletions(-)
---
base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
change-id: 20260828-cv-acaf3400d16c

Best regards,
--  
Gary Guo <gary@garyguo.net>

