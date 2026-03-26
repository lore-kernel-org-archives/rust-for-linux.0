Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010066.outbound.protection.outlook.com [40.93.198.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A6B22D78A;
	Thu, 26 Mar 2026 01:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489169; cv=fail; b=UF3bIAyl/cDYrqClyARVj3YqdIRB9Z0RxVFMoc+6d8QDL2y9WLfnpPwmV1c4olJsV1K3iix5bGukQJ6lTI1FZR5uRVq5VOAyzLMdHYV4Bbrn+gFC7pqNiJvWTCwgBzNzp3wY4CoRTJ/ox+eakU7qsJUZjIp2B8h9iJVYYP5es2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489169; c=relaxed/simple;
	bh=C/4Q6sP75qU+dEgIX5D4P60grDdwTYrCO9iWKt52IGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZAlcHDO5JqGK6ro2mfVoa4+UUMakykS+YgLuYLvxL8L+4RgzJzhU48d3ckJjMWuOiGrH80lc3cI4ypJes2oONyeN9zhmfnkIJBgN2Zqj2vYJXmNOevceoz0tQF7sA7Gh6fx3gRuySlDlBwAsYtbupApZ2gBAxSxEjBTLiVE7/cI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YHaGKJVH; arc=fail smtp.client-ip=40.93.198.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YHaGKJVH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qguXfPTv8H15vYmnNWN6qN8cqJDvQSzQrq6WtQGAQYcmOZxUUXHKwItwfi107W8UefAHYDMuoZjDnaYaOaHUGoAvVB1S0hU5fy95IH+O3eraAwzLvYwYjkDgLqVeFLEtqgruwIQFyH5QnIU3MWDefAdjx1C2reJrYdHHdFHM7dv//lWdpU1/NZklvR8Ee4pjuDR2mAm2CgL0V4BWMYgbNtzzSLXCekjx1iJKhnepevfkEzXCqSkP8h+hC6+9ujILXzQSwOkepycW2ZO2ExPWLavoHXBcsTOFIKgRJryu0i19LJbw2jCacbOBdY/gChB5o7ai+L44V4mXzu2bqwnwwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEZMFflf2B4ySHjiXJZmjxqm8u6TfM6I4YLz9FtsRTk=;
 b=w1nYGrffByKLTsW+E3/tC2QbkAkcsNnmdgYDBJEeVjIyTOjVe9MF/UB7J3wSKH8JgL4g2OFjeg6dlMSq3HNSnqnAEk8Il7kPyAmLSOKnEaXKbkYrxCY2yHTLYoAztwaM8/Dan3fJubkqaP9Kou+ueqbQLFazIb3B1PmhNVmudhAiWyKkzb+yH8vlhgVIGvyGf/KpMNOJoOiNoALkjPSw4hJFr0t0eQuxAtuNCs4DCsNwSjkZAZfN5uZAnXqujb38aIsWjo7xuoCdyGaae8TBOWlzQINdXOrnPu3ND/1V6HoG72e1llNq1xx+X6fFYwRb1MFae2n0m3vKfWgmjdhPOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEZMFflf2B4ySHjiXJZmjxqm8u6TfM6I4YLz9FtsRTk=;
 b=YHaGKJVHW7unLJV6B86vpuGLJuQv1WD28yK12yXfB+eZ040AQOKgQ1muNhBceCpyuTY9EJF0dm6xFQFkGiK4OcyBlBZkRd7hUVKEQZnRpfPPm8ru8y2EBMTCwQ9Rr41l9SDAebtG9Hmp1edG9MZATLEcH9E0gfp2WWqeEdOlQIDM6zB1iT9RRHbxUbuecGP3Ymp41ACTNw7e8JilyFep11ShdaoRHpMXzZXRJ46Jew1fW7qnxHpgOxbDIZGDnIYfp4mQeleBo4/esVgnBsMqPL1cXa4j8F1gL18PMiz6SYOxBnOVDgle2J9S/WpALucTK96GWklX42uuTl/KkK9PWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ5PPFF6E64BC2C.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9aa) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.13; Thu, 26 Mar
 2026 01:39:09 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:08 +0000
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
Subject: [PATCH v9 03/31] gpu: nova-core: use GPU Architecture to simplify HAL selections
Date: Wed, 25 Mar 2026 18:38:34 -0700
Message-ID: <20260326013902.588242-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ5PPFF6E64BC2C:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ec66386-11d7-4ae7-4323-08de8ad8795c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rkPVVHpCHOl8XP7Us2snjEp88zv3CPE1kB0l0GDpTEsLDX1okrpEchq9zkiynex0XHd0ppgE4plmcA4agauMhzs5rK9zIhdzfr9QZdROZth8Ts8dHoH8nJffsfuQKnamM6AhfOOGThtDNLP9aR/ltdntGggVGDnkBHgqaq2p8/wdI+ipVdngl7FFrEEWYCY4/1HeagZHpgSjt+Qw0DvX0DLKxbpRsWeFjQ4koNX666xAvCjeKOey6AcpJ9HlMTmQV6vJ7JHVI8idy3MCeoL8vrE9ZAU6MYTH/VEXkfPrgUH4l+W8i0iPqvjgYC6Oxc0p+SfYukELvyj8yEY9c21OtPvhkYp5YUVJKRiCewy2crUDpNY8PlCn0fXq8vZ+ltiazIuh4erv4zsb5jLtoT6mcrzcsMblvfj9/5PdAjB9jViegoiJK0lAV4L8SsYDGlCo1pfX+cso9q13uIUiVECNQccGze80WyEY93dkm0Jzae3S0F/rfMHfB99Dkgf7gFCjOuF5gsujNCK3G64pM5dlikeUmC6VBI0bTr/hLRBb3TOk3gbDulwGTwM0I9GuXfKI14I+L/A0zrcV6X4DRhhATQXZfTpHZc8pJzMPcrn21u5oUqHg2QM5VV4bBdHQndo2IcdU/a3Nd7VAbV6+7POYN2di7uhKE7IQjxjFHGKekobtnEH4XLU1V3R78zlQOjBgSvYZWTm+Dm5jzQJWFvfKpMEV/fx7JVEshqkVMYV5+as=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RMvjyQz88qJ2K7GpDlkEpoMNLb92cum3bDqnbaLDPD00L9VCo/4424z0KGHU?=
 =?us-ascii?Q?T2ydrnf2n1l9LWVgy7akzcv+bTlH3i4uKB+YgYaBbK6EokqWT4YXr63oSg/s?=
 =?us-ascii?Q?McHRuF7bm6T+U8H1AQgdjrVH6Ku1fSqtE7JkyhUnWWRFgY9lZ5YvRBAW4kil?=
 =?us-ascii?Q?H71wYhkymeYzLA5iPbHBx9lzC5N6QYZ4JnLR7xT5q0rCTZcR1U8reBfmD91z?=
 =?us-ascii?Q?Bu4tCQwVniuk5QzSbbo5rdrkzTxtb5SxeoEd2+EXJc2ajcQbF65gReEFzmsu?=
 =?us-ascii?Q?oq00UxiHWWsR+0KoG9n4Lt+S4SavSioQgwaBRZ/E4abunfxbKEIcoK77SKnh?=
 =?us-ascii?Q?VpQZdr7c4kfo825tEuRB1UO3jnLleJxkUDzEvQ38E8gAKaL7Sr7Z8EdhHP+3?=
 =?us-ascii?Q?UtlzoEHdbJx5Wdi8XxvUmQtgYSFJ1muFDUZoSk7AxRnIdujdZpDxOb14BEFa?=
 =?us-ascii?Q?yVbIkdfGeAP0dFk1FZJhIIL7h7HUoIgrijF93HlGzlhPVWoX8u15krlLJmL+?=
 =?us-ascii?Q?xUpryVbeouI27DsVI0J+ht9OdOYBWMiuSWKBkk/4HRea8VS6V0vYqcUCMrem?=
 =?us-ascii?Q?c9ttSsUacE3sNqiHvVWn2qRUrsPvTKos0p1K71U6+IB++loDX4QnAFp5Z7RD?=
 =?us-ascii?Q?k2CoSErgWjoYK7VoouduxqrkMNf3v6QAjQAbyDv5gG7MWkventb9yvOLF17D?=
 =?us-ascii?Q?ycNp5zTchpRAH0jq1VpRWXA2DFMnViV/0/HNH06TGn6DkMes3AcbunirdacD?=
 =?us-ascii?Q?sCHLTihOSIQrfXRxIkxvTW6a4VKXiqgMOHUm7QHaBhXATwsGTjZ3M04rYRyK?=
 =?us-ascii?Q?PcM9PoRrurXTToo1xuoyAmhNE4x5TfjWrUr3Yb+Dqf7Ccgqq9BJJ9td+Akpp?=
 =?us-ascii?Q?Gbw8RIS1s2+e1hJQ9sTcovb4ecDtYpK12pomPxf7wMMrzJYidVKBMXI2GqM5?=
 =?us-ascii?Q?eNj7itmGeEKIPYMlDJsMIu7ZvF0LpXebirReNFIE/iKUaMVoU/Il00i91RSf?=
 =?us-ascii?Q?wiA5NwjWMB37P7hN4ahCb8uo8z94IlNIEFpsU05ZTXvsNFxt35KyMEdN0DyT?=
 =?us-ascii?Q?UVL5EvyKWdQjBsnV+uPDboHqJV3PBMykR9w0rqIq97Xl9BVA+oypn+8lNqKy?=
 =?us-ascii?Q?RGZ+xVHY2teRsKOLPG4tWQ+/FgBkcSS69KW+ytpG7fPxDYv3JygaM6kcXcNd?=
 =?us-ascii?Q?ZYbKLFqgcdftVtxS5lGaaYewns/q+rNp8qAcvkQzWdRf4YXhnqdtg5lOCA4d?=
 =?us-ascii?Q?+6Gvg6hZJQtAcBRhrerhGGnxg25X3zr4zULkI3QJPcDaPF5rYt1wxHMX8BNs?=
 =?us-ascii?Q?EeuJQBVjkmKRJhoyJrn2D7Kbmap9ULGKPMkGJNbASFWC9Op4R/xzXnSsk0FL?=
 =?us-ascii?Q?OlFfjvPn7bsp3jNCr0QIcmR/ZZE5wwu7cjr0J+diWCSK1aritq2a+kjC4eLY?=
 =?us-ascii?Q?Fk0AGVVet/KHozANa0W0jlOHku2Q/rQaMmF/AiDQO9fDKLjZ8vMgWWeiQjtR?=
 =?us-ascii?Q?9zsoSTRgch/f0AY9cOz/8NQKsuvNRj6FzTIY2+JLvsiMtPRWDePzplkSOxUu?=
 =?us-ascii?Q?EoWMkAFkE5Or7y9RXb5Qw9vbfO59q+F5Bf8t8Zw2EG69IFIeoZEviheUGHav?=
 =?us-ascii?Q?6zsgiPmt5JNEjqKBTWRLXEjJi75BVNHRsxe5lqTpj+BG5eB40iAWOGr5O6D1?=
 =?us-ascii?Q?u3uCYeJvSc+ZgXYTSIWTNu7OwTy1SxxSPdivgA/BAt5w00WfcZl4PWRaqGve?=
 =?us-ascii?Q?PrsTA+rkMg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec66386-11d7-4ae7-4323-08de8ad8795c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:08.8210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6D+QVRaYBqfq+WF67I10nKOntPBXyxnIh7eX48qzCb4rHp1TIcW8Ous3oyNEW7G8oq03/VuelnD0zR34DIODxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF6E64BC2C

