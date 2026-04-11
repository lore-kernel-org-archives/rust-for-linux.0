Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011065.outbound.protection.outlook.com [52.101.52.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D94DF6C;
	Sat, 11 Apr 2026 02:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875815; cv=fail; b=kNZS2h5vPtsMnR4MvZrh/1U+iBmf7cSdGJJII/xJ26jJX24EzlBmn2vxjVkZWllxg7ZBvot/yhtM/kQJMEQa7YoaWWO4855wMdvE7cKrbU6Q9uUozlHTI1bSngnCwFHS0iN44L4oh88j2stWPzLPrqj9wxNVDzuTLo+5siMIrVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875815; c=relaxed/simple;
	bh=B0D/rU3er7k9rB2vxYmr2TIe/0Utiuniv7G6CkinCng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OuunAsa7eIp9Snz/hDa46nCZmGY+7iy3H0YOVfV+gO+J+YDZn0UPiybNIiViefXqGQhGlAETA/sjGQiE0MZaV4giwosjrLYiyqaC/SFRZB3MdLAfILrdh+2sz/OFxpkbJPJsLqh6pUgHVJ/XUrjzE62PonRGXP677hnt4h/60AE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S513vN5j; arc=fail smtp.client-ip=52.101.52.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S513vN5j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V7efPFj5ka2KKH+812CiJhN8v9mansRYU/GtZPNjwargIfSuUUp1YJdu5WsPT3fb+eDFKckfqDjIoMtj/XMbVGww1I1+BsunriJWwhGR34vcrKzS00WJ5Qb6xPycRbJ8z/XajipTUURD8KskT+4xGo8U8mNU1Pn3wK98vsMRyLdRg2hhjVFHmyhmJ07s/8uyn9CKe94qlkODFL32l/bxBEWQxNH1EAOjX1hmoFenuobXwoUi0kK+hhlECn7rVpY7BI9CkBL6FTLW239FAvvEpIk5z/YTB6JNTsKD7GgRdElp1lmgB/bz6oJ2UxSJrHFtU2Qs7NcanlxKvg/IrQIwvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Br/tpknAxzp6BFJjA0Gdft+52dSwLyMi/+5WsfAaS8E=;
 b=k9kz6uy/ByxXA3Xs6/tqS8R8dryp9Ru3c59+ZduAS/dsZyEiFfEosQ3VIlKuO3laBwilsl3RxZgH+xxGYjIakyWwzmMJdmD2D9caeOviTZm/k+otRc/M3sI/qeyYoRMI1eYBSQkqxAdGwbE/daQNvzBGWKuQId1FBqaNOWeqWBZ0vObnBkZuzn3yXdDyySNwIBZNh2g5N0XiOkP1b4Ltjz34VX/WTpbCsiNTfyHUxHlrOhips9okyVuhAE2z+L+dyHuoLgQ1CvOqnAdxpfWnlz4EgLZoPYOxPBklcE7K77Gf30uPG9p7ZMYMCHq0mQ1vzuk2vbs2InygP8w4hNz0Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Br/tpknAxzp6BFJjA0Gdft+52dSwLyMi/+5WsfAaS8E=;
 b=S513vN5jlIOPzavCWdgW1+OBTVyciGW02125iPrFGYnXCK8FBO0mcHAiAeAryWlY5cZY1njRWzqm7O7/2avLUuqMojopVj+hIUCaDuvEEh6AA+0PPXjPkHi/Qwrh9aS3mRxhEY3dOStKGkc33KXyfE74jDhZT7WvflHZlpbcbyvLSp7UKfOCEwARpe8VSI4ZIcSnNql+9fHTJxzsv8TcnQxRIqkmq1/2PsbIUq5vWYEACIsHq2SB9uUwVt8ywKNCOtd6rrucfUMNmIqHmOxT68PEKB+ZJ06zjpKuT+Gc6vy7eP9hLc2gDAnR1yL2TEBrL8RVoQ+fZfbiss1olLHxjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8794.namprd12.prod.outlook.com (2603:10b6:510:27d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.15; Sat, 11 Apr
 2026 02:50:00 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:50:00 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
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
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v10 03/28] gpu: nova-core: Hopper/Blackwell: basic GPU identification
Date: Fri, 10 Apr 2026 19:49:28 -0700
Message-ID: <20260411024953.473149-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0024.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::37) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: f8698a07-7728-4223-b96d-08de97750613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OCy0axTizt3uNqkMcT7SVnBwccIWCZoYOuzlemqWs4/Yo4F9FGnRnEoqZgbNcXacAS9gpjud5EW6IvZUowUtDKlUOJ5a8tJYkmtZGbF5/bUn6QpAEuAb24ulExbW56fx4B9lwy7+iPDU+3vY938feuZy76MTT4nnA1uTBnmtQpmT1dZ7jHTCJYpQCTXQxYB7G9xjJ5bXuU/ttopYdqNeVwpIzPIZmXCk4F4ufdjhuAcI49oADYOrD6d4JRkH7phTAE1XevMXVV3pWI0QJwjyd2AZidsAPoC2gLWOL+LFdYfnxRokJZ3EnrpNj2iNWgWdHS4lIBk6WLffdzW3Mkk8gAD545ZZ1gVj8xS5jfXJbUHxQ/2SuC/vSVsHVko6fYHHUolHJJ1XrieE1xhaMCa58qBW3nEt82LXSIreauX9RgsH2ZhBLybSuheNiyiXQHaVIt4ytXL94/L14NMuKVnF5GjcctbgmbHajciOeCyb8e0ykMt2PGPNZaaLUeS3ljh0p7hxETGkPAt42QL+b3SNHO28DJdjaEj4texe5Kpz9CSlRaL/NSLz9Mr7Qe9+I38TvaPw9kUckhBYpFCStYt7sjFkkYm9JYLQYm9AeAqHcAqr1g9S5ygg6MbLVZMXA+T0/8E73/2t5sAY0pZ7Wy4Myuxf1HQ87/uNIVRj8xOBSv5V7SGu5f3KKM0d1D4kq1fGrtcsdv+PnfWnct6U5PF7tj6qnRiPRHKU4DftirKBXto=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?44E5I/8Vc0rk5zfs2GXfFEcmQ/pupW+YJe8mg22y6ya3JXpBn2ddUGSwb8vX?=
 =?us-ascii?Q?w4o5LRdT36HrMBlObM/XdvInt4uZuxyZ2lhB+OCftDFZlSrPfTgNQTZZst/Y?=
 =?us-ascii?Q?LFi7piK3jS2wJDuvlEHidjrPXkavBrP0to+/2j/pLG2sG3lQHUIDzfzeyxQA?=
 =?us-ascii?Q?mebqzy3YCu9V1+qlctMybsK7b8sdnXW43PcdKHXofIF6V0ydYdbzFFse7Dxu?=
 =?us-ascii?Q?g+HwEurnRIU0IKs9gmzMjXeycX5IEikSGNOFrc4WPo65xLaBbRkR0xX2/sJj?=
 =?us-ascii?Q?dUSP4p5KFq52zhi8COwT9fzzn6Yr1XJamx9Q9ari/7Zya6AOXqPbOkS2AUHq?=
 =?us-ascii?Q?0zEuaEOD92soGhnsdKZ3WjZWGcKbnyBlNfYN86/WClm4gPbAhtcUZeqgbHLl?=
 =?us-ascii?Q?cCo+XbvlNP7yNaItTiv3dfzp5UNFYZ+qV5noElyJAwdoDQGQDLYvtvP130sm?=
 =?us-ascii?Q?mrtZ1/QltGwYZL3PfMTQMV3Rs07F+RPRvQI3jcR/C6rbAsV2OqgYmQwQX6Lz?=
 =?us-ascii?Q?AfeWawNOvO2VwV1GpOykOnhPUS7gBCdWOV6hpJaqBKscS8ypQT19sKIRWpYI?=
 =?us-ascii?Q?dadDm69jVlniZrx4KeyPGnGN1UCA1fmpm8nsNnVzhgcEcfJBDN4QMIxK4PQr?=
 =?us-ascii?Q?tHT31DzjtZqgPOkYK7LkvASNb+5M1PkQuTfPzwgXApFTz8Dw/kn/2gapK989?=
 =?us-ascii?Q?daBsUSXlednzRd5SX/uo9jYDw3VcLGWnNpAr1IMHhz+HOUMiFqTa8GVNJSYL?=
 =?us-ascii?Q?wQn/br+IPW2gtilI9WVcgfUu8v+la7iRT/ZIJHO/Hg5knxqJnhhpBSiSPiTk?=
 =?us-ascii?Q?jNkNXaK1wakcTFndP3+QJ1TBhUbWhs1KferHAM892zrpakh44fSE5Qq6VkoE?=
 =?us-ascii?Q?M7HaX6mxRQfvT8m+BPh+yvTLmK/sN7wXzgrEbQ8WLDSCak5hAhzlD+Nn2iNU?=
 =?us-ascii?Q?MfHCvcC/xa3qsvP6+BnChJsJGBS6DniLPnydvTDnYvehjNNO1meXp+jJn6Lk?=
 =?us-ascii?Q?MEmt3Iz+XPlPftR2f2EUCBlpl0yPPkfqTYHd/fjOWI3vDOoHNKqMJJRu5Ufn?=
 =?us-ascii?Q?xkkuPGRoko60mNv4oMppTvp5aFvxLd+FxV0wHteSojAjXh7VS5sD5m3P3flX?=
 =?us-ascii?Q?y5Z8JvhWdEWyeHxLA7bYVzT0dkbLkeewpksjHJ0YqZosIPXUm51EnsQYxH3v?=
 =?us-ascii?Q?W1dt/KK8MkmJWAaRYjO952svQ+QEuVpAqnTLjbtzCvqjXgD6nltpqznaYohJ?=
 =?us-ascii?Q?3hll5elVOkoaX/WSiLVOTxLgPD3jRD16leVzjvidIGary0dnvJH8lE2gJsJz?=
 =?us-ascii?Q?agTQIusccHkVGtCW9RJXhlnluhwIRbJ+rDbuPwn4JFFx8dWiJTK2wpgzIPdM?=
 =?us-ascii?Q?VQTc44WTWuNBDoQXh6QfjOho4xaGwqGP/AtcDmro2u2lZAYu/9P4dqQebo0y?=
 =?us-ascii?Q?hSpezTeFmKEhw1Yy+vOUiOwxnhRczPspz9hn8N9w8noWHTB7exwQVEa2C/Hs?=
 =?us-ascii?Q?3wWpoJh5Nk/GwYkEXwP7Vu87qTUiNCt+KsQtT/qpMPPSwfwq0VdmYpd+Q7Ip?=
 =?us-ascii?Q?c9QLm7yEJ+jh0n23vABYTV2xRb1eAin6MUTGt5Z1XVxLEgbwXJL54UYcw4iH?=
 =?us-ascii?Q?+56WHpZA4vd1w/JsgeOmB1oL0SjCCIWnJwoqgBXC/a9MbLCujPLaJjfKwVdu?=
 =?us-ascii?Q?CEMud3O67bb2cd7x0x32x+Y6huL9jQndIC3nU81ErJDWEVuZFZ3nKUtImauy?=
 =?us-ascii?Q?FaaOTGBpqQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8698a07-7728-4223-b96d-08de97750613
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:50:00.3971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x7xkkaOsnVn7kS+MDv7x9WPNn7BMvobW7nNlR+XrcdDIvXl31VM4B3OeB0w8tOFldS87mFU9vy+pQmaSR9dmjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8794

