Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012002.outbound.protection.outlook.com [52.101.43.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D842222C0;
	Sat, 24 Jan 2026 23:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769296721; cv=fail; b=u2HUocBTwzSGfUiQ8ja+UXIFAijmCuZ5fqPq92fv214iQIrPHAN+EfTOeWeCIkIznRqBnMBMGnsX3AcAvzWtHyQDrshxh3LPm9+0r5+4peTItFuT6IFE1EKUjLlzRSiHimodb5JA9o0p3gkibTq1ZH1TtpDK06V4YIkTGR/I3aU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769296721; c=relaxed/simple;
	bh=HgVG2U/m8/woKALJfghurcjon/sESZuqo1VHf9QYxFI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MYob21LZc+rN7XBOpwyz/xZrrYmX/2E3hajmJ7+rM8R5eREpclWIEVg8JEt5EalZLg75l0uMkssGR1yRzNjdrMTfIea/1lU4bASat6GujkL815aXiEendv+wBNlKlPLfHmWOV9egjk/X1siL3OUdk86p6Ffj3b0QUBe6Q/FGVbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=G0Dk+JSW; arc=fail smtp.client-ip=52.101.43.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="G0Dk+JSW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCDAcr+YJZa8koj0dmVKkFhH/O/rv8k7xxOCTgaEaF2Ok00pAu9IG8Pe5CvSoLB22E5k/Fe/My7Ubi7lIFGrY7aMzUjfu2Nn5q4dxNvHTCxiHj34wyNrJTMl8HjG9LZb10tf4uQOcpPaHsoqAXGz4dYezkNN00OQznuPu9gsA73V8F1m35e/Q4gFsxQOGJUDj21e6puRKh4B48WGjpDO2De7QZ5aBPWrGdymu495yG91U7USvKCl1RPrxN5CjZnm+0wIO1sOsCMtcBp0GOyEOmHxJsIwFqolEVWTBX67Ak8Gl1cD7PONRAs2zhmeI8QVyKyTsiBlsB0mtTkrNba/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5uz4m478aqHl3eDMwePEO/2u245mI6tHy2xRkUyZ/Jc=;
 b=bsB4WnhQPhcHpkgq7hwMQ+Jt4tp3T3JTZoLTS795b8eg5efG8Fc8Gc9J1bTmwWRJCfjpRtLuBN8lJvnOPekVP/y6xF8nVX8Rel15rV9/M7mbvUV4qcN4jaLeuUzbM1DZFVCbGh+h9swczT6lbLuhYWGSNsP1eG4To6Ek1CM6LWBoPPw2LoF3lPAee01etiK9LmNo5WtD8X+iGcVMPQPXlt2ZkSKn9YGU5ZkLc4vBCUt6p7krm9V3Kk/IdgdzCV1FSaFrRR4qUZn8QJk8oeyH6wKl2VkEj2I6m6Uo+cooT2r2HSLcBK4dTa72ikZNN8Irv9ntaKP2IPNU+U2cYhrYYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5uz4m478aqHl3eDMwePEO/2u245mI6tHy2xRkUyZ/Jc=;
 b=G0Dk+JSWaDaEIuewFCspQYf3VVdHrvYTXjjj4BGZmunYylKiuX7YAAoIo+mJ1GIgiGoNbY+TyK5n6pnol8aHJFICDW8INm1EY8JUWlJd6HT5mBSzy5/fcUHccIqZdPF/UxFoF5wbOWdqBqR4NqOuWoPK937LsypDbNJ6R4qag/CycyHEVi+/y9EciMeGJsQfrDA1kvrJS0LG0K67neqrEb5DtoGGCM8hD7cEqexGO1A5vfajV5OhIO/ixRrTp97eh9Y6IPD+1CmvGsqplYn3WdbYkZbXpfU8ldWHw8XTmSlFjmjR+q4YI+UWr15EU0q4kYtPBj1s3hZE8MYIFKfd7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB5734.namprd12.prod.outlook.com (2603:10b6:510:1e1::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.14; Sat, 24 Jan 2026 23:18:35 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 23:18:35 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Edwin Peer <epeer@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v1 1/5] gpu: nova-core: use checked arithmetic in FWSEC firmware parsing
Date: Sat, 24 Jan 2026 18:18:26 -0500
Message-Id: <20260124231830.3088323-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260124231830.3088323-1-joelagnelf@nvidia.com>
References: <20260124231830.3088323-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::31) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB5734:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ddcef4b-398c-465e-3b0f-08de5b9ee614
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6Ial8j3LnQr+AoPe1JHsfvWZh5jTNPpQ0Ygh9fyakjdrTvhRiU0puQBpEc7d?=
 =?us-ascii?Q?jx35W397b1nFju874dl4rA/SAb5tuvo/1mrFqVcle6etxbrjwox16YOP8i6H?=
 =?us-ascii?Q?3vowL2ZsPzx9uNRtpRmfVXubHE9Sz0HUgPB/ydL6987X8aM2Ru70alpcbtan?=
 =?us-ascii?Q?fGAPSc0B1E0SytyLaRRgAkgyo8GefbU+aqdkquoJBliWgzZm+Q6yslaR6wQM?=
 =?us-ascii?Q?dPv6+SEdZ8I841C0rpnjc+mHfRtYrdV0hZmy1rnUDgxnn96rNHbm/q+bUuow?=
 =?us-ascii?Q?rX3Nq83u/KLCuPqZJ3Z7Q9+rQKcnP3nM7hsLLFfEPIDIBjq0OmEY4KsBQ4VR?=
 =?us-ascii?Q?7ZzmixJx9JEE0JIC/MEFZZarV5ziHfKO62068/VGLKqHx1t4Ac6DmB4XNFK6?=
 =?us-ascii?Q?3qiKr5LjGfHqb1qwqqja4KB//UIFbD1LdIv/Jtzrq0uns7D5nsYwmU4xIrKB?=
 =?us-ascii?Q?/1pveG251kC7pflNMMZlaCrYdGLxGT1U1cOMgGVyqTrpxLzmWQ5FWvFUbqkN?=
 =?us-ascii?Q?emHwiAYabLEkH+voehBqC0FzijpaaR0sNdIX2pqrOmVNDN+p9i7+WfdhrAOZ?=
 =?us-ascii?Q?tEaOE6AEarfhCLq+ew99Yh2VLhyzZssGg60gR9husSj4v44y0P/oFJzn7QTp?=
 =?us-ascii?Q?31sVh4guasuVyII6TeWAOc4BOkSMwEq3yPx3ikkEYbd9pQcc2GALinppFlQz?=
 =?us-ascii?Q?BK47kxEDhMZAaYpP3TzoaB9JQ9MD/yJp472x98Zzz1eZJbWii5XEGPxqgYPW?=
 =?us-ascii?Q?73eA+FgE2RijDAgRX89mpUmLAA28MgCMhl7Lex5fEBpUeDj5IWZoN0OGaXWp?=
 =?us-ascii?Q?u9nedEpFielDYMJSZ60RbdAJmNUawNWbzyIcBFBilDM9ctT2UyIfim+EkU0c?=
 =?us-ascii?Q?AhgUHId+SQnwPnPj1zyQJHHgir3WjSgV+YqTvohz3ymW6gsRBAUJfS5nHTGr?=
 =?us-ascii?Q?6OS+LyLTDnsZy2rEvckuheq+u99uCQn9ZWrPm/SFyacl9CezQwMgdVm/P2ti?=
 =?us-ascii?Q?YyMxclOJlFQ86ksnfXPCY8Z/fi1Fn/vVRsQvLXnsSfxDaUF1fl0r/0CeCHYg?=
 =?us-ascii?Q?3l6BPyd74nZtUam3DCB4vHDFjNYpW3uV/6YvpcsZ+MHlOVU8/0qDvCc+n3tC?=
 =?us-ascii?Q?Cdfc3pLJeqMQS8XPTS5oQNW8BUlZP/zkHWxWEEa0jS+nQPpdc640UkYypLE0?=
 =?us-ascii?Q?d2vuB9AhQygsb8edA7L6pXIzFCgIG7F75ZHab8a9eAvqq+ysWlmxJTyiI/ty?=
 =?us-ascii?Q?xvEdbhaZLympOLQqdaDnxBS+G5t4nzKbGDlyiioo3TioxAonF422mui3vYqR?=
 =?us-ascii?Q?wv4E9sFabTNsGoZkofmwvdUoXw0mKsmyTKJ059TOnXmr6Rt4/pb4Uink5h6h?=
 =?us-ascii?Q?Eix2es6w/mnyOWH3wcd+8YVdXk8y9j9Z4Sv7UsRY3QluEIq8ksrfYVdUUXXH?=
 =?us-ascii?Q?ALrx3Wue6YWtuzDQgr28/51LHULjN5W7pTSEeskIzdMCJnIWh1ixuPknZT5F?=
 =?us-ascii?Q?6Ik4xhS2NHCTIJuRasiY1hY4VwiRwl061avyJIiocKrKBTVl5ETGCdciWlJT?=
 =?us-ascii?Q?CJBtheCQuwJE+zfB+WA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8B/AhkxJUhz8fifqXv+f6VaQm3trp0v46SaszwGWBR2oY+8hKEBCZuMcI0qN?=
 =?us-ascii?Q?xR5n461PKThxwSW2yg1R4WthW7+s6etBNYH8DJNW42n8nHzCmpjR4zcCaLsY?=
 =?us-ascii?Q?/JbFswy4FwxGQXc5T+BRdV5OLT7LaH8AZVc4uk7nIDpxPjl91Wl5+H0MeIBj?=
 =?us-ascii?Q?aprRzMkEaUZMrBxJEdZFT0WTiKMNgqZdj8GzBk+L7pDTmB+mMHGIxiylKNZ1?=
 =?us-ascii?Q?caREQWK7E3iS213FHl//xBmBthV5Cp02TygLR4Iw1MHysZxUI9ueMYQLRMFL?=
 =?us-ascii?Q?viAYOM4He9fv2KhhUWMHYTTizfgZNCvcL+JgXDOqFtCx0Mb5rZKGpCyJQiI7?=
 =?us-ascii?Q?llBuJkdRk4sh2rae/gSVBZWbum1qUkHAZ6JVxRidtyj4J4ccs1L9XXauStTe?=
 =?us-ascii?Q?zhtvtH4QmUlrSrt/RJejfCXByubzTYvLQijg6Q1MG7w8SStVYP/WAz4RMIO5?=
 =?us-ascii?Q?a/7p5zhErXSXk/tcu9kXavZmG4OJ78gn58avc5Uuu1WoUZxz2NVz35KGa7G0?=
 =?us-ascii?Q?o7nhnCTTjbJ+tpe8LfMOfDql/Vy74gAxmEyjBeGtQ4vASbyDSYpwXb3M19yD?=
 =?us-ascii?Q?DFJC3FV0MWnS14zBKeBLcY3G5c5aM57L8GJas1Exfya19s3i8pmW+S7FRVHX?=
 =?us-ascii?Q?rbZdFTELPYc6+mJWSg6NqnPAjTwa0aaBTh0O2acxoiBmU3abbXst4FZLGtDK?=
 =?us-ascii?Q?2MeHf3jmlXxsm4mTftL6R/mNq2xlHaB+vM23LoeVD3aKqDEzxxjsoAnBtWTk?=
 =?us-ascii?Q?rUPmErzE9bA6bItcklmpf/I0MYja0y4BA+4uuQ/95K90KFAFToG04PjRbMhH?=
 =?us-ascii?Q?kLuT35IRgX+PRiI+eG6AtbPrndY937pm+lnhoWOpvGeZ/NESOjc+rsswRE6o?=
 =?us-ascii?Q?cZodb9sTz1qUPw+JV0aMGFDyJd+TM7LUc7/lGqj5fq5yq8zQXwKQgo1iC9z6?=
 =?us-ascii?Q?aBuVXd+gU4B3JmuH8+zOrRwGxs0X7FHr2bOL+NP23hoHstBrwJ8W/hmZQ4m6?=
 =?us-ascii?Q?1ntWcCn/XtVxcmcRmxuFi6LSTAoTtYaLL2Y9fMmoSV7L1Chb8w4kJ8WcoJ8h?=
 =?us-ascii?Q?J0G0aQ884OSc9vrKMaUuobymGFBikzF3qzjRVzOV4UruIQhc5gjBv25sHuTt?=
 =?us-ascii?Q?StIL+6r7qG2LT5Bj6z+DuWSDI13WMJxzn4sig2IEl5Rn9Dmj4AFZQ4/nd7zd?=
 =?us-ascii?Q?yFcmI0E0lr4yc9XExKV/Y1y40jeq5+9n1YRDNqzae18IOxnmT1Mq82xTqRpx?=
 =?us-ascii?Q?WkUel6LX2FAMM4P1WG2n7UCddEa2bQFt1pm6jRNpIfbJrPNdpVV4H1iRqexo?=
 =?us-ascii?Q?uL7mY7x9ehq9gXnx2tzz8DpXKZkQmLII72gl5diw6eeIgnd6uNxs013XFM4W?=
 =?us-ascii?Q?AynyTznDDXZzWS/DRFF4LtVt4ZMyeFkeK+jJFtxxv54p2jdIsv5T3HtiJ3Zh?=
 =?us-ascii?Q?LV0xyihG7dj8AJ2JHQT6xPtN+xjIRASlX9VCfAzm7++srkc3x2QQhn5XSMAb?=
 =?us-ascii?Q?vcC7tIGa55QgOi+uu8h6EyR00cZNi7ojvJk4e8nno0PLWDZiDkJlXN7Y4eTh?=
 =?us-ascii?Q?SHwIWeugListgc5F5HAAXD59RBfgvQ4HFmFpc//sXDiECWC5Fl3H2Mc/zzJJ?=
 =?us-ascii?Q?brYQYQIGhazrakFMo+7Ch9FHB4gl3aJmG6kExJpoB+Lv5XGM9kM2p9uME1mw?=
 =?us-ascii?Q?HuxRbLGeg8xTKaNcONfrQKl+VffMcg91p99bjCCAyBdT2Y44uFrnDJIRaeEn?=
 =?us-ascii?Q?N+1qbiZ0bQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ddcef4b-398c-465e-3b0f-08de5b9ee614
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 23:18:35.7111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7pl4OPBp0Pf7e+L1dJiNldUlM0Ec4jplCImMp+zsnbr1cCxOuRXJSQzjKmZMY0mjxIgmqERl5nu9YeN1f6/Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5734

