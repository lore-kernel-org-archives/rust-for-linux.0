Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010034.outbound.protection.outlook.com [52.101.61.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B733321A1;
	Sat, 31 Jan 2026 00:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769820992; cv=fail; b=M6CyElITCTyCnHz6f8RqbE1gesY0MHEIY+3Rw0lQVpWbyUTWkjcolyE4zhEn/GhhyCk7Dci3879LZcKqVVyoxf7+Ea+8rB8aaPN2O9xWFkfQy7IVblBJd49jNZzm9Z71a4ziRgH1LqXz1YiCv7MtipiGxAujEh8E97bsDVzdzB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769820992; c=relaxed/simple;
	bh=t0xPFIOe6Y+ZvppWzLqpFjJD7jkVU4g4fox4eLux68U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d3G0fj2Oi9Ko0rds2BlbcDv0MwG+m6ZkzfMHzFw5UU8vMBfTnc32puZLB9eUaPBsS1ofG47US72rOkyceqghPN8LZEURgGcfuejBC20/uHBuiwf7HqI5Ma2iv5/tFy3JUBvvvk9LhH8fM/WwjDdFnZXsHRi02c4hC5oyBnSG0CA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=B0tpk22B; arc=fail smtp.client-ip=52.101.61.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="B0tpk22B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZ/y2kiOy0WIHufZSjKXroPjLf/nw4DgO5XY6MNfm4X1upnUZ0zIxqRTHEFUodoH318cB/6it7sfAcpqA4++p8TqRTvu1bZ2ZqeFI29DAHR7liitow5a0C5uUSqZoT1INt6wdsPSNM0YaIbg3NGGMCueGJTDlWAlmt8aNH8RoopUPM0R0am28lqH5zD6F76pCqM9t9jEZxcjpsKFSh3ShDgqOk4ZAXwjQMr4UaIHRMN4n4EH7ELPq+MzFO1MQlwzTKkg1JX7zJ0gVd6PZt5OdEnvRFeG4i8Voq3M46qHwIXdOaodPMuAuGzk9IwHhJQ+bjMb105MJI2VxfBaWOEGMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8LURKWn5xkD94hz1Hy7wZy6PJZOiqjAVyiRh7Dq2iM=;
 b=alcJr/gOIoGs4y7+oAovG2IvLa1gj/+GJpmXnPgAi8pOn9mIfkG3p3CC+rEHn53amsTIlpXqzuUdAfXebpipgl8q+hwT/MrUDBw02OSsGq3CwCr1ggXu8RUuhV19W071X8fsgVeB88n10v43dvhjvznj5T66ps9GwXcrNwlnqZ8dznc55H8uMn5b7O1oUSq77oyGNBz5OlZk713uOIUTIaM3pyVSYWntHVSbQME6RwHoVn4rDLF6B/V2UvC3K57Q2fOGrtsP+4FEiubm2NXaf3I2WrVpZ5WBIGTjxeECErJqqLFyJx0yFN9b/y+REukaJmELPDATz7Htxm0DIhoJIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8LURKWn5xkD94hz1Hy7wZy6PJZOiqjAVyiRh7Dq2iM=;
 b=B0tpk22BeZcF4w6xRxsS3g9pRTJKL6naQa6UR89RvmIuB7gsUtrPwD6suJPJrEZh/U/iOkgExFhfHgtmuBSFK5RAB1Nhb0HAeST4cTT98iJL/XyJXhcseYsdON9wJ1XA246AS/3ie7C2tSbXczwJB6FiizvX2KwDXyAgtsSq7TE+NCgU9TJJ1A4miKESjbsTGkvcCK+lae1NYtX2Kti4KZtCoe7DrL39N5SUzotbYzPMmCKPM53sj50VcDTkmHD+5D8HWgqg9DE00kV2RyD5iSwFAd7YgtV2mM2MdRVIPN+hzILXM7fMzhMG+jJxwpNpKlaKLx6zfm3SI7vwHRgPVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:21 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:21 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v2 10/30] gpu: nova-core: factor out a section_name_eq() function
