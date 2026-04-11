Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010050.outbound.protection.outlook.com [52.101.201.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB09DF6C;
	Sat, 11 Apr 2026 02:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875804; cv=fail; b=SfC+L0UhBnLEgCiONj7paL/VlcakFa/I4VdX3c+7zMKdOeA5oSu1I17cANPenxswst0+7KKj0xYZw0hBi0r0uNQTC/TVfyed1yY0cb7Ilv0fHgYbWZlWcFhVp0uABeEoMYQhxsH/yQ/nCvfYbav9QQpq7rpKhWGdyhdJ//JHyV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875804; c=relaxed/simple;
	bh=0pi8DteALdhkPnyq36Y7aCmergDP50fbB87GS4Yb/c8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tyxk6u7HwsMYfwE02V9Z4QfegckAy6xiIvW/sL4/G7HLfUvAEne7H4g2mcfSvpBOND2oJIU/i6ovesqm6PgQrOYyOe/piZnTMERXQt0lcnbaCwbryhmP7c5iCqZPb2zaq4ZIxwr4q+JGtzgtZrmeEmyS8UAa1Dy8ze/tpqoCaao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jvqT341z; arc=fail smtp.client-ip=52.101.201.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jvqT341z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXe5hXLofeoMC18pwaK/4eKSNJ8+0YD8p4QFmdi5rWEP9Uz6aRSDpGlSIEaLkVwU/JrTUw3j2Ci5UAsYSkwhLqcYbvNeF3QErja/HdqK7cfWem1uDbfAoXIMk0Q2h4hy/28+7WnipYemCx3jTrdxGZGKBkPPxS377mI8DzFVM0z/a8hJLhwHisZsS4NS0lTay38D7FBDgCxi3cJedct+fEJskFEt+qD/sd1nnskRa+2nO8a26c725SNrtAG3JyYlGDPUBPSEQe1IUhuBC3Ir9D0Xdqyv+Bkp5lss00VNbg736X5H2YgodF96hh54/x2si6xLMBDYDsQMx6J2yz1cLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZNONpszdnLvRjkbX9bzSouWZoanTU18YbTXOGKMiBg=;
 b=uaVr2KUGpsaZdgDhtdC91leQ6206qAZvMUej6I6zHrD3YC1OCH84HdnqDrYtDBPirygEPdjp82cfd1RP0yMk3uFzVgyxf+nfZs7HDCxfZMgMK8jPhdI9hlc77aEsnqCx9b9+GKuj/SES7Ttexr7Kdu1vxP6m09lziDH4qKXxsu7rXHzVVoAUfgu+fDLC+pFrLzYGrNV9yxmT5SNw6CaCGcrcQMykFFchOhV2vd0A2Pr0iPDNClOZqzEVHrQDEsOJKacW9wOM5FVmKYk8uzNu/Ly/HpGBUSPfaIhGBwu9OWP6N0RAoueo3Db+cWidorCOdR19Tf7cle+dlnamNwYOeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZNONpszdnLvRjkbX9bzSouWZoanTU18YbTXOGKMiBg=;
 b=jvqT341z9cbhVx8UxR482opop8xZNvfx1zOoDhCsKxgfL6TyTfH3TthcxjrrfPXs6eJ4E0XVVkMZ5zctdUV6TeFtgmEl4nAww/btrRIjUT4AbbeEoh2H4dh+Gv/1CSUNUQVjVhCfjdXUVxXJdF4RRKJn1qMETyJOi1WdTr52ikNUD1lurriqaAXxZhTyxCo8NvMaBpyrw7iAOqeluTAQpZkb/4n6kIzCznkH+XGKvC/do9bpY/n5bF7pKxPuBefRsi6yZfm/JYsKvO8W94aW4e9qCst/JU+mYCaIocSdoEMxnSSBL1+dGatcloruJx+anK7HVZVf8X5UsZ7tUO7Vcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8794.namprd12.prod.outlook.com (2603:10b6:510:27d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.15; Sat, 11 Apr
 2026 02:49:58 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:49:57 +0000
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
Subject: [PATCH v10 01/28] gpu: nova-core: factor .fwsignature* selection into a new find_gsp_sigs_section()
Date: Fri, 10 Apr 2026 19:49:26 -0700
Message-ID: <20260411024953.473149-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::16) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: 0af8eab7-fd79-466f-a392-08de97750499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qLjvehL/KrxK8h2mP7XK1XyaGNEjRXtVDwIlSpGuw5k+gAEsOH6B1fhT9h+7VLzB4CU5UGjshzXYSuF5gaGxodBjjlxca+6IQqxQHYsvoLrD4NqfJM7i3/ir1VKYumI94gr7iYJqU8UrkBj4JOsnK7cn7uZNmRy/fPMSmwXMk8PGaNp85aZrkzr9kUNEBIR1EfkXKHgBSjaI5qa95MTKnRUrO96N0aCVdfc6zIK2zCQc95TyVoR0ir2h5csaKxCDtNxfo+toONxb/nenA5g+qvnGkFGz94nckl83d+vcGLYpKkBGfR1D+TILU1bBvpbLLUOGCwrScouoAm6e4r6mkbGm03wripT0nUJNI/6f+4ywlWAiPu50FV0qIbaYqtLwgkHzY8cJjtf2JdNyl8yI9thDitdiVLmsYHTZBrNl3mBGPKXmRdm6q3EOSZWrUW29+nqpmTtptEWICfIh+rmhXvD8OqecBwpkYVF8cibJUh6cYYlF5OEdYZJM7wOcNBg9yQP8zVRP3bedCqHi39R0JiFjHj2pIEw8ZbIwybI8LrySjuzAPklL6prnOGSgvqwrwnGTSdEVcIo6kjqc7l5I08gLfXw0o9A3rohd4hY1tTkPGmSMlqtkdH6yXXmOUo6K5FauwEfa+0og1riKwyJTxpX3MNHtkYSOFT8S1wZBV3NrlbJcHzhi4GkuR70rSbEGj0CTJAuc0nVuYpXTnCZRxwoT/6oyeto05RdTtkxPfkY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DrOLEDw6AC9pUG9jfkQ+q3u6rEifmvLPtP8sZojTEu1Jpe8zi9oIlqnaW4bZ?=
 =?us-ascii?Q?OND4nJ7MpdPc2Bue+mNIKU6d/MRVkkVDOh5v87vwXevWxfU7GGGprFT309iy?=
 =?us-ascii?Q?iLG+1XSVNqgZ9+cK+KgRQF7+PF/36/W95SngknLt6r0slefdKhx2MX4FlEWe?=
 =?us-ascii?Q?iUHbf2v+SssRBfxFugvgXQz5cWSJb69EZnOoIcC2SRnPFbgTiJDi9AwjYlcM?=
 =?us-ascii?Q?gnYtm4R5D1tVXERiXpA0CyaziiMETOa6VT0renkiP7LKOzMLwelVnEWWHuZ3?=
 =?us-ascii?Q?G2afzJlhkAfiSmp4WSQbEQnYY6yDeJ74j5PxPfQaWHPasBmLVxePLPwiN2FY?=
 =?us-ascii?Q?bBekE0m/JyuaBkHbUpAbJmXXXn7x7bRjD6BdkqMzrCt6/vaIbVOwmKWH988Y?=
 =?us-ascii?Q?YDVCJh6Z6wv0mcKFOr70qkpsX/88Jfn6kvrDKyV0bhFqZDDSbaw1bU6yXhQ5?=
 =?us-ascii?Q?sLyjakgz42phrj89ADms8+2bz8oSve4PoxBjz/zN9cCafoP95jnASuBZ5RZM?=
 =?us-ascii?Q?o1kb2sr5rIO5zk6AANTcl2zAEioQvv8LgQEoGOKWXEhua9Mm3WwCtkSbn4xu?=
 =?us-ascii?Q?kEnZaJsUeNlgdUxY8GZ4NBupPy2okdvIOAoLWXDNzcg7vQuaSXhYwmKQlaOH?=
 =?us-ascii?Q?J56SM6xT7icVO6WjucmnUfTjdHUxmrU2XxAp3HNNm5iJ00pI25A9i9bFy28/?=
 =?us-ascii?Q?j6RCs4C5fXPC9nfKVeoSqHNROp9cb9Oy0VyF9mTPnxuHVqAhQKCqn1xtWCne?=
 =?us-ascii?Q?JhJBvuS6DIm0h/8ILFnv4H6KLRUFEln+kfttxk1H4vtL2stBm8jDhzjSr5+/?=
 =?us-ascii?Q?tWXagJzdRfsRWxkIodfs/qSNIcCypOhkXsWheL/TA2b00kZWk3DbTt7h8avM?=
 =?us-ascii?Q?4bsb3ZPf9kg8EfbLB9r6ftWlM9fUJioT12Q0mCcFhG13s5rzgvVTGIuqufl+?=
 =?us-ascii?Q?UgOmMqTKOuMk0E6LZWTO2gdGYn2yDkDOHVRXDNvnp7X+Xx5ldT7uB8aP0UDG?=
 =?us-ascii?Q?O1loqAl0UbaURK0hGXyDkTcFsTGt8locg7Fq6Qls5qNjR1KfYHeESAUrHiUG?=
 =?us-ascii?Q?yjQD2je0UDvtNchpJ6H91WQFsdZwvBQFfazv0jKHBJdapPkQsSQaTxDe9FF8?=
 =?us-ascii?Q?djneqOlVS8e3OGIM108FVZJHeFVcffVtZv6sqTLoQNvO5MMNjA59gyu5pGY/?=
 =?us-ascii?Q?Zb2nMA3kR2KgwO4GFK3W9Hzecy/7htKdBxsAJ6BqAfPJzCz/dg933qgyQkIx?=
 =?us-ascii?Q?y6VdunSPRi5PPdxjVsoUPBztTbMKcs+N+YOLhwn4aEdLh93TcK9HpjiOgFLd?=
 =?us-ascii?Q?H+esGQ46oqqVix2BJTi/1I7R9haQLZXrncQ7BaxZO2lqudXRB90T5ZIsJ412?=
 =?us-ascii?Q?sFPaaG5Q9Krk9tXb6SKozM2qlfVKRzrevaFIHyvYWQYZynHdrWC0LazlQNu/?=
 =?us-ascii?Q?+AjzFL76HC/9nK3gt69J6B/nGVK5C6kLltpluC9ISOS6TnJHkVgzb5KhImbI?=
 =?us-ascii?Q?hMiR+SIl+G3W3vdgtxhoLaHSgp5JjK97ymYNl/jfAWRMkeaoysBR/3i0Fill?=
 =?us-ascii?Q?WLmYJSrFhLQovjCwLR+JwSVbnquF//9bPtljVGWiDYKoSk2okPypVA2S2+Ec?=
 =?us-ascii?Q?KKj5d014MQUUdzeClW2FjO9v4NYTsIZh4KiLX40LMYTTbjjHOYW+TqzDKpwb?=
 =?us-ascii?Q?w/w4ycthTpEREsI+VHLSioSPxt8djFnbkJ64FD4QaPzwz/hOqj2/PG1MTCo3?=
 =?us-ascii?Q?2OIRRmdIuw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af8eab7-fd79-466f-a392-08de97750499
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:49:57.8725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yjD9ajwwDfwBwSBq4WVlWkuHT2yIwiII5Qj1bReDp/Ttx0yJ7Nxt1ucfyR93qguGKL2fp7xu0jSwIthbZCKX4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8794

Keep Gsp::new() from getting too cluttered, by factoring out the
selection of .fwsignature* items. This will continue to grow as we add
GPUs.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 2fcc255c3bc8..1fbc2b08123a 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -63,6 +63,19 @@ pub(crate) struct GspFirmware {
 }
 
 impl GspFirmware {
+    fn find_gsp_sigs_section(chipset: Chipset) -> &'static str {
+        match chipset.arch() {
+            Architecture::Turing if matches!(chipset, Chipset::TU116 | Chipset::TU117) => {
+                ".fwsignature_tu11x"
+            }
+            Architecture::Turing => ".fwsignature_tu10x",
+            // GA100 uses the same firmware as Turing.
+            Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
+            Architecture::Ampere => ".fwsignature_ga10x",
+            Architecture::Ada => ".fwsignature_ad10x",
+        }
+    }
+
     /// Loads the GSP firmware binaries, map them into `dev`'s address-space, and creates the page
     /// tables expected by the GSP bootloader to load it.
     pub(crate) fn new<'a>(
@@ -131,18 +144,7 @@ pub(crate) fn new<'a>(
                 },
                 size,
                 signatures: {
-                    let sigs_section = match chipset.arch() {
-                        Architecture::Turing
-                            if matches!(chipset, Chipset::TU116 | Chipset::TU117) =>
-                        {
-                            ".fwsignature_tu11x"
-                        }
-                        Architecture::Turing => ".fwsignature_tu10x",
-                        // GA100 uses the same firmware as Turing
-                        Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
-                        Architecture::Ampere => ".fwsignature_ga10x",
-                        Architecture::Ada => ".fwsignature_ad10x",
-                    };
+                    let sigs_section = Self::find_gsp_sigs_section(chipset);
 
                     elf::elf64_section(firmware.data(), sigs_section)
                         .ok_or(EINVAL)
-- 
2.53.0

