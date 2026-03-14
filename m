Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012040.outbound.protection.outlook.com [52.101.43.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194E51B4244;
	Sat, 14 Mar 2026 01:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773450394; cv=fail; b=fRZ+HP6/p0AsWSpau8GgYToUpTLrxGpp8Ml7d0jEDBTpkBQ9rAiFa+/TnSufgkCSS6FUpe+PySBR/YEO0ihVZlXKWvfjh8EidH+Oc6kk/FkFAZjEnIog8bH8Tmn5TmlWi/SIIECbEGGTbQFgAo+x1MzGFBlHMnKbv8WErRkjI+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773450394; c=relaxed/simple;
	bh=ZdnCkdt9X/p3NRwC3kG3NNbO8UTCGnlAUUPeKuqJPpE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=K5/2iJ+KItmIa0t75sF9Mqx+GsSpR/iq7BAXDpqxv6PuqLIpbZywiQSjGlL8AcCCvb8xC/IqOLoD8WWzTH1cdH0aNDJggF8iiuJJPYKI14KhEJh9C7Pc8qaXYduW6OQ8McjnRjn18Y0TX5N0L800M414c5+O8G7S5u5LssP3zrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Kt8rEOhb; arc=fail smtp.client-ip=52.101.43.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Kt8rEOhb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Io+bMpJB01rbfqky8Rld2IvG/x2FobzIL56wAZTpObc7N9A0pBQPzWOZkaI8Qprb2JuLqXeR4ga59fspKU4kalYvFLyFRm1m7Ddn8HrEJLXWwb2dVAU6ejoLY5GHKqO7HYaYzliwyfuNbwJsW1dF5ABBNdvnOofxOHcXJ+bNS0o0eHIV8021+2AjTGENiw4UaoAjFygsCAaMPO6y91MU73NHA7horyhStjhT13fVb0hYm9SLDlX+efcfbvCGrU8stHAD6XlZsn0c/6HsmIcCjl/hOE5SwoScT4JIVKrXSUhxO8trqSsWlbQQqhYsQLa2gQ82RnZELXh/3SMqp117PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gf/0JXtgn89S05w0FbT/OZyah3o0Cn5IRhPnIepBas=;
 b=TxQllyALh04TcRyVXrffR/DRp0nmjCecKwyD2fcKIZgzoRgXg6sapPZHTzaybUbdZTw65ai5sTYyVJzeJT7BiWP88PAVuZdUi3prNUjlkWH9CtWfiptBfbSrpxSczzRIJvyzGR03cnH5+Wphf17Q7VuMjYjpkq0PatQmT4aeHoO99JUmdn66sUXhZG6UmwHLxON34RlkF4kZoQhz7vI/lH5WxMjNPrtnJK0MWEXJs8DU1WYboCFGo8hLOywhHam2czbdApmcwNv1S2EI7ajqQJ/a2a8aEQlRtAsTDwFDAzyBZY7pEyPyFxuPLcDUp44O8GY2pVHABmkW4xaNGaOrWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gf/0JXtgn89S05w0FbT/OZyah3o0Cn5IRhPnIepBas=;
 b=Kt8rEOhbvosUJYAus4HJDToQOS0JoqE2VMwZtIVpR6VCMUu3hFnxwv06ZHVFyI9fAXkKDDHCuqrmgO83NXmI4pmt/3SEQBBHFyxGrRN6clWsOr5Sk4bxj4BEYhxR20SLmM6ShkLnp/HmVKk3/QVpyS6Ii4ug18sWYuhS8WgbtDIdeQ4PccVmpcZCXKXtg2FKwV9wqtexwd4rmLm4X27X6hgyS2oQRt2D0nMguKyE5+E7/KjzOF8MEwyRP7VvarctvrbKOqzLtTX6QJKhmgSBHk1nCP5XuuJF+IshtfXBuPSnF7Zf4H31hJlhHp+aaSmGQlQbGfENYn8HwIEQUtSRDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4033.namprd12.prod.outlook.com (2603:10b6:a03:213::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Sat, 14 Mar
 2026 01:06:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.000; Sat, 14 Mar 2026
 01:06:27 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v9 00/10] rust: add `register!` macro
Date: Sat, 14 Mar 2026 10:06:10 +0900
Message-Id: <20260314-register-v9-0-86805b2f7e9d@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XRTWrEMAwF4KsMXjfFkvzbVe9RunBsZcaLJsUpo
 WXI3esMhbgYr57R9xDoLlYumVfxcrmLwlte8zLX4J8uIt7CfOUhp5oFSjQSwA6Fr3n94jLEGMY
 ACcECiTr+WXjK34+qt/eab3VsKT+P5g2O378SlGfJBoMcLFIAq2jU2r7OW045PMflQxwtG7YSG
 omH9MmPLmkmEzpJrTSNpCqR0AXtkyXATqpWukaqKgMzBaLkjfKd1K30jdRVRqWdjV6iBtVJc0q
 EdltTJXP0QSX29XXSNhJVI+2xbUhKTdbIiaiT7pQE7VVclQrV5GRK9S7xn9z3/RcPrBXkNwIAA
 A==
X-Change-ID: 20260117-register-ccaba1d21713
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <ynorov@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP301CA0030.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4033:EE_
X-MS-Office365-Filtering-Correlation-Id: 141f29d0-6242-4206-2b82-08de8165eb65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MYoSvBxZZwT3IZvAvytgUPhtcLuoD/8/8ms4vsP2jqlF828efqm0lN3AVirlBq3JUKg4ZmpO/BiGCPuU5CfRXofwiq5dTo3T85F7c94sDZ9pT2+dVNPDh8/ONlakqI/zmQtu5uaNXGx7IrWctpNiHlV0quIkRCAs9xlcEkbnNestzA4wiS06HMuGuDFR45UvNxpsrOog/MD+JFXOI3uRXXH1SufTnkTKAYxi5ECAyd4psh3wAtpniu75Xq+QxWhQOa51Wxk4IK0rVNs7vd1uSmOKTworTcF+FJrRsFC6KlLGiUx9abmX9xHXEp/NhXwwYaRNFkRwQu8w02iUv5jDxLZLziXWDUlANpZ6AcBHrfnycj7PEljcE5ZgMBZm6cNobfcLFr6YWjYC1d5cxXUsGe3raOrRmyOVEjZ2SbBUismZianWWyy8NmHsjCH8HNtIpmkjtPm/loiOrd0uXtk5Sza+IakoV6berrmfg7veQB0T5wbqSnsQTkW2jBAoV5IAo6KGsSTlw+3PJTlPjDTeLisR9H1mToIedXQq35ghmVvZlA7ccL7CH/6+TpOPoOcRYzE29rR9q5nLe8oEGKmrV5bncO9lpnC12sHzR4l7/V/vBVQm4RHyLG+ZWnShcbbTziy6Z854RJXWxQzQxFbiCXNDJ1LoEBt4HfzN48WbWid4IGLc2UbxiBO3Lh9f6DQpsUlnTgwup82eQCRQ8mOP2l1Jn9FrUr+7oLrR//Of9IGgnpqTNUluRqBLkiH+3eobfJGCUd+Maea0jS2QQKp4nP0CiubRbzMhlmuWCQFb9co=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2k0NUhqSk5tR0lYVzlzbXNJVXJMc0orVGxIZUYzbmt4VXZhcDA3SFQ1VmIx?=
 =?utf-8?B?R1BZSHlyNG5YTGpidEdKK2loaG1FbkhQM2V6ZE84NUluTjJhaGF0MHhyZzY1?=
 =?utf-8?B?SjFqSlpSaVgvdWFxMjgxNzF0M0R4MzBFenRHc2ltN1ZMdVpnNGg0aXlLL3dH?=
 =?utf-8?B?MlVxQ3YwWkt6ZnBqZ0pOMEhmZDB2YmZtaUVyVURHQ1p5Y2NwYVhIbkZkRVRX?=
 =?utf-8?B?Q1ZpUG1sNTk2cXg4YUpEUEJTTUZIVDNUbExOOEV4SzhLL0svcHZFM1diWTc3?=
 =?utf-8?B?UU1CVlVYb0ZEMjh4NUFpQVgwclM2N1VvZVEwNmhhSFJMNUt3Z2s3YXpQTm12?=
 =?utf-8?B?ZXhubjBsRVZnc0VGSnkveUYvQktza3J4TEtGeThFc2xlV1VLTDVKUnJkMkJq?=
 =?utf-8?B?S2c0TVRkaWk1emRyMWcrdDJFRXNJTGRkRU9iU2F3TXBsTjFMU3MyOGRRam5h?=
 =?utf-8?B?YlpGbmFrcFpXL3FxNWJKd0NUSldRa2ovQVk5QW5RbUY0SWJyanNBVTVtQk9J?=
 =?utf-8?B?U2RjeGtabWl3NTgwNU1wTmFONUJyVkFNTElaSTIyNDdNQS9vQTArSVFiZEdJ?=
 =?utf-8?B?K1BHMUNya1p2b01YWXhueG9FL1NNTEZ4eGF4b1lRcmgxL3ZEVlNtTWdHWjNC?=
 =?utf-8?B?TUlQMmhPRU8yOFZXdHRzdE5pQzA5S2wyWlE5a0VJMmoxNXBqWGF6bDMrK0Jn?=
 =?utf-8?B?NlgxM05aY0Q5L2dlUVIveGFMMTZneUloWFRiWW9jbzNRZWNEd1diS1VWUmg3?=
 =?utf-8?B?alk2dGJ1d3VHZW5UbVE2WU1waWxGbnlkSXZrdTFmcGsyTHBwOEdLSU9qZlVJ?=
 =?utf-8?B?RTN1VC9TTVdVZTY5UW5KaUN5elFCcmxtTDBldDFYVm9aSXlwNjFobjNaNzk2?=
 =?utf-8?B?VXRQSnc5WnphZGxlc1l4OVcyeUwySThLVjg2UXo2eTRISW5TMk1heFBYbFlH?=
 =?utf-8?B?cGRNZjM3MUdsV3BkOXE0cm9Nd2hXRE40NUZ6Y1ZVTFVkQVoyVGR5R3d0RXJ3?=
 =?utf-8?B?eDBlNlBva0l4Q01wQ2V6MmdXNHJQejFra2dJY3hLbjhISzdnK1c2K2J1Y3Vi?=
 =?utf-8?B?SloyM1hmWU8ybDJMM09wWkpGU0I5TGJDK29nSW82aTM4Ym4zd0xYNWRwbFJh?=
 =?utf-8?B?SlgwakMwMGhZNCtiVmdGbnpxRFkzalhDMkVYUjVNeTR6YnMzWkdWa1ZoYldh?=
 =?utf-8?B?YmpKL0lucHRLWkVLT0VNSlh5VkRIcDF6SktpUXQ3M1BxL2ZFOGdNTURFMDk2?=
 =?utf-8?B?YU8vUGUrb0Vnbkx2emR3c1VPdDJST3BCT0ZJaGNqdGhObzk3QWduNWx0Q2d5?=
 =?utf-8?B?RnpCYytqZENaWjV4U1drZWUyREhqbnhkNldvRjZFa0F6MUtWZTdtSEhodHhi?=
 =?utf-8?B?WGowVkpxV0h6aW5jMCt2Z2x0bDcxdFBPRmp0S3Z6TGJ5VUh3NVZuQzlSUFh0?=
 =?utf-8?B?TEJDRzlvM3YwejIrWFdCY2RHbU5RUC9EbjVHOWZWYlpIMk9xVUROUFVWbjZr?=
 =?utf-8?B?ZTduK0tCdkFJaWZMUDRkNzRMK1E0RC9PUFF6aS9kcmp2VFlXa2hUc0VYd2Fj?=
 =?utf-8?B?eW4rUzZuNnhTbkNoVndlc2ZyemRGTkc3STZJa2tTZ29xVDIvRWFXa2NYSjd1?=
 =?utf-8?B?eWVZYmg3K3NqTjgyaUlDK0NXVlFkWEw1K1EvZGpwNFgybytJSm5jQUtGTDNx?=
 =?utf-8?B?Vlc5WWk0ZWRFcHFpcnAwdlpLTE9PUG1YU3lXNzYvVjJITWt5NDVvRDZXd3kv?=
 =?utf-8?B?ODBrOWFhL0Fod1l1M2EwQWhIQ21kMktMOHVZOHhxYWd2cHVxZEpXeWIyQWpZ?=
 =?utf-8?B?N2hxTmhtZ1cybXdvQm1MNjZOeVE4OXJoTnpoazFVb3ViajV1a3ZDR2w2T01E?=
 =?utf-8?B?djRiRzZSK1BGTHNyRXRtWU1EZ0x6b3UvbzFsVkxhK2NHUk9yWmhtQnUza3R3?=
 =?utf-8?B?QXc0OXJoSDFHZDMzblpaRmpnS29jcjl0cTdNTjVnUGdid1ZyOVB6dEFubytx?=
 =?utf-8?B?a2oyMENnTmRpNU1NT3FZMGpjTWZQWThzQkhmR1NOeUtscE4xblkxVEFxa1M4?=
 =?utf-8?B?SWdzN3JTaVhlNXJtbVdzWWlGaTJPZldQZzJobGdFRGtwdEdSc0U5aUVZRFox?=
 =?utf-8?B?T3IwUzV6aE9xOVRTZk5IZ3JiWFFSaTFhOGhxa256VlhkQ0ZPZDZmcExaQVFt?=
 =?utf-8?B?cGMzOGk1eXY2SWlhNzhxU0R4dEFHTlBqU0VKWGxNeFZ1SWV5ZEFxb25pTzB4?=
 =?utf-8?B?VWFoQUdoSE1wLzBTRGJaY1BPV2xRQU9YS003VUpFeHJlRm9kRldYU1gybXdr?=
 =?utf-8?B?R0lTLzJkL0E5ZUZ4VTZNTDRDUWRXYVViREk1TmpqODlQQjM5KzdHZEJjME5I?=
 =?utf-8?Q?9B+t8ojZT2X1e2tB+xYfh9yAngeSR08k55WEySUKwUy0o?=
X-MS-Exchange-AntiSpam-MessageData-1: DmkE8+gSQ111Mw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 141f29d0-6242-4206-2b82-08de8165eb65
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 01:06:27.6913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kfJsZFfl3bm+RTkYhoNpTbCV7i7W4uwiLp/2jCo/649Sw+uKO35LPdqdrmVLM3Ujl4n6mjttWuUy/qad3BPi/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4033

Further refinements on the latest design. The most relevant change is
probably the renaming of `write_val` into `write_reg` and its
specialization for register types. All the other, more minor feedback
has also been addressed.

This revision is based on `driver-core-next` as of 2026-03-09. The top
patch also depends on `drm-rust-next`, but it is only here to illustrate
what client code looks like.

A tree with this series and its dependencies is available at [1].

[1] https://github.com/Gnurou/linux/tree/b4/register

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

---
Changes in v9:
- Make `IoLoc::offset` take `self` by value.
- Move `IntoIoVal`'s generic argument into associated types.
- Rename `IntoIoVal` into `LocatedRegister` and make it exclusive to
  registers.
- Add missing `#[inline(always)]` statements.
- Move some of the `register!` documentation to the module level.
- Publicly export `register!` and `kernel::io` and use this reference in
  the code.
- Properly format imports in doc examples.
- Re-word note about race conditions of the `update` and `try_update`
  methods.
- Fix build error in nova-core port to the new macro.
- Link to v8: https://patch.msgid.link/20260310-register-v8-0-424f80dd43bc@nvidia.com

Changes in v8:
- Use two-arguments `Io::write` with a convenience single-argument
  `Io::write_val`.
- Remove the `IoWrite` type, all helper methods of `IoLoc`, and stop
  relying on closures to write values.
- Add traits for specifying relative and array register locations.
- Improved documentation and examples.
- Link to v7: https://patch.msgid.link/20260224-register-v7-0-aad44f760f33@nvidia.com

Changes in v7:
- Use `RES + SHIFT >= N` instead of `RES >= N - SHIFT` in
  `Bounded::shr`.
- Rename `IoRef` to `IoLoc` and all related types
  accordingly.
- Use `Into` trait bounds in both directions on `IoLoc`.
- Add RFC patch allowing fixed register values to be used directly with
  `write`.
- Link to v6: https://patch.msgid.link/20260216-register-v6-0-eec9a4de9e9e@nvidia.com

Changes in v6:
- Remove Tested-by tags as the code has considerably changed.
- Make `Bounded::get` const so it can be used with registers.
- Use the `pin_init::zeroed()` const function instead of defining our
  own method.
- Generalize all `Io` around the new `IoRef` and `IoWrite` types, and
  make registers use these as well.
- Use the more natural pattern of having the `Io` type perform the I/O
  access instead of the register type.
- Convert the whole PCI driver example, and not only the PCI
  configuration space.
- Rename `Bounded::as_bool` to `Bounded::into_bool`.
- Drop `Bounded::into_inner` in favor of making `Bounded::get` const.
- Link to v5: https://patch.msgid.link/20260129-register-v5-0-c4587c902514@nvidia.com

Changes in v5:
- Rename all setters to `with_*` and `with_const_*`.
- Use `, stride = ` to specify the stride of register arrays.
- Remove `Deref` requirement on the `RegisterIo` trait and make it
  `#[doc(hidden)`.
- Simplify the top dispatch rule a bit.
- Link to v4: https://patch.msgid.link/20260128-register-v4-0-aee3a33d9649@nvidia.com

Changes in v4:
- Add `with_` const field setter methods (removing the need to call
  `Bounded::new` for constant field values).
- Add `into_inner` const method for `Bounded`.
- Add `from_raw` and const `zeroed` method to create initial register
  values.
- More documentation improvements.
- Link to v3: https://patch.msgid.link/20260126-register-v3-0-2328a59d7312@nvidia.com

Changes in v3:
- Sort the Rust features list alphabetically.
- Rebase on top of latest `driver-core-next` including the new Io trait.
- Allow several registers to be defined from the same macro invocation.
- Remove references to `bitfield!` macro.
- Fix doccomment of `shr` and `shl`.
- Use `+` syntax for relative register offsets.
- Move register arrays size and stride to after the backing type declaration.
- Use regular doccomments to document registers and fields (thanks Gary!).
- Remove `Default` implementation and implement the more predictable
  `Zeroable` instead.
- Improve doccomments a bit.
- Link to v2: https://patch.msgid.link/20260121-register-v2-0-79d9b8d5e36a@nvidia.com

Changes in v2:
- Remove `bitfield!` and put its rules into `register!` to give it more
  time to get reviewed.
- Allow output type larger than strictly required for `shr` and `shl` on
  `Bounded`.
- Enable the `generic_arg_infer` feature, required for rustc < 1.89.
- Link to v1: https://patch.msgid.link/20260120-register-v1-0-723a1743b557@nvidia.com

---
Alexandre Courbot (10):
      rust: enable the `generic_arg_infer` feature
      rust: num: add `shr` and `shl` methods to `Bounded`
      rust: num: add `into_bool` method to `Bounded`
      rust: num: make Bounded::get const
      rust: io: add IoLoc type and generic I/O accessors
      rust: io: use generic read/write accessors for primitive accesses
      rust: io: add `register!` macro
      rust: io: introduce `write_reg` and `LocatedRegister`
      sample: rust: pci: use `register!` macro
      [FOR REFERENCE] gpu: nova-core: use the kernel `register!` macro

 drivers/gpu/nova-core/falcon.rs                    |  333 +++---
 drivers/gpu/nova-core/falcon/gsp.rs                |   25 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs          |   70 +-
 drivers/gpu/nova-core/falcon/hal/tu102.rs          |   12 +-
 drivers/gpu/nova-core/falcon/sec2.rs               |   17 +-
 drivers/gpu/nova-core/fb.rs                        |    6 +-
 drivers/gpu/nova-core/fb/hal/ga100.rs              |   37 +-
 drivers/gpu/nova-core/fb/hal/ga102.rs              |    7 +-
 drivers/gpu/nova-core/fb/hal/tu102.rs              |   17 +-
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs |   19 +-
 drivers/gpu/nova-core/gfw.rs                       |   11 +-
 drivers/gpu/nova-core/gpu.rs                       |   36 +-
 drivers/gpu/nova-core/gsp/boot.rs                  |   11 +-
 drivers/gpu/nova-core/gsp/cmdq.rs                  |    9 +-
 drivers/gpu/nova-core/regs.rs                      |  616 +++++-----
 drivers/gpu/nova-core/regs/macros.rs               |  739 ------------
 rust/kernel/io.rs                                  |  411 ++++++-
 rust/kernel/io/register.rs                         | 1258 ++++++++++++++++++++
 rust/kernel/lib.rs                                 |    3 +
 rust/kernel/num/bounded.rs                         |   70 +-
 samples/rust/rust_driver_pci.rs                    |   84 +-
 scripts/Makefile.build                             |    3 +-
 22 files changed, 2416 insertions(+), 1378 deletions(-)
---
base-commit: a985880eb0f73b0d497d30dcce73e537f787b6c0
change-id: 20260117-register-ccaba1d21713

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