Hopper (GH100) and Blackwell identification, including ELF
.fwsignature_* items.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs   |  6 +++++-
 drivers/gpu/nova-core/fb/hal.rs       |  5 ++++-
 drivers/gpu/nova-core/firmware/gsp.rs |  3 +++
 drivers/gpu/nova-core/gpu.rs          | 18 ++++++++++++++++++
 4 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 3bfb42684a0e..51615381b495 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -84,7 +84,11 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
         // TODO: support GA100. Its boot sequence is a lot like Turing, except that it handles the
         // FRTS steps differently (specifically, it skips FWSEC-FRTS).
         Architecture::Ampere if chipset == Chipset::GA100 => return Err(ENOTSUPP),
-        Architecture::Ampere | Architecture::Ada => {
+        Architecture::Ampere
+        | Architecture::Ada
+        | Architecture::Hopper
+        | Architecture::BlackwellGB10x
+        | Architecture::BlackwellGB20x => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
     };
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index 5a6cb8221e78..3b3bad0feed0 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -36,6 +36,9 @@ pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
         Architecture::Turing => tu102::TU102_HAL,
         Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
         Architecture::Ampere => ga102::GA102_HAL,
-        Architecture::Ada => ga102::GA102_HAL,
+        Architecture::Ada
+        | Architecture::Hopper
+        | Architecture::BlackwellGB10x
+        | Architecture::BlackwellGB20x => ga102::GA102_HAL,
     }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 1fbc2b08123a..617ec2aaa93a 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -73,6 +73,9 @@ fn find_gsp_sigs_section(chipset: Chipset) -> &'static str {
             Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
             Architecture::Ampere => ".fwsignature_ga10x",
             Architecture::Ada => ".fwsignature_ad10x",