Use checked_add() and checked_mul() when computing offsets from
firmware-provided values in new_fwsec().

Without checked arithmetic, corrupt firmware could cause integer overflow. The
danger is not just wrapping to a huge value, but potentially wrapping to a
small plausible offset that passes validation yet accesses entirely wrong data,
causing silent corruption or security issues.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fwsec.rs | 60 ++++++++++++++-----------
 1 file changed, 35 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index a8ec08a500ac..1a91bbbce3d5 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -46,10 +46,7 @@
         Signed,
         Unsigned, //
     },
-    num::{
-        FromSafeCast,
-        IntoSafeCast, //
-    },
+    num::FromSafeCast,
     vbios::Vbios,
 };
 
@@ -267,7 +264,12 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
         let ucode = bios.fwsec_image().ucode(&desc)?;
         let mut dma_object = DmaObject::from_data(dev, ucode)?;
 
-        let hdr_offset = usize::from_safe_cast(desc.imem_load_size() + desc.interface_offset());
+        // Compute hdr_offset = imem_load_size + interface_offset.
+        let hdr_offset = desc
+            .imem_load_size()
+            .checked_add(desc.interface_offset())
+            .map(usize::from_safe_cast)
+            .ok_or(EINVAL)?;
         // SAFETY: we have exclusive access to `dma_object`.
         let hdr: &FalconAppifHdrV1 = unsafe { transmute(&dma_object, hdr_offset) }?;
 
