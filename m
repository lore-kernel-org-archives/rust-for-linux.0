Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012020.outbound.protection.outlook.com [40.107.209.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC552E1F02;
	Fri,  6 Feb 2026 04:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351695; cv=fail; b=e5yk/iG22fKyOy8mxm5JEhK1FU03PjT/co/S8vglnpNgxh2g3/LZzQq36uFTXkpyDNYotFH7RiW0Z/mKWXwcqp0rBb9QHL+cs13puQlKA8Gj5uKdf7v7kPP+0BTMFKs0hJLzEh20dYCEyXTBVUCsrjY1qq5f7Wi9LvSzWnbz56I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351695; c=relaxed/simple;
	bh=+tB4O4hMj7lM5nYM0xeDp2O0+2MTFTCmytg3WnuBzww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OP0BYETDn53EH3gcv/YLY9Y5hpp+f9u2Q1xjxWVZL2XgtjBIep7G09ON3xoxCBbeGj6etkPthyoYU0UCN5CjxEN2rAD4CRNdiTEmQ3O98/kTjEN1c2d/B4bybyNc892P71FAAol9JqBzKAXeNLTwB4ZHHvGu8gfQxe4Rvw7i80c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LtWLjJpd; arc=fail smtp.client-ip=40.107.209.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LtWLjJpd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=beBMju7e1xXEHDXyKWsV20WprbgA3wnC98WYYY6DgzXR/grDHO1Gi+AE4XJMdxGpxlQk5zQ9wA8uvVDLVaflDpCcHNsUkqKOEGF5XJT91xXPfJq9hiwVt7VkeAAMgUvrA7Q1eIwpHm/yv4iaP3t1gb0PnMx2NS2jMYnfIfm4SByb0yec+TeBtgpZESFjkEc3A5sResgbZXtYWNF7lhQeuoyECndHX5W0rbnG5QamPipTpPLLiOJy+jouH/PMLZeAWpFlSA+88T39wg0pbpblKlBytkWGNfgP5aDk6ODz3Ielj+H6zfXfyuhrC4jSnGnsbFKDF9cVMBAiFuIhwBiDxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wIQin+ltHiPH4dMdXkFO33jCmSaDE+84FgdGBAYDhKc=;
 b=B2Y24EzKIQeBn3PhwcrLsouTj27KQwrg+h+hlkNttAEoTLGwlg1Hzu2l+AjFA4yeR1AC8A07vHxuyT7U323zt1PvP70D1KINwGfEgsWu7ijWVpEz97GJciOG6Rk6nknGfByrj+8hjFKwDL3mIsbzf/RZW1d/XQPa9CWgbHF6h55Vb9F000Z7AWu5yzK+n5t5PrPAyFPKATmSFDgOX5xYTE0CHzyeef4qIRU3L+oZ/ywkExJu9NzJSlnLMYDkXLRIqyDV4ZuCqgk0zQyE4rA1qMInK6l3ZcEjQXOLpwg3hnln+6RmTR4GLui8AYqzS+8kN4SMAodti1O+wia6fKyaMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIQin+ltHiPH4dMdXkFO33jCmSaDE+84FgdGBAYDhKc=;
 b=LtWLjJpdxbqok4i+oJ5IT/Yw7rFZugNF+u65yk03nz1+0Y4EP9BoJZdvACjAarxR3O7szxFCd6KRPC/neq31EYhDBrB1oqP4Yj7+LyoFeRkXQXhK+9r5314bJdyVw1mUSSLyKSSMnyYzzNmDANAPsMAl3EV2hoNR0MnIBO1YKHYq1pTmd5RN7W/kmCO8tMeG5VD+WT2OHv5+fmQTnJRzRYKlv8viKoRnyA9H5YwYK0an0A0NvIsLddCfKFVrTzppZnPxirQtolgvIiVJ4L9XYHYy8p4ryO1nS0B6IYld+CRZvwN1V/O3Ld4DEngeNdmcmc5dMRxd6/PqO2xIZAlArw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7209.namprd12.prod.outlook.com (2603:10b6:510:204::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 04:21:30 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:21:30 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
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
Subject: [PATCH v3 03/30] gpu: nova-core: Hopper/Blackwell: basic GPU identification
Date: Thu,  5 Feb 2026 20:20:56 -0800
Message-ID: <20260206042123.303281-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0299.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b2d5efd-0eaf-4706-4f23-08de653733fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GMlqBRQha+Z7CQG1rRUto0gc1gVFYdXND4PuojFkAocT+lwD9FZ8HO+vQ8Go?=
 =?us-ascii?Q?mHnn9SXiPl9JCJnuExFgoep+rAV18SjpMdX8fDdrj2OtRhrZswARCiFwHNzj?=
 =?us-ascii?Q?T9l4D2h8w4iBfNNJF1qaaphE4P2XjVJsB2WEf86oIJx6QQb08cmZWV6mZMlA?=
 =?us-ascii?Q?L2zT07KgmeX9GSh3bagPsv0/CO21p9LvliJCW9rakNTWt6I/WEQFPgQVt5W/?=
 =?us-ascii?Q?z8EXFoWmJCjH+g7y6l5RsO60o+rI+s3y6UwcHxp+HdP/f1XlUjUBkrG5bnB6?=
 =?us-ascii?Q?j7suiQdA92qdUfmeIvbJlMH0LSA8UktBM8PrlCHGOGdMQKuTRcXh6+k73kSc?=
 =?us-ascii?Q?3eRIeobWaE/AYdMygirYlopChQTcpbvhBuWV3862128tB+sJfpQvDwyEGl0W?=
 =?us-ascii?Q?PK7JZDQrMxgLhNKlDKP5rO7WkqQPir5NCvpdiQAVXYvTjs0nYdcLWhpnwZ4m?=
 =?us-ascii?Q?h9LPz7US+dK1AiIcQ3zLuWW/YfSS16haECaOlf7nnweh/l5CWf7u5+QKVrpm?=
 =?us-ascii?Q?+yyTg7pN6Zmrxic6BLmO6F3ZrNJGIvn6LrcDOcfceac5qhtQpx2vlkEGNHkU?=
 =?us-ascii?Q?bndIjf3z9uKEc79jrPCc5vR+/jC3hJBwT6b4GsmexkZgROKSYyJenga6EBeD?=
 =?us-ascii?Q?kXl0u7Zrd7kN/OwmLyHODwzrvXyt5a73pGLD+5pE41P7CpQrzDgqurMMk/Lq?=
 =?us-ascii?Q?wgEobR6h4yxJghx2Dk6GW9k8Nb5sC+0sM6UgV0DlLexYlHEUpwLESGtEZ9pz?=
 =?us-ascii?Q?vwr3yiowQyjZTHfTLouHxHpgizCm5Jld9P4ptX6od8cueGGMnMniO3BW1vTt?=
 =?us-ascii?Q?4Alwu3Bi5lPnlFH7qFZR9yb9izJLGfWmeAFAMeSzi/zpez+pOMyJMfGC8iPu?=
 =?us-ascii?Q?DcilmgoEZvIAbu6pYi/WQjl8lBmqVZQFgFfA4vz3Dfnzgy8lYElWIzmS4pNE?=
 =?us-ascii?Q?xzfi3c++GwD9soqR0ngH84/F7OzjeeJgjillbuAOSWTOz4Fsf+VOtXf62zGx?=
 =?us-ascii?Q?+Z82HCTGksRgrlD9be6By0fC4FevHPYtNI4lCaqzaNnozxHrHQeRVqSkHYDW?=
 =?us-ascii?Q?/LeDpevWhz6r4cTgc0mmexPMjZ8LzY5tz++yr6fEX0tmxeaghrKuNIIUHSA2?=
 =?us-ascii?Q?KG/v+DsoLc8h0oQYBN88qpxa4u/AwoZUMDpyISXHlTQH4PYq62IiDbYpnA3a?=
 =?us-ascii?Q?yM+vj6OtiPXnZuA/aqKBbufbcuhBiwl2c1FsnhbCmmjZA+DICwZZSUvoj8Sj?=
 =?us-ascii?Q?qiezYGw4kU0qPHNqtCA+bVM5sPXAvFKdDRhguGOzxmD68gOTKa6nfGqwudJz?=
 =?us-ascii?Q?9abC8jTpPpwiGKh9RXpw/442qQ66J5rgYrIauuKMsBupYPuPItSuzKU5fSWu?=
 =?us-ascii?Q?/kugdFGkNVNAmj3DP38s7DI+E9TPiqiyMgQrOHlFzOdMVHy8DKzmDCYUsURw?=
 =?us-ascii?Q?NCGQ2lA4OP4+ZxIOg4DJTpHf4UfTsXTfpi2oWjXthUPHoKArSEtus4XjJXnC?=
 =?us-ascii?Q?o5s7dgq/cB+EHni2v4VVCkV0dA6nrOcG7TDvgeWoPd/c+ddJkblNp3v26CZS?=
 =?us-ascii?Q?0vzwjqgdUEnd8C/aM6U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rrW9stkI+PV4fDj7LolNTUcl7QzYC9XHVRMBet33BJs+fV7qU4RMeG8QhgLQ?=
 =?us-ascii?Q?+HroQCEIM2fYH5vl3kvI83FHqZP6UIwToMU1m/9dqlZguKzSlEyN9vIxI4Ha?=
 =?us-ascii?Q?Fjje4VRP1+4X0gVy3Y+LOVogiqCFGfGI2dHjn4cqHdgX/4O/x1SPJZ00bVPY?=
 =?us-ascii?Q?wpMfvM46eBk4s8BTTjOLq5mh6YqQJG6vXTqfWl+ZCrPMunI2KgBYb6xuelZP?=
 =?us-ascii?Q?ulyyfRhMJgKhSb5BdB5jq5jYmPEnZHHYRRzcxz20dicDivkDv2fnp+GKEyj6?=
 =?us-ascii?Q?3QQzbvbfLqWXyXBhcZ8YRxAkAOirNaEHvVaHWO7vUlil4NCCDwImqDaj94/4?=
 =?us-ascii?Q?xQEu+xBkmt22vOFBe/y98K9jN49awO4l3TZfRLZV3qqGX2WCrkxEj0iT7B+c?=
 =?us-ascii?Q?1jfSfXdmp/7JSfXjGFWzwmMLsq/T1o7ni5lEPB4La2SyTAaMRAhajpsI2tAP?=
 =?us-ascii?Q?D/ogwW/FcEqALYOz2xzWz+2tw4qTCBgX+yNJ/2kPgshPgAEDOMGl2ybkRO00?=
 =?us-ascii?Q?hnu6iXOr+neVkir1y2uxClecb+/Sv9JX/to0RuXoY+Vq/hrOvB7fYZbm4NDM?=
 =?us-ascii?Q?QmTTyR8wHPV5AYVx+cRYqgFKIcNABauUW4DWcMDBWdvdMDhVFR3QgZ8iI+fm?=
 =?us-ascii?Q?/BsDTbcBjUpEmiSW45I8SByumYsfE6+85Jyp0hm24qf0pMw7IxgRwMhCA5OV?=
 =?us-ascii?Q?m0hsf+a6afiFUfVdRz7NHNf94wYM49jJTmcATfLCWTX50Bk8rvwOFppXhRAE?=
 =?us-ascii?Q?dhOMOlmdGXMAaAcb3SbdIHDsYnac+8NXxemZjLeA5/jo9MjYTZEo3tykHsy8?=
 =?us-ascii?Q?V1VmABF6mvLbQMXw3LlTyI8UbB7Wncj2T+ncxZhZnKkVQrg1IF33MQzKXAkT?=
 =?us-ascii?Q?Pu1y6HwBIoZ0wzdBnmV08/KogLbj+RdUqwV+h0hKh+S1qDZJADAnNQotGk7s?=
 =?us-ascii?Q?DgJZK6p1Babi2hzcftCtahdEIEblaaTKo+7AZ74oGvGqfAFS/gvXyDi7dhZG?=
 =?us-ascii?Q?MBObtg+yqqFWfrX7R4TVwi/0kz1Jgi124XZvix2Qnn8PRWuC59tIT9tnGOVN?=
 =?us-ascii?Q?saTa9vqRo7TWEixPpznc/7xrMZ0f3We94uQtWIUE/YRvkIgbhy+rVOdpsUft?=
 =?us-ascii?Q?xzn4Mj0XXQB4S4AVoYU6SECFkuE8INVpBGVt9lPl/42SScNkbO3U42woaQaP?=
 =?us-ascii?Q?6+GgMNnpjyrlobR2LV5D+BTl49CoWNZ4YB8dAPaE6Ekhb5o/DFEVmJKNW72i?=
 =?us-ascii?Q?dJjcKzX1cA2L5hOIaCAYJIdUKivpzl2zPeUW911WM+MYOAlme4O0Ap1lPkgG?=
 =?us-ascii?Q?2P+WqnUjuP8hqYHRKAvtDQm3CpSJhQmhyteFMNKQ9D5wKKBb6Lpws0l9lAby?=
 =?us-ascii?Q?bqXDy4NSD/qOmbp/q4YoIezSrWKhdrbKUKIlTamW5TCEcOowU/htceRAGFgf?=
 =?us-ascii?Q?iAEb7snF+QdhoXETV2lZ+d5oytMp61iDiGGnA1i73wNB9euT+5+CzaR2hQ0v?=
 =?us-ascii?Q?acfD9LkqK+HhzzYaEhgavyNOs8PhhrvPWP8OpL/GoeFIpgKU/lVLGxmMTsqC?=
 =?us-ascii?Q?F8H2jUQkOSmlzGXLSduEdi52tg1qL2/6iSaDFopPLongEqkERNei/QbGj5Vb?=
 =?us-ascii?Q?cCu8x0ree331zhHi1ArnPJQr7VzFJNl+berq4tHlUTS5ZH4spaxycttTrG4I?=
 =?us-ascii?Q?HlAPXG0fGbtcl40YxoP4T2ArDviIzj6j1PINeno3CzG85WC2MJQq6dcQNRy/?=
 =?us-ascii?Q?8MCDE0PZBg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b2d5efd-0eaf-4706-4f23-08de653733fd
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:21:30.4077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EEOCPVORxbJZmBZAK9Oi3xieNBFwE0iBy5eYcy/2nwqTC/U/a2tFUkdQwNqxJnFsF8w+SSLepAncPxIos3BmxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7209

Hopper (GH100) and Blackwell identification, including ELF
.fwsignature_* items.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs   |  3 ++-
 drivers/gpu/nova-core/fb/hal.rs       |  5 ++---
 drivers/gpu/nova-core/firmware/gsp.rs | 17 +++++++++++++++++
 drivers/gpu/nova-core/gpu.rs          | 22 ++++++++++++++++++++++
 4 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 89babd5f9325..444c95fd4ece 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -76,7 +76,8 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
         TU102 | TU104 | TU106 | TU116 | TU117 => {
             KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
+        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 | GH100
+        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
         _ => return Err(ENOTSUPP),
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index aba0abd8ee00..71fa92d1b709 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -34,8 +34,7 @@ pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
     match chipset {
         TU102 | TU104 | TU106 | TU117 | TU116 => tu102::TU102_HAL,
         GA100 => ga100::GA100_HAL,
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
-            ga102::GA102_HAL
-        }
+        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107
+        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => ga102::GA102_HAL,
     }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 9488a626352f..bc2243450989 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -222,6 +222,23 @@ pub(crate) fn new<'a>(
                         Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
                         Architecture::Ampere => ".fwsignature_ga10x",
                         Architecture::Ada => ".fwsignature_ad10x",
+                        Architecture::Hopper => ".fwsignature_gh10x",
+                        Architecture::Blackwell => {
+                            // Distinguish between GB10x and GB20x series
+                            match chipset {
+                                // GB10x series: GB100, GB102
+                                Chipset::GB100 | Chipset::GB102 => ".fwsignature_gb10x",
+                                // GB20x series: GB202, GB203, GB205, GB206, GB207
+                                Chipset::GB202
+                                | Chipset::GB203
+                                | Chipset::GB205
+                                | Chipset::GB206
+                                | Chipset::GB207 => ".fwsignature_gb20x",
+                                // It's not possible to get here with a non-Blackwell chipset, but
+                                // Rust doesn't know that.
+                                _ => return Err(ENOTSUPP),
+                            }
+                        }
                     };
 
                     elf::elf64_section(firmware.data(), sigs_section)
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9b042ef1a308..289785530ad7 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -83,12 +83,22 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
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
@@ -100,9 +110,17 @@ pub(crate) fn arch(&self) -> Architecture {
             Self::GA100 | Self::GA102 | Self::GA103 | Self::GA104 | Self::GA106 | Self::GA107 => {
                 Architecture::Ampere
             }
+            Self::GH100 => Architecture::Hopper,
             Self::AD102 | Self::AD103 | Self::AD104 | Self::AD106 | Self::AD107 => {
                 Architecture::Ada
             }
+            Self::GB100
+            | Self::GB102
+            | Self::GB202
+            | Self::GB203
+            | Self::GB205
+            | Self::GB206
+            | Self::GB207 => Architecture::Blackwell,
         }
     }
 }
@@ -132,7 +150,9 @@ pub(crate) enum Architecture {
     #[default]
     Turing = 0x16,
     Ampere = 0x17,
+    Hopper = 0x18,
     Ada = 0x19,
+    Blackwell = 0x1b,
 }
 
 impl TryFrom<u8> for Architecture {
@@ -142,7 +162,9 @@ fn try_from(value: u8) -> Result<Self> {
         match value {
             0x16 => Ok(Self::Turing),
             0x17 => Ok(Self::Ampere),
+            0x18 => Ok(Self::Hopper),
             0x19 => Ok(Self::Ada),
+            0x1b => Ok(Self::Blackwell),
             _ => Err(ENODEV),
         }
     }
-- 
2.53.0