Replace per-chipset match arms with Architecture-based matching in the
falcon and FB HAL selection functions. This reduces the number of match
arms that need updating when new chipsets are added within an existing
architecture.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs   | 22 ++++++++++++++--------
 drivers/gpu/nova-core/fb/hal.rs       | 20 ++++++++++++--------
 drivers/gpu/nova-core/firmware/gsp.rs | 22 +++++++++++-----------
 3 files changed, 37 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index c7f12f2a7a35..15010f81946e 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -9,7 +9,10 @@
         FalconBromParams,
         FalconEngine, //
     },
-    gpu::Chipset,
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
 };
 
 mod ga102;
@@ -74,17 +77,20 @@ fn signature_reg_fuse_version(
 pub(super) fn falcon_hal<E: FalconEngine + 'static>(
     chipset: Chipset,
 ) -> Result<KBox<dyn FalconHal<E>>> {
-    use Chipset::*;
-
-    let hal = match chipset {
-        TU102 | TU104 | TU106 | TU116 | TU117 => {
+    let hal = match chipset.arch() {
+        Architecture::Turing => {
             KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 | GH100
-        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => {
+        // TODO: support GA100. Its boot sequence is a lot like Turing, except that it handles the
+        // FRTS steps differently (specifically, it skips FWSEC-FRTS).
+        Architecture::Ampere if chipset == Chipset::GA100 => return Err(ENOTSUPP),
+        Architecture::Ampere
+        | Architecture::Hopper
+        | Architecture::Ada
+        | Architecture::BlackwellGB10x
+        | Architecture::BlackwellGB20x => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
-        _ => return Err(ENOTSUPP),
     };
 
     Ok(hal)
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index e709affaa7e8..3b3bad0feed0 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -4,7 +4,10 @@
 
 use crate::{
     driver::Bar0,
-    gpu::Chipset, //
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
 };
 
 mod ga100;
@@ -29,12 +32,13 @@ pub(crate) trait FbHal {
 
 /// Returns the HAL corresponding to `chipset`.
 pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
-    use Chipset::*;
-
-    match chipset {
-        TU102 | TU104 | TU106 | TU117 | TU116 => tu102::TU102_HAL,
-        GA100 => ga100::GA100_HAL,
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 | GH100
-        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => ga102::GA102_HAL,
+    match chipset.arch() {
+        Architecture::Turing => tu102::TU102_HAL,
+        Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
+        Architecture::Ampere => ga102::GA102_HAL,
+        Architecture::Ada
+        | Architecture::Hopper
+        | Architecture::BlackwellGB10x
+        | Architecture::BlackwellGB20x => ga102::GA102_HAL,
     }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 60ea730d1bd5..fc32b6143cfd 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -146,19 +146,19 @@ pub(crate) struct GspFirmware {
 }
 
 impl GspFirmware {
-    fn find_gsp_sigs_section(chipset: Chipset) -> Option<&'static str> {
+    fn find_gsp_sigs_section(chipset: Chipset) -> &'static str {
         match chipset.arch() {
             Architecture::Turing if matches!(chipset, Chipset::TU116 | Chipset::TU117) => {
-                Some(".fwsignature_tu11x")
+                ".fwsignature_tu11x"
             }
-            Architecture::Turing => Some(".fwsignature_tu10x"),
-            // GA100 uses the same firmware as Turing
-            Architecture::Ampere if chipset == Chipset::GA100 => Some(".fwsignature_tu10x"),
-            Architecture::Ampere => Some(".fwsignature_ga10x"),
-            Architecture::Ada => Some(".fwsignature_ad10x"),
-            Architecture::Hopper => Some(".fwsignature_gh10x"),
-            Architecture::BlackwellGB10x => Some(".fwsignature_gb10x"),
-            Architecture::BlackwellGB20x => Some(".fwsignature_gb20x"),
+            Architecture::Turing => ".fwsignature_tu10x",
+            // GA100 uses the same firmware as Turing.
+            Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
+            Architecture::Ampere => ".fwsignature_ga10x",
+            Architecture::Ada => ".fwsignature_ad10x",
+            Architecture::Hopper => ".fwsignature_gh10x",
+            Architecture::BlackwellGB10x => ".fwsignature_gb10x",
+            Architecture::BlackwellGB20x => ".fwsignature_gb20x",
         }
     }
 
@@ -227,7 +227,7 @@ pub(crate) fn new<'a>(
                 },
                 size,
                 signatures: {
-                    let sigs_section = Self::find_gsp_sigs_section(chipset).ok_or(ENOTSUPP)?;
+                    let sigs_section = Self::find_gsp_sigs_section(chipset);
 
                     elf::elf64_section(firmware.data(), sigs_section)
                         .ok_or(EINVAL)
-- 
2.53.0

