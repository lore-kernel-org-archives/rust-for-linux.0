Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010020.outbound.protection.outlook.com [52.101.193.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72ADE3446D1;
	Tue, 10 Mar 2026 02:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108743; cv=fail; b=D798iz6wwDhgNBVat6UfPnNpPR+nBrWJWplZ8scwtk+JvZCczxvvvcv55F0wEprkuggiP1MTYKcGmqJ8XfmWZ1Yd6PWOaLKBqoOamWq+54DucWMT/WbZrWCkwt/dCU4gW5NcPOia9lFbVxrO4i/mzZ8x6pdLN/7pOzSic88oc6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108743; c=relaxed/simple;
	bh=5qKDKrnf6WMsW8NFQMAZ8fDx0sJbh3gqxl7fRDQFSsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HfT19KrBv+7h9lxvnCPPEFTij2NtzOQe3vFEmDbtZ+ZCSm2/q6XOG8dbFPL3wJ/jv+9HchRVrK2riOmAQTmqnlcmsYdKxh6OLyGKpPtpgxopkmm70a15d1gYeVbKxmSdEdv24oUr4iVfth/i0y+m0FF6hYda9BPvSaXIimqibMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CYXOIwIW; arc=fail smtp.client-ip=52.101.193.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CYXOIwIW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YUGyrr568TQWSPV8tQrBnUFouERmk4C45Xs48vEWXZut1y3sjqaRcmuFw9LP75BmVlsTl7NovYEhGlyYhsyJCEh3qDymlSRP0bWWnP0zTwWSo0wkwtZ3eFhYi6FC0WbmDuOt1W+lIHlE6DLP6HIt+Rzq/6EJYAHVoMSUrTZCoLxs7qTGHKOX5Zfh5dUU8FUPot/yRlGppYaF9jWvI82KWJyHJ0o0MO65lhXQhLcW9Gac8Zdnoys/lVsDSMDECSO8V0eOcg3Odd4BfFYpk0q3GcVt77sMm+YJyJJWnUX98milyNDYBg65BUA6ue4gZEk+dNhgyPS1SZT5hRP2AJYmLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fs62QL7/nSRVUvQQ5xG/0yPNtd/MfxIGjFxeVylHaVY=;
 b=qcwHGVj/yI86OzOuCW/jqGY/KUpfNXMjb010kUUOD4SbeU+IpDde6p/PTJfjnoc9PP7LCVIBL6x5Lz9SNGqykoqOV8RjIttusCZMSnW9O5rzG8tG0RriJwNUHg9grvOuRa3Y7gWK6gmM3w9dvJvCv+odRvEwm4Pa6LNquTsKoJ8N1xqr9fTzbXrPsQplPhVJ3gdtvSu3wl6SxymWp2Kv8KNtRrRTiOgiJH9pbBan8SHC/hyKzLR4y6A5FOH4oiFHEF7E5kTUtTxafbNCUM50TVLYUJcOdlnezjy7F4fLCgGyRq3UL6hoeVTAV+jlELiA484n7siUwMjGRuPd11sCjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fs62QL7/nSRVUvQQ5xG/0yPNtd/MfxIGjFxeVylHaVY=;
 b=CYXOIwIWLSjQetb9m16GSsJGubL8Sqc363w5kyRmMMGDmEi3gpnUVbYuYkrTB2KEIGyxlJcsSCK1oA2OFUD19fKlP5PH3Xb0alZhjiM0YdpKudH52+4+znXt5t1x8+a4aP8+mzMJ/pWOG5ZwG98U/Mp3BkZRyhfm4YahxIJlIBKMGsAd8jErCeeaHGW2KSoxyr0HLV2vtTS+HYnad0jlYLqwPaLoPBvODsGn653enJE+UxoWMxy0DJagUJY+yrsazILS6CDrnzY1vtLY/poYgxSRJXDMTMzzmXfifdYva3eLwXrbaDVNGrmbq7sCVE+0jA2cbL2bAFu2gOa3DNcIFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB8070.namprd12.prod.outlook.com (2603:10b6:8:dc::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:12:03 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:12:03 +0000
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
Subject: [PATCH v6 26/34] gpu: nova-core: Hopper/Blackwell: add FspCotVersion type
Date: Mon,  9 Mar 2026 19:11:16 -0700
Message-ID: <20260310021125.117855-27-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::32) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB8070:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f7d786f-6510-4d43-baf8-08de7e4a6b8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	IRst1DX8BoBdEdCKAP8Z+Knz9hqQg4AzJ3PM0fBy/9tRwYojIGdtEQ17M9DgVZiAGXc5dPpjgeTa1o9RYFMTh8VlDwvMorRJuSN7VQ61k/aGjKIUNHeCmH0tQEqBgXC/XFndNqyIjg+/1NwK6xfgBQfVrtUSNRupwBzxlZae4AaEagmnFoYD2UhgNNefKXr1Qzg242M0h/h9HbQgjLXbBdtYhwq+gEdjhUSuoVotk2wMpXgNYbvoW9G/bECVYkL4BkxWZcRC1TszoRdfzQvRxNMiYF2taZmJmE0pxT9lTBV8pURWyHSz6CT+M6dXrsgwVLkeMdNjhUyDX+iNNjIWKE0R3zsdTisXHhlU6xUXdT7xYLlNgmZWehwmlJSBb1RlStbZNq8cVZ1mpL1+5sCICXLWgWCQNQxQaA/NtosZ4Vt+8Q7pTsuDcmkEweYaOBt5ck+n130azpYAXjQKGH20ioK20aLh6hCNmlE31qJ2deSUN7YOokPeYZ6nGbayHAtVl+RtQuy31VEHzkVRn4hdPcM5e9C6HyUopG+mLZAzpOBaH4qfIESFR52VYeKBsvPaWLbJeKqmo/b8e+bAPojfho+Gmj8C5krLZJ/5cKICa6nFtqbgCgixlTGpI5aCcpbrCWavxiwEtFGmZcihblE4Dduj9YuhS1BoE36p85sPNK2O/9ZkOsyyKqLkzwxxsfvDY5gWuB8Ubu7t4Sdjxbx5x059vA2MG4JyviHuyxm1GwY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/nx3CsI3q97ae40J0RxHFhNCms07UyOHqltjl+Y1hXKHirBscQjiryKuTeKn?=
 =?us-ascii?Q?RvAg+7BlgBPjkG1snO7PxL1jMrL3KVkmemjRu4+S6g/cHnxrKR/JTHEcRREf?=
 =?us-ascii?Q?v/308b/F0SJSQserpYUXkgHOT89wBU7/DHoIZfJERXcfk40Psc2bHo/is31j?=
 =?us-ascii?Q?FpL+Zlj2CiGHsbzEcJKUCRuCBozqpzZsvApYt/chSbkshPLqdn97+yEnbB77?=
 =?us-ascii?Q?gA6dq0i9dFHy9D3saIO326EDSdwiqQuKMEobObvabmLMm3aTfFILv6Aqg1my?=
 =?us-ascii?Q?Kz0AH9tk4gYYxtEh1jYXM636rILNdGydw9pvcfBPu/jqSujmZLb/Nq+hwyxC?=
 =?us-ascii?Q?PsoAKtt+WRVI/Mjx/yrfjvXh1S+5ubj7fAGJzqFcDd8nF+AXOTNJuUB/BznB?=
 =?us-ascii?Q?DVZhrOmdKcc3SqjqrmSn0KK0eXwX0rsm7dXE6ELraLYvKZYvNjXrha9nGF5F?=
 =?us-ascii?Q?pBwZ06etaCjwwSHXPj8ayDNFQIMojz30mepW65FZwMVsRgB+ljhQw27NTUVi?=
 =?us-ascii?Q?bi/LDSMg/WDxQxmPZ+83GY0xbJa4OAWVdZ9DX8jmDF+ud41zWk/hgCu4tua0?=
 =?us-ascii?Q?QQ/SrEkCt+sbT1WKa7Pyg6Q26RgtLSNYxQuip0DHKgqMNHKJQIdQx4LNe1DY?=
 =?us-ascii?Q?fwuIsMHDoeWHq+DZ/PeztYzTccXTblJNmub8sy2nMt9dF5Nw5egaFjqgcVQe?=
 =?us-ascii?Q?1kQ9EbyGmKZrK4OhqdiaMIZT7WO2LDHw5GWZphnVtD6aRQM1Adw9Lo7ul+gg?=
 =?us-ascii?Q?9ZTxI0OibdyWpiLvq7qqWDxS/5ljHfRr9XdhLRbjVRCN00OB3+yaGsHVHL0E?=
 =?us-ascii?Q?Sn+qtWp0N43cBGhy9u7J9/rt1tubjKqS98VPAcFLcIzm4ep59mvqzqnxeSNg?=
 =?us-ascii?Q?CFttE7SWZDQ+mTFKo+dE9oZHaoo0R7c6aNSGZRr/eQl1CPpRGcJrAsguD28i?=
 =?us-ascii?Q?iyNAqRrfqqHl1aMzHJ2+0Hb/wZSu4K9KhstaQhd7+JRXBgVyEOSRNYzAqTke?=
 =?us-ascii?Q?WKsVfy994yz/hhs3Ih1q8aalfI/1p9Pv/E7vjfdcYsVoD9cxqyz4dvb5HKIF?=
 =?us-ascii?Q?uHZt/s7sk+8aCEiQIwq0rpL4tm7vXaCFswUPdH2GeYel7p75k2qRQd/ns52W?=
 =?us-ascii?Q?hsu8mIGvz9XsVn3MlCML0k9rA+Nm/4yPtpYBI9Lqx1azKBoX8HcyHUAKUxaf?=
 =?us-ascii?Q?lGHdLcxoRVue1ESZf27Cgqo2Bit/sBmqVUSojJIQNx2RgTDtWTbrthb+s7GF?=
 =?us-ascii?Q?WVV1mVLkwpavdVPVUF96A6nB7ltScZSVy/fj4wQKhp5k01zMHv2wfwrTGvDd?=
 =?us-ascii?Q?VRkr4sDPpPv5Lf7O7nKJsYYEKoJ2rcVxxNo2pR4tkGfn+lIdO3bQ9cw99i7m?=
 =?us-ascii?Q?Ywk51PiFyb58xH+4kNp+2EneO5A4D2qMkvilDJtNcJfu69ldbLQwYrcLgDpp?=
 =?us-ascii?Q?bzAeAHwfZrUSSJh0hEPetBY54VumZV3p7Ma9+cueZNEJ+uegWEz1rQSDtV4c?=
 =?us-ascii?Q?Kl335Z+fQp/A7ymE2f4YXx1FPm22CS2e039rOwUzrwFgKmWNlp5Uj1eRVVNw?=
 =?us-ascii?Q?5WmpyXcwI7Cd9oQozjfLeSTyT/wAtktBRYMusBYeGGamHp2wyilhNEUumyju?=
 =?us-ascii?Q?aMhMfYI05Ypn4ZBvNUm7XfKR4cione1SUgOSLcTrirDXWeVI5QMAjQRRYcRc?=
 =?us-ascii?Q?ZauSFPCerbtqJ3lCNP/brsZxMNnDf/CeCGY5BrA63iUyP/9okQ/CyXzGli+0?=
 =?us-ascii?Q?8IPFBGNp8A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f7d786f-6510-4d43-baf8-08de7e4a6b8a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:12:03.2476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02sRVFk0c6WCoAIppWdcUCZglVy6pyIOcsGDmsC+MJcXB9h6DUXDgMEWDc0jnFt7z6FJrghnMACde21kF2ai8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8070

Add FspCotVersion to represent the FSP Chain of Trust protocol version,
and Chipset::fsp_cot_version() which returns the version for each
architecture. Hopper uses version 1, Blackwell uses version 2.
Non-FSP architectures return None.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs | 19 +++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs | 14 ++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 20c439fc7f7b..8926dd814a83 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -25,6 +25,25 @@
     NvdmType, //
 };
 