Date: Fri, 30 Jan 2026 16:55:44 -0800
Message-ID: <20260131005604.454172-11-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: b8b0f183-01d7-4973-787f-08de60638d04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/rkIXt7aS02KIDOgwpMdj8ieHgmRFcpbrP1EHvD4NV877/oPu2L2BTZZAv91?=
 =?us-ascii?Q?iSsi9Sc+hqQDEKbYkYENyXEe5yh02IT/ZmlpHLZqzeWOvtXT4WvXqbIswe1K?=
 =?us-ascii?Q?YIeuZKU751rqjpO2r+R+RPtAhZnugirEgA0MKVFH8Q7IRxek2WcY4s9L1D+V?=
 =?us-ascii?Q?ceaaJTtpXFOl3bU4x1MY+6rIKQQytQkx1U+sPTusvM0H2N3WIJfbs7MdOh2r?=
 =?us-ascii?Q?3l1Gxqipj9MpdJqh+2mw6/a0rWEMi4Ez7bc0bZ0Y2wa136VP7xzenS7aKBxr?=
 =?us-ascii?Q?8VSLSjrP4f55Eo2foCT1OJlGNrfXnUNKGQcHU6EtpWrqXE2WInjZv78PqXUr?=
 =?us-ascii?Q?vCv1wGilbEj8KZJDjHrg3Ph5K7bmvltkQW4MGYY9HvDKk3zG8wCaUswiL3km?=
 =?us-ascii?Q?H/RytQGK2eSWH5IWbAzfvwsNt33BvZS1SDgiITVyDGn6yPJFJbhR3WauLw8v?=
 =?us-ascii?Q?0aa3wsg2q5UyO8DlN1hOWJ/8bmsPUNW6t90O4l/1k7H0MgRlPdZdoVYVbVdr?=
 =?us-ascii?Q?Hgera1BmTuJ4Gu7Ah4IhRIJondM8b2tydFluLuTzRj/H96yWrRiMvvLVaJSz?=
 =?us-ascii?Q?XWYhfzoOYqdh9D8V6y2JegjkKzTmXQ9eNrA4F2UFLOy4F/JMnBSjWKLusidd?=
 =?us-ascii?Q?Myq/hLrqovoxSDaruCn8VR5tsEtrJTg3G9BzPIuDjV8BSf3BVqs4IgoSSfyK?=
 =?us-ascii?Q?h2df3zzsn7tK034e/jsWRS4glxi/MuuBg0G8oSD4aathokMk7JwyJE/7bsMn?=
 =?us-ascii?Q?mOE5UtQRkE7p/CNvhljWK4Gzh+75O9J6DOwwgSmWM28UlIKyBYL1D7VwBbNs?=
 =?us-ascii?Q?/Fx08aDDe3w1dKxIfgRi/fgzGqFEgx18fhOKy3smYojbJgb6Ospq3dKse2zN?=
 =?us-ascii?Q?/uv8PWzjKb7Pr3oLLHwuRa3rZmY7xSDzbL6luKizeu/AtX8MXcFUjgOEVlyz?=
 =?us-ascii?Q?ArSSbe6NnpHE1A2e0hDlYXUo+CUcagyWbi0zipBVoIZdJ0G5Fuje/qIWWTM7?=
 =?us-ascii?Q?D0SJnnTyzQXAcRzN69x3V8hC/dvyntWYgD+4vL2kkY7qFa62CaRt5De733/v?=
 =?us-ascii?Q?81udBfjO1BiVz5C05cbpnMFjQL7J7by2Y38UqRB7nQHs4YdJ0i2Ldo1q+loT?=
 =?us-ascii?Q?h+mV6m24s/VRHUHMNocR+x6mYNYMcrJt+ea+FsXZot7o4otBVvlzRg6rqE48?=
 =?us-ascii?Q?90zvDXr2HvQYOqJvnk0vw4x/S1EuCseUAh1kYVSnl7Nvkyd0xAMqVDHPy8fi?=
 =?us-ascii?Q?INl6YNPdKHUD5rTy1AkzyN8y3fFHUMUGTPAF6WECHamwHv6holjxBfN/4TwO?=
 =?us-ascii?Q?WmwsBtmmhuZG/pZUbph0dnXMJPKxmnixoHlBPPGRS/Z9Pcg/Oiku+Irhl9CT?=
 =?us-ascii?Q?f/vi7TpkdVegvUdYezbE5sqgsEsbgq6XA3UrkLX96CVDkT5L/kaUhPvPWy7f?=
 =?us-ascii?Q?L221uMbyDd4XKQlyRjes7jMAdX+hh8SKot117sZVThB5JyfXu0flDXySTNVG?=
 =?us-ascii?Q?gQIyXhWcQ5MXjy4dSCiM5GMRSZv+yhjatGhzak6aLa9KhPMQSeQrkI1DFsLV?=
 =?us-ascii?Q?dkvtqGVxDXFWW/dszbg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QvjdzK0r1i4gE3sYsmxqFOfTAK9XxpyuEzr30ofqftqOGwa2S9bJ6Qy2jdMe?=
 =?us-ascii?Q?eO7yWiHkXiRJw1ibVl17zto/9AU6gXxmjPrSIeHxpuarebrMHSBYGnzyFfD8?=
 =?us-ascii?Q?P8F5bjfIJPt8WvyopZxqRC3k/JbbrhH5pFDzLz/uVkTw0lDNaPEQhnFWWVKJ?=
 =?us-ascii?Q?OBHeBqDC0KjsIUUkzzypMATEo/V3jJ+XSuGifCAK8cx2Hlrhr612t8MPsw3d?=
 =?us-ascii?Q?A1UugJObG1smD0+NaQ+DLyPyK1UDt9hFKjVVTji1CwERQSlHyNDF6xmoFoER?=
 =?us-ascii?Q?0pl+luRcdybuNbQs5KwI+9fIVHUbfZcG5N/PIT+/QpyATiDXgAsiqqV/A4A+?=
 =?us-ascii?Q?wRwTjCnGVd7a/tOfgJgAdS73UmcrwGJ5uFBuvVSOaTh27p4d4a9jmjQk2e3s?=
 =?us-ascii?Q?WVNgIb39ZDPQjdWkDSeZQ2PCxR1S09AZb3y88JoUlsR7lAM76Vun8BZZaz+r?=
 =?us-ascii?Q?jZFuNQKcvk0PZLn2XXSNGFgiifdltmt1SorOe/H3NfYpa6MKI/gAR8Xyr6Ez?=
 =?us-ascii?Q?3hPUUWYodXpJlqDF6b2dXpGhvBasc6WyJNcNxwOT0lKDcczZR/XFR2RszCin?=
 =?us-ascii?Q?C5tyO0nnKdApmXURwrGDTnukdviRCVr/6XlkZvnyd/7w6bs24n6JtEUZbG8C?=
 =?us-ascii?Q?nQ9dSsYdcwkOLQsls1JInZAzEB7WAJMxiWBxj4h3uxu0sAzDd+AKLReDnXrm?=
 =?us-ascii?Q?RK7x49v2pgMSgkB3vb1dhTu3CtwITpBRaba9PvfgCzR/Io7OJOSKKvMzReE6?=
 =?us-ascii?Q?QhnilaBQtA1xwLIVfygSRScOjHf8N9M5zdeA6F+MsUZsHNlBzMaD8IGHiaBC?=
 =?us-ascii?Q?urO7Z92GNkYPXcufoj2HNgXIV7pHnXiTG7xuvhVr8woAHfjREDPbwErEhCjc?=
 =?us-ascii?Q?QyTVm0ex0hrYt3A/zQm3otK3lyQ92IxoC1hm5egv4mpwGbf+umpebcGXnhRk?=
 =?us-ascii?Q?9EvsqXc2xFAaAOJVnEgkpBHjpeSTVm/cPSIKpsfcXP0hPoQFTwQQS3KT3zMT?=
 =?us-ascii?Q?G5gmhPtnC68VJXYSjchXtmutZh+gF0DpDplyI0ppj3DhH+pXEYJsgyI+A4D1?=
 =?us-ascii?Q?pJ+vuOYnr5Cj2gC9p7d+J20GxhUMTlgLNGfkP//07OP/IFVNjoIPi7i7Gxgz?=
 =?us-ascii?Q?B0KOLNS3lnAmo1oxIEnAsPYfXi/LWJ8uf4/stnwTS6F5XiLrUi5yavU2qXcN?=
 =?us-ascii?Q?pYflA2C9kTN5BDPw6UHuadQ+8Nh9q2IrTqXUJVKE7YcmWZ9IGYApMjvjYV4E?=
 =?us-ascii?Q?Kn/TFetmXkRCiTAHT0BglT/3Z/vmorBhk5Y2EiFYqsmOxW3esV3brwNc2eqF?=
 =?us-ascii?Q?i4iTPfvBVcr20hIM1gpFmTTEePBN0bLyVSSL4X64zqhgDMkKwgH7dc6FteT/?=
 =?us-ascii?Q?V6l8chBSU/NyG7i0qOWWJmfD3dW20xXX0/GUwLPv3ndxgxRac5KsfZ+DhbhN?=
 =?us-ascii?Q?vpmUM1HAkGCsL0jLR6HthDCNj2gdAY7YNZdlXFldw0boa2gfC+FF6xDE2BbO?=
 =?us-ascii?Q?mG+palmmPU97t0y6WLmDA2RY1MwfHkEOdpIe6dgC6gr63hBWOPvbx/r2KMhD?=
 =?us-ascii?Q?bmKEBeUfimterX7IHnGNXAyDYRv6OvhPKqUpcxt6fLcDULQ+1qwwFNb1DVXE?=
 =?us-ascii?Q?GNrUwcZlD6AsvOs9lcRRL8fV64kU0XustOxrSE+2m1aIr1KUh9tQzIMYB9Mj?=
 =?us-ascii?Q?i77jzi0syKLeURw0RIbcZ9uWPxMNsO5teoJqllSbui6v3xvagBbvFzjuqmKt?=
 =?us-ascii?Q?TrH65F27mQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8b0f183-01d7-4973-787f-08de60638d04
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:21.8465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u0beW32h4ZmkNENibdNvosC2piWBRYOoOYSA4EaNAYdcXqpAJEUX0BN/S5oDU3JgDC1BpzF+hDftklW4znHQgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945