@@ -277,26 +279,28 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
 
         // Find the DMEM mapper section in the firmware.
         for i in 0..usize::from(hdr.entry_count) {
+            // Compute entry_offset = hdr_offset + header_size + i * entry_size.
+            let entry_offset = hdr_offset
+                .checked_add(usize::from(hdr.header_size))
+                .and_then(|o| o.checked_add(i.checked_mul(usize::from(hdr.entry_size))?))
+                .ok_or(EINVAL)?;
             // SAFETY: we have exclusive access to `dma_object`.
-            let app: &FalconAppifV1 = unsafe {
-                transmute(
-                    &dma_object,
-                    hdr_offset + usize::from(hdr.header_size) + i * usize::from(hdr.entry_size),
-                )
-            }?;
+            let app: &FalconAppifV1 = unsafe { transmute(&dma_object, entry_offset) }?;
 
             if app.id != NVFW_FALCON_APPIF_ID_DMEMMAPPER {
                 continue;
             }
             let dmem_base = app.dmem_base;
 
+            // Compute dmem_mapper_offset = imem_load_size + dmem_base.
+            let dmem_mapper_offset = desc
+                .imem_load_size()
+                .checked_add(dmem_base)
+                .map(usize::from_safe_cast)
+                .ok_or(EINVAL)?;
             // SAFETY: we have exclusive access to `dma_object`.
-            let dmem_mapper: &mut FalconAppifDmemmapperV3 = unsafe {
-                transmute_mut(
-                    &mut dma_object,
-                    (desc.imem_load_size() + dmem_base).into_safe_cast(),
-                )
-            }?;
+            let dmem_mapper: &mut FalconAppifDmemmapperV3 =
+                unsafe { transmute_mut(&mut dma_object, dmem_mapper_offset) }?;
 
             dmem_mapper.init_cmd = match cmd {
                 FwsecCommand::Frts { .. } => NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS,
@@ -304,13 +308,15 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
             };
             let cmd_in_buffer_offset = dmem_mapper.cmd_in_buffer_offset;
 
+            // Compute frts_cmd_offset = imem_load_size + cmd_in_buffer_offset.
+            let frts_cmd_offset = desc
+                .imem_load_size()
+                .checked_add(cmd_in_buffer_offset)
+                .map(usize::from_safe_cast)
+                .ok_or(EINVAL)?;
             // SAFETY: we have exclusive access to `dma_object`.
-            let frts_cmd: &mut FrtsCmd = unsafe {
-                transmute_mut(
-                    &mut dma_object,
-                    (desc.imem_load_size() + cmd_in_buffer_offset).into_safe_cast(),
-                )
-            }?;
+            let frts_cmd: &mut FrtsCmd =
+                unsafe { transmute_mut(&mut dma_object, frts_cmd_offset) }?;
 
             frts_cmd.read_vbios = ReadVbios {
                 ver: 1,
@@ -356,8 +362,12 @@ pub(crate) fn new(
         // Patch signature if needed.
         let desc = bios.fwsec_image().header()?;
         let ucode_signed = if desc.signature_count() != 0 {
-            let sig_base_img =
-                usize::from_safe_cast(desc.imem_load_size() + desc.pkc_data_offset());
+            // Compute sig_base_img = desc.imem_load_size + desc.pkc_data_offset.
+            let sig_base_img = desc
+                .imem_load_size()
+                .checked_add(desc.pkc_data_offset())
+                .map(usize::from_safe_cast)
+                .ok_or(EINVAL)?;
             let desc_sig_versions = u32::from(desc.signature_versions());
             let reg_fuse_version =
                 falcon.signature_reg_fuse_version(bar, desc.engine_id_mask(), desc.ucode_id())?;
-- 
2.34.1