+            Architecture::Hopper => ".fwsignature_gh10x",
+            Architecture::BlackwellGB10x => ".fwsignature_gb10x",
+            Architecture::BlackwellGB20x => ".fwsignature_gb20x",
         }
     }
 
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 0f6fe9a1b955..20625e8e26b7 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -86,12 +86,22 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
     GA104 = 0x174,
     GA106 = 0x176,
     GA107 = 0x177,
+    // Hopper
+    GH100 = 0x180,
     // Ada
     AD102 = 0x192,
     AD103 = 0x193,
     AD104 = 0x194,
     AD106 = 0x196,
     AD107 = 0x197,
+    // Blackwell
+    GB100 = 0x1a0,
+    GB102 = 0x1a2,
+    GB202 = 0x1b2,
+    GB203 = 0x1b3,
+    GB205 = 0x1b5,
+    GB206 = 0x1b6,
+    GB207 = 0x1b7,
 });
 
 impl Chipset {
@@ -103,9 +113,14 @@ pub(crate) const fn arch(self) -> Architecture {
             Self::GA100 | Self::GA102 | Self::GA103 | Self::GA104 | Self::GA106 | Self::GA107 => {
                 Architecture::Ampere
             }
+            Self::GH100 => Architecture::Hopper,
             Self::AD102 | Self::AD103 | Self::AD104 | Self::AD106 | Self::AD107 => {
                 Architecture::Ada
             }
+            Self::GB100 | Self::GB102 => Architecture::BlackwellGB10x,
+            Self::GB202 | Self::GB203 | Self::GB205 | Self::GB206 | Self::GB207 => {
+                Architecture::BlackwellGB20x
+            }
         }
     }
 
@@ -137,7 +152,10 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
     pub(crate) enum Architecture with TryFrom<Bounded<u32, 6>> {
         Turing = 0x16,
         Ampere = 0x17,
+        Hopper = 0x18,
         Ada = 0x19,
+        BlackwellGB10x = 0x1a,
+        BlackwellGB20x = 0x1b,
     }
 }
 
-- 
2.53.0