+/// FSP Chain of Trust protocol version.
+///
+/// Hopper (GH100) uses version 1, Blackwell uses version 2.
+#[derive(Debug, Clone, Copy)]
+pub(crate) struct FspCotVersion(u16);
+
+impl FspCotVersion {
+    /// Create a new FSP COT version.
+    pub(crate) const fn new(version: u16) -> Self {
+        Self(version)
+    }
+
+    /// Return the raw protocol version number for the wire format.
+    #[expect(dead_code)]
+    pub(crate) const fn raw(self) -> u16 {
+        self.0
+    }
+}
+
 /// FSP message timeout in milliseconds.
 const FSP_MSG_TIMEOUT_MS: i64 = 2000;
 
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 21a8c6c2d96b..02f69c5975d3 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -21,6 +21,7 @@
         Falcon, //
     },
     fb::SysmemFlush,
+    fsp::FspCotVersion,
     gfw,
     gsp::Gsp,
     regs,
@@ -134,6 +135,19 @@ pub(crate) const fn arch(self) -> Architecture {
     pub(crate) const fn needs_fwsec_bootloader(self) -> bool {
         matches!(self.arch(), Architecture::Turing) || matches!(self, Self::GA100)
     }
+
+    /// Returns the FSP Chain of Trust (COT) protocol version for this chipset.
+    ///
+    /// Hopper (GH100) uses version 1, Blackwell uses version 2.
+    /// Returns `None` for architectures that do not use FSP.
+    #[expect(dead_code)]
+    pub(crate) const fn fsp_cot_version(self) -> Option<FspCotVersion> {
+        match self.arch() {
+            Architecture::Hopper => Some(FspCotVersion::new(1)),
+            Architecture::Blackwell => Some(FspCotVersion::new(2)),
+            _ => None,
+        }
+    }
 }
 
 // TODO
-- 
2.53.0