Factor out a chunk of complexity into a new subroutine. This is an
incremental step in adding ELF32 support to the existing ELF64 section
support, for handling GPU firmware.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 40 ++++++++++++-------------------
 1 file changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index a0201ac8ccb4..72cefc3142ea 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -464,6 +464,13 @@ unsafe impl FromBytes for Elf64Hdr {}
     // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
     unsafe impl FromBytes for Elf64SHdr {}
 
+    /// Returns a NULL-terminated string from the ELF image at `offset`.
+    fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
+        let idx = usize::try_from(offset).ok()?;
+        let bytes = elf.get(idx..)?;
+        CStr::from_bytes_until_nul(bytes).ok()?.to_str().ok()
+    }
+
     /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
     pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
         let hdr = &elf
@@ -490,32 +497,15 @@ pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a
             .and_then(Elf64SHdr::from_bytes)?;
 
         // Find the section which name matches `name` and return it.
-        shdr.find(|&sh| {
-            let Some(hdr) = Elf64SHdr::from_bytes(sh) else {
-                return false;
-            };
-
-            let Some(name_idx) = strhdr
-                .0
-                .sh_offset
-                .checked_add(u64::from(hdr.0.sh_name))
-                .and_then(|idx| usize::try_from(idx).ok())
-            else {
-                return false;
-            };
-
-            // Get the start of the name.
-            elf.get(name_idx..)
-                .and_then(|nstr| CStr::from_bytes_until_nul(nstr).ok())
-                // Convert into str.
-                .and_then(|c_str| c_str.to_str().ok())
-                // Check that the name matches.
-                .map(|str| str == name)
-                .unwrap_or(false)
-        })
-        // Return the slice containing the section.
-        .and_then(|sh| {
+        shdr.find_map(|sh| {
             let hdr = Elf64SHdr::from_bytes(sh)?;
+            let name_offset = strhdr.0.sh_offset.checked_add(u64::from(hdr.0.sh_name))?;
+            let section_name = elf_str(elf, name_offset)?;
+
+            if section_name != name {
+                return None;
+            }
+
             let start = usize::try_from(hdr.0.sh_offset).ok()?;
             let end = usize::try_from(hdr.0.sh_size)
                 .ok()
-- 
2.52.0

