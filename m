Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010071.outbound.protection.outlook.com [52.101.85.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9173546CC;
	Sat, 30 May 2026 03:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110644; cv=fail; b=Bf+PXrSVmwYHHCH+80aWqmNBz7ukiqced5BvBR6f+XHMf8TtXfAKapiycI1DqOVqZSM5olvMfToiGe4xsSBD6t9CtK3dJPaglWnppXVi3kwabL9OWFsAdXNmmMMrNG6FpETJSFtTQeRQ2IsU13yXScG3MHByesJnkZfgzd82asA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110644; c=relaxed/simple;
	bh=Kr7Lu38lFzHC8ePJWYedhawvoaVgOgJiW4Ih6FbdBmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ghPV93TZ+WtQDKd/+S7vBBSZ/ElEY7l6uf5QbBNThHrxHe+fUVhAxG3D6RiqSJHjeFs0Azj04VadioxYyKjvbWN57jR+KVm8v/+4hp9klI8KBWnDtCL/pWb8ZRmmCh854PwKDrw4GF380PO/BNPWVS4aIWFREYqto30Ut6P14x0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cEEWP87r; arc=fail smtp.client-ip=52.101.85.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cEEWP87r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRNnYtdauB8CqnwONHQfqy9MgpzEnmgncYNT+ZnnnY0rjHKxRKtObNjsdiIwzXoHCFim+cX1IXhJzISrh8JcUDONEvTIHTdZZ9a9xThZPBC9fG+4/3heamopAMpfnz55EDPwdzAOG6pFbqJEjHcl1qxPjpOToAQmIQyhG3Mj3vbIFcPzhDm17tQMM39VF3lUFrDMNQH3mUAksJbhAaeIiYROScu0i2f+ilAzDvjFixV0BKSNWvenzcNe4dRmOKzvUdzh8f/iant1b+r9kQPLMhgvmHByg7xjRXp7hnD7S601ARmaZyghsxEzYxPXQ5p2rCs4JWn7GEoWrTzCQcCZlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1U7Z/eXuLKTlrqmwx33e4dldB5aAD6I0MWF75o1Kp8=;
 b=QZUmONjQBNObCy9cM6Cv9WMleEE88UEIzxa05d0K48rmEY8lsPQ0z3sfYkylf0kqDhpZLqxigiL+VQUhSTvUUcsV0RC/eh3bQQZ8lhmMomGYtxC86uuaAcK08boBtRc2dn7MpvVh8EQpelkSPD40Fa3KuPf4Q8qmKDqMz1IcKe4KIH0QRk8M0B5VTj2gtolIV2hg27kKLk42j8CClvUSE/k2ZBHzVWxFBke6YtsJLm4Na+GPvH9M3CEwzPQtiASNac5M+KcxGzVD+6X00PeZBIkvPZ2Koi6eXK2ZshK/5lODxtDs29KHBuu5hoGREbGllkcfZ0lpkppDolSsFHoCfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1U7Z/eXuLKTlrqmwx33e4dldB5aAD6I0MWF75o1Kp8=;
 b=cEEWP87rTKuY5a15pWd8926cyi0yOTd49JLUIHf3pmaInVrL3f5ZrMM8pZawYGdo1gHx2bke2MZnLG2Gu20KtNjMNjZqnqQ3EOS1l9qyeolNNX7mWxhJkOj679cp6O02z4hjO8OOeR6GXo+pmyJenfsnq3VZU0LczfvQoolJ6nkjE+GMSyRTOOKtbcGQdF6JbDDb/0rx2EgDPD/+cHJeFWom0CEtD1Q8fpnFft0rWk9qk8de8cZmHJVBDAhCZJiP8Ahuxg891GnvGvALZLyfHJYoHxOjtLA2+nMqz04eWFHkrOCaFylLAxwJjnoNvnRSBqJF4VXDdtwCLHlX2ycn3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB6850.namprd12.prod.outlook.com (2603:10b6:303:1ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Sat, 30 May
 2026 03:10:19 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.014; Sat, 30 May 2026
 03:10:19 +0000
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
Subject: [PATCH v11 18/22] gpu: nova-core: Hopper/Blackwell: add FspCotVersion type
Date: Fri, 29 May 2026 20:09:49 -0700
Message-ID: <20260530030953.740561-19-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530030953.740561-1-jhubbard@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0385.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB6850:EE_
X-MS-Office365-Filtering-Correlation-Id: ea4b0c7e-979f-4cf3-dafe-08debdf8fa83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|3023799007|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	r7VOKEUSmzvSG3DAKzXu0+Lv/EpEzOyslDpnUQpfnRzWSK8hUTrElNuzaW272r6CbvW3tZl74LM2Xjg6ErrdgeThhB7lqEFeRkNbQSUaoRcPEfAwbFbdezzFs+2UbqyTTHUJn0uNpsc4c93XZKZGZs45R52bxZYFMvIdA++NS6K/OS6Q1YcY+ViZk8XTOzKTdqLL80hEKN43JSqufBqvUj7Ov08RbdO0jUpOiba/ry1tcVMFOFyFANWB83gxVgVyAUbcCZvQBy9eLDLtKbR9Sd69m0RzlQXfRoBvzcCFZFXtEEyk73xCAv5mnF9xz0fVwAm7cZsH+Geo0WIyv1fd5AJxVpwX5pAV4lcOtiFcSYzXmI2RWk7aUV6iCEwVu/H4Ds8nBXDBzSg3IQYpcNI9IzvFReawLhwySFRvMClqCMGUDYOdf5qb2XI/0jaI662l8AD8AVM9cciUJ3GMsO7zMZR7giW0twppJJnS3ymFqN5rpDIfnpFsp2hdF6Dlo7Dp7w8b1Rn2l+oRKwTqCOOkFgaB4Onzcs6m/P1hQt8aou3IH1mFxE5QCLAXni9bovw93jcw4g7Onl9ejX4gIm+yv1oAgr4DWjwihUZ9KGQz6DelxvgCSxz279m7QkJ0iVcDWflPC0aRXietxUvN6i61r1OhmDJsbuL10Kp+VWqpC0uLmtjjWb9yIiGVCZduJtC8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(3023799007)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?de6VEr01+1r6RQEPFu0GB38s8pt6+cCFUWtYoVey/NPSqEs3vvEmuybTWS9X?=
 =?us-ascii?Q?vzaZUAHr8YcydwpwW/S4t0C7iye6iUpJ2oV1wmcXh5cAI/EM0L0lAyHn6wJu?=
 =?us-ascii?Q?x92S6CRMFgEAaZpKZe0rfttGwvAbS6TOZs6mxe0tcNDVoIdkdoLo7dyTd151?=
 =?us-ascii?Q?V/y+YFJ3slo0Gu/hy3frIEyI5StU9eHf8iLTURrTOXUN+9Sw432vX8JUU2eW?=
 =?us-ascii?Q?55czywCUcjaA69DT8exoMrXU1DiQseHsmax/tuUCH7blYBHodkY80T1TaSJU?=
 =?us-ascii?Q?SMCLwMtuGPrsUNsfK4Z17V2XqhJ5rpRKaDAchXEn7wL9GnH+j3vtRuUt8ESa?=
 =?us-ascii?Q?et7KHeqghd1lzLq5j3A1Mp4r+PcGCPMQ2ztrnaghETO8Obh7ni/HigNQbds3?=
 =?us-ascii?Q?2rYIIuFQa7xwAkmQ1h24g5v1i9/4SjO3iS44qs48Zq0qtx2EQSIA9vt39MDe?=
 =?us-ascii?Q?2N5SwJYUZmqtrDj9+BfWItzs3vyetV+tLkFNZaUACSoilEd9VyF1kB7uEB5w?=
 =?us-ascii?Q?MMfJb/lHZCNNF7ahEnFRI1wJSvdHsdbF+E1aOfsV8wDCRpWiFCC/UO4SgZyI?=
 =?us-ascii?Q?3E7rWp6m4l/l6Xiky0FQpysjL72DWDjRydBr4xq+jlWnaEsKSg9y2sGLcLGR?=
 =?us-ascii?Q?Bom1I4n7p0S7KAYMpLKrTLgbGHrwc125WUxSRiO7ZawvuPnYOhJBJk1KXX2F?=
 =?us-ascii?Q?ThSnIpC/Xa97i9HfD6ty32+69uDr84Po5FvdJNHkwUuZLV4Kz62epQJoGhY0?=
 =?us-ascii?Q?zM/EDB4nqd0y2ut8+vPMIb70Gi3ndbNDINLvaUT04s+D2zfJpRj/H3DHuwfP?=
 =?us-ascii?Q?7RYqW5axpJfntFo/Ib3f+7UGr19IiuSAZq+Rx/NrXo3PrLv1t4R2vs9UKckn?=
 =?us-ascii?Q?8S98lPmniCHZhFOSi7o5IMnBtDhABBGZHEpAkd0/5ze7pZdSAUgwgdNPs/25?=
 =?us-ascii?Q?quuw/dgfY/9/qZe6QohBYxKeIYWMjCrA8Lt2v883TsKAo58cg1tGdCX6Co/d?=
 =?us-ascii?Q?mvc7LT/zaGxvM2eV5JfxjdPcbfBlD2aUP7c1GG9ZPZHnChV9oKtGHU1nk9x+?=
 =?us-ascii?Q?XeOTr2Platfl4hDwoR9goDP+7bBlZXF8hQk23Zg8N3MI9hUZGpa5mAcNbOk8?=
 =?us-ascii?Q?Dc6L9NJqMu+xpRA8RQR1nkhPHdppTgjFz8QGaHzVPIUMbYk5g+EYZzwLSqP3?=
 =?us-ascii?Q?KLxRRtRSJ85ga8MCuUiOHks+zMQa4GOxNKmS16qeEIUwCYC0tOIWS2oTVY88?=
 =?us-ascii?Q?gDIqZ0m2Qaku++wlFA0JbE/Bd7hmJfkpJCvbCeEwKULyR1BncyEfIiS3tp/V?=
 =?us-ascii?Q?Wz5tB3BuF63FXNvixNBTzJAkcfV14ufwHLPmstlprPMWqYBcOrHxXm6yTT1i?=
 =?us-ascii?Q?jwK0me9J6HLrnxAufWHRHBtaIN/RhLdfhGRtFVN7q/9qyJiuNaggC00Z2BrO?=
 =?us-ascii?Q?DnNOYOrM8V+wZ9xMIDMFOz+mignvS4Y/W/4//5eZZMbizVmK7YyXNh64aQ1+?=
 =?us-ascii?Q?LhCeLcTU9y8ZDDqrmp3GOjGII+5r/g5Cde2nI/QbXskbRf4KN6u8YTeV78sy?=
 =?us-ascii?Q?1Ea4VeKKYEvPQykOGy1aRYPr7GB49mM237/Y7Nq+NkSvaTlIGbIFUqVl358G?=
 =?us-ascii?Q?isx+eJ1GWziYQqV/lf2VJlZeHLIdtcxbiYORJBBUWh/Movf291MMdjLFrtjB?=
 =?us-ascii?Q?UTgfE0nJxgpu7WFOCga9lk2h/6V6WrQqQwQwIoPEUCQC31pCo+q28hX6+ZGA?=
 =?us-ascii?Q?SJ3kI38EOw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea4b0c7e-979f-4cf3-dafe-08debdf8fa83
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 03:10:19.0900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G5QZBf9gc1WgTkXpk1SapbxzEAo/2sR3ReTEAVqqrnNRqF40PKf1Dy/BCanuWSn4v/IVA1E9AwtMAKcE3CrczA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6850

The FSP Chain of Trust handshake is versioned, and the version the
driver must advertise depends on the GPU: Hopper speaks version 1 and
Blackwell speaks version 2. Represent that version explicitly and select
it per architecture so the boot message carries the value FSP expects.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs | 19 +++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs | 16 ++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index cc2ebc3f6e78..5aae8282f2f0 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -36,6 +36,25 @@
 
 mod hal;
 
+/// FSP Chain of Trust protocol version.
+///
+/// Hopper (GH100) uses version 1, Blackwell uses version 2.
+#[derive(Debug, Clone, Copy)]
+pub(crate) struct FspCotVersion(u16);
+
+impl FspCotVersion {
+    /// Creates a new FSP CoT version.
+    pub(crate) const fn new(version: u16) -> Self {
+        Self(version)
+    }
+
+    /// Returns the raw protocol version number for the wire format.
+    #[expect(dead_code)]
+    pub(crate) const fn raw(self) -> u16 {
+        self.0
+    }
+}
+
 /// FSP message timeout in milliseconds.
 const FSP_MSG_TIMEOUT_MS: i64 = 2000;
 
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 7dd736e5b190..6cdface3c618 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -21,6 +21,7 @@
         Falcon, //
     },
     fb::SysmemFlush,
+    fsp::FspCotVersion,
     gsp::{
         self,
         Gsp, //
@@ -141,6 +142,21 @@ pub(crate) const fn needs_fwsec_bootloader(self) -> bool {
     pub(crate) fn pci_config_mirror_range(self) -> Range<u32> {
         hal::gpu_hal(self).pci_config_mirror_range()
     }
+
+    /// Returns the FSP Chain of Trust (CoT) protocol version for this chipset.
+    ///
+    /// Hopper (GH100) uses version 1, Blackwell uses version 2.
+    /// Returns `None` for architectures that do not use FSP.
+    #[expect(dead_code)]
+    pub(crate) const fn fsp_cot_version(self) -> Option<FspCotVersion> {
+        match self.arch() {
+            Architecture::Hopper => Some(FspCotVersion::new(1)),
+            Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => {
+                Some(FspCotVersion::new(2))
+            }
+            _ => None,
+        }
+    }
 }
 
 // TODO
-- 
2.54.0

