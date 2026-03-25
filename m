Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011000.outbound.protection.outlook.com [52.101.52.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA68F2E282B;
	Wed, 25 Mar 2026 03:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410781; cv=fail; b=XeGkabhFZ4X+Y2/B38d+NO2XQbEAOvg20xFeHBVjtuaIfWVqpZLcYphWVssmaVB4Vfl6kw4Re+2rLMbAeXPbws7+cWL/Fn0J5ShTMHy6AkqdCK75+zAyI/QMHH/ceOTNkbizM4t1BR/+Gxt8R6QyrGjRSXCj6rY045Ol/KPQb4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410781; c=relaxed/simple;
	bh=lQi9vmau/CbUHX7q9BDTxN3KPLRxM3NxsGXoeHQmOBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qRkYGgNLAcYGnLd0Zlz5viyR1X6ZaoTnnIhgP7/aJC3u3+ilM1T8+MRxgXF3463QXHLeAihrKcaVuGFnFh2O41o6suqHT63LKQGNmqn2nDRz8U1dj6ljOpgbGv+CzCnF5bdU0ailpNIznzNOiSoZV8mOgNYDibumxHgf7gx8lUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fyFTqSsO; arc=fail smtp.client-ip=52.101.52.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fyFTqSsO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LDHGPSS0XvMpWFd1jUeQGKvNzL2BzOUgior7pCWV2sg/QoucWaXsFLO2L4mK3/SMFIm4ySPqY1LftmwWuUWl8zymfaXJSsVbg2Tp1bpYJYVGpgTpd60ZZOAzFvruSVBb/frR1xQ1O3IsW8BPwV7MwWwdK3S869ms8TilMBL0GV6IaYcHkQyo/N+zIvXuTqZ+OzmQjeHz/HHGWEENgKCSE51r+t6RN72G0eVYQXyqbWpDZFD7RPZLFkK8xV4Wk9Cs7BWz/UzVzTDPAkIwf887a6IUORwkscik1qq43jgUNL0ZVm/uDk5B3YwA1tlsqx5tAGmlviadBli3/PP32fju9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGcqN9JK+72VwpQZ1n7YlpWhKx8pG6Vi0VJ82//+Jpo=;
 b=jRNzSuoxO5PrDovKiIgl+QoX0noea0kS96E2b8scp4YSeiAIJknOtGoGNadCTfotCdNJdFdWZG6l7DX8UMJ2rKy8Gm/SRC8YKa3CKcd0WPnkB0LWzzSOOHxRACRZ/H+Dayr1fKvS0qXZ2qDh9lhfiYSMHrjhBOikoWBMF+dWFrK/4SCCgmwKbo6LEqTiJzhmrDS5iOBkpFSzJUyonNZeLmbUxxdGi52B5g2uysUM6zEItp2mn7RTEAPAMSNzNwP7Ddtnj0luy/ysBowkewCn+HupBaoMp5vKyidyn0tioz6BFTmt7u/zxauPRlvm2lJL0Jr3I/VrjpRKMhV6vDa+RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGcqN9JK+72VwpQZ1n7YlpWhKx8pG6Vi0VJ82//+Jpo=;
 b=fyFTqSsOG/fN2g0SId57ldOymuRGbZkE/UVNT8XHrnlp/5Zq878LoAshPBk3Cfm6hyXXp9b67KJj+evxRzF/SXfDhHKmZ4GUijyE1PevALml2/fdDNCO4t124rcDFUTdpwAPlqpHqsgqk4uxPXuMFD10pZrzApsqNIjzcks6qZQ2UFtBG6bRvIdmzI+sNYJeTFsVjIs/XLaj0nUeKPPKncN1+0QFOvw5XlDK2MyuuZFMewRoGTAA7aUmRpB5lEDH9eWCN3jf5QbS1p4ZX71t+8MIwugbYqDQSWme2dKIJyH80mESdVAThQVPTT3SUZc8hidP2rMh5/eYkHwioA7Z0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB7441.namprd12.prod.outlook.com (2603:10b6:806:2b9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:52:50 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:52:50 +0000
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
Subject: [PATCH v8 04/31] gpu: nova-core: add Copy/Clone to Spec and Revision, add chipset() accessor
Date: Tue, 24 Mar 2026 20:52:15 -0700
Message-ID: <20260325035242.368661-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:254::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: d6d04a55-d38c-438f-ebce-08de8a21fbd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	m0f+UhlfELWsRgBH1/MC8dbetp2SFv8WaWT1O1vmYfUkVYG3+trm20MVcMDFh0Gzg2dNC7bgPQMCwnqo2SdHaYyLEc4ho+NeNuygYzQF9YIk97w2nfRvSHbMux3Ok8l6Ri7zx2QZaQ4Ly1woL6/gWlIhJ+swgDKo3tNmGAt1JcdRT8nCdIiIUk6jzlknXlZRhYgEB4gUVRgSjev5RJ3kkuhN48ybAJPdk7IXAC2pHrqECU6CSS3hJdjzbOwh40FMqtwwKHm3akVPHs7PgEDr4aGiPeNplIF3fayGg2zWbgW5WGAbPA2Itsj6pQDOsYVLGfhhzo0IMSkmV1dKIp+wdWNUVgI00NxMhIJY0FNIetlgf1jQfXUS2TtUSsYgg6w/qDGQMlDAukr925cWDHVe+dZSOWmkcYfQYSGEHsyq2oGJrAKkVeAZMSjUylOCfJBDX2IBLbqb8cbAXX0VBPXZyfCJOgXM0BwW0NMBy/M/9MTyCvbrx6iyYtavmW6eV6Wc4CFSYlivQMZSCvlDatl4ykB4LkFjkgHtaNPVrm8oAqkLbkfyypF3e9vd2i9+gorJinKx11osdNAG6ytMzBGhuy+rofRDgvmdzi1RBS5VQqkWr2GFE6J2oEGHH/n/GkCyt8pNi1AC5ZfPbdgVPDPGgdDNeiW4nRo1/i/hUDn3dwAhQH/8LpkhmR7sfHGKlPXencv+4eFIwOv1EPgGS1LArM9ASlErcz2DB9JHPo4a7PM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YtAzyNSD4aUknWPDSh82zkXHgAL1uSuSEuKLZGFHkvV7f7Htxzh1BL+FbUgb?=
 =?us-ascii?Q?Qq7GjJ1bWkyFLEjGkbmBgGKuE/E20DDvSa6sAWsD+jf8MDlko82TuiMPktfM?=
 =?us-ascii?Q?uHRfsZ95eaD2kf6/woHYQx8pR4E4EZMLoFaxWkzr7KFd8PZorWK5AdE5Pn3S?=
 =?us-ascii?Q?xDGVGQ7V73iOD0g2i4/1Z7lYdKGWs+rrVX5LJ/R88UPR5pnCxNnOJIoTI8Bl?=
 =?us-ascii?Q?jJnNG1yI6oTQjxw9r7uNO1qVwI5AyuL28U0jZjVVbOFrvOFIqvh6zqvi031x?=
 =?us-ascii?Q?8/GOtoEJFx869VGK7pm6flxjFJ+Xqy93GlaybAu610j6LHZKAjUiBlgEE9wX?=
 =?us-ascii?Q?j619SVHWasOJ0c+sZAs4b595IlIr5GH2qcRVe12R23b69DYliGbqnws5SDPM?=
 =?us-ascii?Q?8YYIYTao2f642yTy/ZaUeWrglzD4qIJS6Hu7+/SaAM+eHSxFN6jEslBakNFF?=
 =?us-ascii?Q?CXsd+IcbXtPNlgJx9IB8/fhnDFXbFksAwDsaZ2QW9C13ZpjyPN9NawHTzahr?=
 =?us-ascii?Q?vzk2jDh7A4qkuMPPynwtv9czaVc+DnSlsT9pYpVtrN3Wg2FQVwqcjSUA1G26?=
 =?us-ascii?Q?dVxzflCTJ9/AF2Fd8z/wfo4dmUXMSaXunQO1Sjlc/tkME4M2sp0/bBnpYdOa?=
 =?us-ascii?Q?Fb2GUKQnNku8upGCTDUS+ibbVvnzA2u20O42jX4/i9GaUxJj3gAws/uWJKqB?=
 =?us-ascii?Q?hY1wCLKBMPaPsueM7Xk+B3IjZBQc5VAEtd9w3NUQe35fMtlQMVg82RlWrT+Y?=
 =?us-ascii?Q?GZrXId8mEj/uiDqMvMgBBpVgZzo0JH30Mj9nxP//SPolV3U6qcJ4wehPrb8l?=
 =?us-ascii?Q?s7LjG/aXaKDg6rJto16vRw/KduLls+KbgDz8ZWw0lY/yEZije7vobQgmU6p8?=
 =?us-ascii?Q?XAg87uKO+9AJ+u0EKd/qAi9N351om7lGPIAuOkRzfC3TKqAnz1DqypGXsw2m?=
 =?us-ascii?Q?95yBt5CF8tAbN7IIpV9HipusC5FP8UkzgLff6wkliQKP8cqVdmgmNBJ0VTTr?=
 =?us-ascii?Q?PbGQImWOZJgACig0kqpkkH+0bevzvF1USv6DSTVXd1nphvhnc6KpelPUCxPf?=
 =?us-ascii?Q?roMufxCz/5JRtyH3n+UPoWkhg5FauLusoKiG4HdYjyXDpHO/KafMJ0q0wgrR?=
 =?us-ascii?Q?vy/N6zgtyvMycBYx3JWtbhsZvNCNf35cPmDbpMeA2iss3EchUA0WcnOj7Z+V?=
 =?us-ascii?Q?dlVfV6BXoyDOxELkE6awleQw6f6AxvgXTT6aAG56Lyl6jZzZBAHZYK2yjR0R?=
 =?us-ascii?Q?4ww5Z/ebvRAsrdL1ii/rPKX0OAwHJk1mVsmSekU0bw6kQxUz53Cv/r8bmZYq?=
 =?us-ascii?Q?RjB72yhxIQ8MLKNI6CYlARvcX9HsMCEDUM07hiSJS/yN5naigBq+q/xrOVDp?=
 =?us-ascii?Q?FSI5kfVFIJSVcm402lFKQlhQDdyMPaMkt57FaSpauImheCQ29YhRd7GptYng?=
 =?us-ascii?Q?hrHbfxS78tYOXXDr3yXl8lEWlfAimamV4GwTY7VqISDhrTHWzsN9BQbFWYgu?=
 =?us-ascii?Q?MUkFgAIqoIsbCLDsvYC8gxTfvDzUQQc+DhoffWG4CHcRi3sIf9Y3tHch/VSp?=
 =?us-ascii?Q?eBlUOqW0WprsW2Qr1/ohLGgGqYIQeT5L2OsQcYU61XUR/dMPDlBkX4KptWt7?=
 =?us-ascii?Q?amV3iU3TsbPg/MR36OG0/7XY1rMy6qlDwF7iRyoWQC6SMSHfBnJuabLFVAXg?=
 =?us-ascii?Q?00UY67LOsR7HWwBbwykn+C7lsVP1mKmFn4ci1UYzKwVJgnXzgs9SPscGabrH?=
 =?us-ascii?Q?ZUrRa9CeVg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d04a55-d38c-438f-ebce-08de8a21fbd2
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:52:49.9773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mrWlwJh3Jez/JBTrzfsYA/i7CHe8IsrwrIHlgTWcererPwnlQJ1cpN+l85SWd2Mlvu81VSX1esQl82Od6OIAhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7441

Derive Clone and Copy for Revision and Spec. Both are small
value types (4 bytes total) and Copy makes them easier to use
in later patches that pass them across function boundaries.

Add a Spec::chipset() accessor for use by later patches that
need the chipset outside of gpu.rs.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 3b4ccc3d18b9..3cd7709883be 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -184,6 +184,7 @@ fn from(value: Architecture) -> Self {
     }
 }
 
+#[derive(Clone, Copy)]
 pub(crate) struct Revision {
     major: u8,
     minor: u8,
@@ -205,6 +206,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 /// Structure holding a basic description of the GPU: `Chipset` and `Revision`.
+#[derive(Clone, Copy)]
 pub(crate) struct Spec {
     chipset: Chipset,
     revision: Revision,
@@ -241,6 +243,11 @@ fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
             dev_err!(dev, "Unsupported chipset: {}\n", boot42);
         })
     }
+
+    /// Returns this GPU's chipset.
+    pub(crate) fn chipset(&self) -> Chipset {
+        self.chipset
+    }
 }
 
 impl TryFrom<regs::NV_PMC_BOOT_42> for Spec {
@@ -291,10 +298,9 @@ pub(crate) fn new<'a>(
     ) -> impl PinInit<Self, Error> + 'a {
         try_pin_init!(Self {
             spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
-                dev_info!(pdev,"NVIDIA ({})\n", spec);
+                dev_info!(pdev, "NVIDIA ({})\n", spec);
             })?,
 
-            // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
             _: {
                 gfw::wait_gfw_boot_completion(bar)
                     .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
-- 
2.53.0

