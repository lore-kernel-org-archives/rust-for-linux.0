Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010057.outbound.protection.outlook.com [52.101.61.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3583557F4;
	Sat, 31 Jan 2026 00:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769821017; cv=fail; b=H5Yr9Y2jC+PWA9ONHhyseRYYAwyhldnBJh8tyKDpvRsZZoafqJvKBIQD1A+vXu4rjnP7yYAqcXlxdXWrWAcbvPSjco1O0uzgL9QWlb5rgkuqlsVPDNEzfLFCgHWf82RAdQ1UUFkMNFr8G5oxLGgJ6xLybUnsCMLOUpUIz7ge1Mk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769821017; c=relaxed/simple;
	bh=ce7BzVFCeEbvLLxanRzUF0NYNR9HK/5wdP6JDtCOaXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fm3ubHqrzvtnMXLAU9z/9tLtfLgOAZ8Px7RVXwmAgFLZ0M+1FpTQLbYUC+kwjTWTQicypgn6LAxGag5EBwjbgS9WICQRDhfpGsZeragEJ9y/JTvKWTyEZmRmT7SrlR7z/0HiJGSvRf99BW2uy7pyJbuqonqRM0whcoeE372/i8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ci1mhJFb; arc=fail smtp.client-ip=52.101.61.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ci1mhJFb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kAGMiw59I2bCwRJTMMAxhTUpD/cDVYgIJMsO8/Oud5LPoh1VKRAyc6gD+m09yXJGADURhTsNju4U2umlHN3JwN6N8UJCl1EA7R6Oo5XUZCk5mEu19w0wTczfWD2REqzYSkj6tL2N796WSIEIY/0S9UDe8LLo+H6XMCIfTVy7SiZTWOuWVPZbp6eD4uAFXKTIdGasRkBmvThN3yKfQDVj5juA7DZRa1YkQznKAYdydz1BDEzkEadGI/OwPx7He3TAVDXfCyL4LWe/jTdX+GaqCodQ4zd62Z/PaUb6kUdUe+6AXQo6B9q1etzgsm0rSOb5G8m8dTcGLAPnwrwR737ZFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7Ntmds9TwQx2LjWjp1v8ZXnkdqRkjYK6OtnQd+0kuo=;
 b=bDSF1R4n35mzHkNNECSWzrvb+CM29VamEby1CQrGwxqXy9+T9lzhov0bP2ECRGVVQcy3zA1YG6JT6M5FHHvZAKCtgWqpe7AKmfxuNPr5L0lZFliKHb+HK8pRn+sN+4FC0Ro424v7f+CplUW4gl1Eh5BaJuhEyl4UDr51zTEvowaFytpR1EvmuOFvLdS9sVACms1f2EBD3T6l6DU0WjRJt/0KQeQsDMFUAiT+p/VN4Y1kY/Jq8weKulGKyCWWFbolNYEJQW4q6rNX+Vvx+sD6/AlW4LFo1CWPUITpZt9YYiV7pn4PaFl//IaZsjY+s5NDSoVpx5H8P+fVruL1CtPHvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7Ntmds9TwQx2LjWjp1v8ZXnkdqRkjYK6OtnQd+0kuo=;
 b=Ci1mhJFbGub+F4nH2YV1ZIgSEaCOZT+aWcU6WAFA/9JbChl2WJ9c/C5yHc5jxvfcE+WGmGBKZzle5ZKWoq0d/QjpR4aEvNIbI393AJdDfDiaK1FyhVcDu9GjJCDSjPL01KkjI20nrkKhOQYsCJlNHUJUDValZhpzpEiuJe/c/fIzbt+km9UVmSPVl3VtPphP0qhrKfzK0WZdJE8oHli1cm6yjpGKvv4asjPRk8CjkxHQJ4rjEanK7b/D288Sg0qp3+hF/Ls9Kz8V3JmbnOM31gT2UOSi3Y4K+n9ykwzhKJSb8EvvxVpH/fkwQjW3kuu+3Dso7borMIjuishpDzqtxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:50 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:50 +0000
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
Subject: [PATCH v2 28/30] gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot path
Date: Fri, 30 Jan 2026 16:56:02 -0800
Message-ID: <20260131005604.454172-29-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0201.namprd05.prod.outlook.com
 (2603:10b6:a03:330::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 79f28a00-7502-462e-4ce6-08de60639e15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KC0ijbdT5C8d3zDL9MTL58FJ+LWpA+VZTpeOsxKbrFdXEBVrQAT45zjjJtGX?=
 =?us-ascii?Q?PfijVaDkn28dhGXuxSfKWZtb822NgAwGdSXyxGdywb3SYx8eFvO3o459VGGz?=
 =?us-ascii?Q?E5oIdrC7AzgSbl6IqtbKd02U/K854vc6cAQ7DZSbkxnoyjrnAJpLTagbxngT?=
 =?us-ascii?Q?2q7U9nw2mn9ociftubcEwtcDFojoeYOaXWJxxCOCTx2AVIOv7Zm3fIZomVZr?=
 =?us-ascii?Q?Qf3VxgcQ5ocic6Lu59AlOMOWp/1GEZsGTz9KVj92qIcVhaHouPSo44CSZ2VZ?=
 =?us-ascii?Q?LSQ2tInrI7WKVeTWTgcFGqIk3MWbdLMGvTwfm1R73svl45H7Bs7gY5JHmRMG?=
 =?us-ascii?Q?+eGMyPHqss4sv0/sS0Ks+c60DyQMXBG+EfEyBCb8UI5OPwcQ7inHfrkGwUGM?=
 =?us-ascii?Q?C5oMTigtlfxRsixyOlgLiTJWww4g/i3uZqbJ6Cq+VN7GNZv6Hs6kwfslnhKX?=
 =?us-ascii?Q?gLcFkigJrnQcBWrSW7N2sWFlRoDlf00C/AKEepbK9jOiH+QDirC+kyJU/mpo?=
 =?us-ascii?Q?jKVHWn4w5dqAi8QmRyF6VSGOwZ5I/MASugqUm0crVrJ+YhauTfZZ/gLZ04VZ?=
 =?us-ascii?Q?p1VVbEds+6gNQaTuBUufkBbWFmFdnnyyy0pdRNiO8hExAIJCUg0s4xKzNxzy?=
 =?us-ascii?Q?s9LIMQxgebuBwfBM7EXMFOhclaNEVPlZGO/8Qznn0HSDOySLmk/rHfMj0Xtb?=
 =?us-ascii?Q?8fJ1k9JadeWJQhTzG6HCH9qdertgVuua7jmcmHXm5t/+ZD9M1Y/Nl4+uUtEP?=
 =?us-ascii?Q?/ujqysEU1kVoHQ30Jmnwevn+46LYanfvd2TySVc09FKBC4Cd6yeTXnbBvWl+?=
 =?us-ascii?Q?Id4nIrbdkZeF23JWKIKvF3nUD0QNb4ZvTRdF0YCvGkTAn/COBe7IBau0Jcks?=
 =?us-ascii?Q?qAMbi2gFcuwoh3euuyFNN6xf4/th/P4RfDj1gmKpwj59voBJFEIUs21dxPWw?=
 =?us-ascii?Q?ryYk8lIaXTsjb9FEKHD8Pb7U56FPOWQfVYPex2dn9P9chrpMRfSlff43C+GT?=
 =?us-ascii?Q?ehPsI//Usrklj2s1tAYa0VepcNW0fszs/hf1LFAbhbnbhhDIDxR2pX/pUETG?=
 =?us-ascii?Q?kQfuharpD0jNfZSOfLPr8EGq90YVjYhZ9GE7CvGSRAVqVeLDq6HRfEdIu9bT?=
 =?us-ascii?Q?n9w4Tt9vWkCwPuQmYqa0JPbjytTlh0yQKWAmT/2lUv10lqAvNDftvfIj78SC?=
 =?us-ascii?Q?YZ+1rnbtjTq1UzOIS+37e7dJyCUmF/ClwCPGIY+/gWUxz2KOHCCPZJAYLLXy?=
 =?us-ascii?Q?ktWmeQHG44j3sP+39ZHPhBbX2Yh3EqiVHUfa29F1k9uitWY6skX2fE7rjrsO?=
 =?us-ascii?Q?WxtPaW2TN2864/tTE2MW/+UtXlagCkdM9zAj35RXDlcbuagbH+/l5ZZ7CPdM?=
 =?us-ascii?Q?uikzFEQJt3xbD4b4Nim/3Q677H/r8C+l6ZNhVJgEzIQS7v3tXr9Mw4NjZVZN?=
 =?us-ascii?Q?iz3G0jINgYyHikJEoPHKb6f3p4+KRxdmUuKptjAiUtykjLWYxTw4YC6gXgfF?=
 =?us-ascii?Q?JbBCasONH/V+AAcOcccihx06gNkwdTQP7pjqhzm5Dxenhw7lbYAGGn2rPOWb?=
 =?us-ascii?Q?tyfi3Y/FW0BHqh3c2HE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y60iJFXWWe2S7TxCVa5YyIt5/O03kFzCJf/tjJZ4rLe4YTBkZVoZMpRtGKYN?=
 =?us-ascii?Q?orHocM9ZtxOkw8kYXLFnpqfMNWNcmCKqKZuFev4hRflD2PW5MNH5QZPbA50E?=
 =?us-ascii?Q?ZwERjgL1yi4GXPNZT1co3MVnvg+rd+oFQmVvLP7F1q4xOiCS1lw4COAinblv?=
 =?us-ascii?Q?gjFJ9SlpzuxtfkwVxgEgfQ+SWpTMzTr1+sm8iZzdhoTLF4bTYbcbi6XHZViR?=
 =?us-ascii?Q?AtgCEaeJm4O6NrkrTwm+Ec4e+HbNa8gC+xD+UHBmCz0E3DKlmWxz1mKJiHtF?=
 =?us-ascii?Q?H9afvQzFCNQ9p+UTw38iyvCPDdebnStx/XGmPWhx/hrqFzBu+x3pdij13ks+?=
 =?us-ascii?Q?q9OUHFRYsfcRIdG9LdaPhlmlOvFN93uMNp50CAMwkEnAcQg/Fb0fNZIXKN5T?=
 =?us-ascii?Q?8W5T3iy8X4byZEGcjFa8ljg45+O5GKvMM9U9WJtqmjveBb/v+/X+GwD+YhVD?=
 =?us-ascii?Q?SSvE61dt7QVY8WKIy+ZxPa6opkXCOjd8R9l14qIiV8kTkF3gNwCi30ZbOSFl?=
 =?us-ascii?Q?HHOwRaoQATXmlY5SdTAV5EaZKoYxDT86DrRo3NUs8+wBnRxDaGDzUOYPL2NK?=
 =?us-ascii?Q?Eu7vAyTggd0ju2A9baCQcZTwK8alum0Sm52wL8ASfht+wyJicLjO8DZdTP/t?=
 =?us-ascii?Q?AtgfnZjUSW1izvwlMxzK14fM1JDuTrrDVqMLwnpMxgmSfR18ItJJ5NkuW6cj?=
 =?us-ascii?Q?HOEEaB4JOtRs/n2wXQmP5Pk3AdFmLmsg3W17Vg8r6QcD5GFkNRtF9ZjA+BmX?=
 =?us-ascii?Q?h/46+rfeurkMyChIYLZzDLA26IgajpRuEjPWdhe3Y0WgKuVbBPVhyzFJnI0+?=
 =?us-ascii?Q?5Z9qugK+aM8oNzsBA1Ci00C7r4PGbfin6Dc1MWbkvaHCOmTFZWt9jqqUFO3p?=
 =?us-ascii?Q?WRQrEo78RJM6wWKZYdH/95tHswf0C0/9ogQFIxcChDdHLG7TgNSbFyUKTyOV?=
 =?us-ascii?Q?3V0jMCHqVgT3GylBYd7rs9vnAtBeko8Pz2FazGyuPxjUCIMCuMHe2ieJoRdS?=
 =?us-ascii?Q?VEyDVpBFoNp3hBaysTVh9eeFbsJzzllqf8f9NopvQYqeGeR61/b2A9EMFtYm?=
 =?us-ascii?Q?KMe271WlnhVifPBfoRn5lQYh8K8d/zWQrBe95NNtbYfmTDPCpjFroX/X3fyB?=
 =?us-ascii?Q?WjyzRlQcLhOsYtyrKI2u8pb79Fe3F/z91iWM3EQObTOBbaVq50PEGTTwVJFr?=
 =?us-ascii?Q?eEHXNOJ+v2hxjnqqVQFL5NIhp/A9sfk4Ajb2gLu6POmXweR7bh9bDX0Y74JB?=
 =?us-ascii?Q?hwmeiBA0qKmFlPgGs83tEDxcdLLF9RUe73j/cH6k1V+9v1FfxmnlEMMn1X0B?=
 =?us-ascii?Q?KuKB8Qe8nNsP/d34L1vdu6cXTt1phEzNt2c0XBbdSbehoTOaKTMmslD74Msx?=
 =?us-ascii?Q?kuODDm8UxE7KGgqdUs9ebfULvnhDqkQFGmw8OfSPasuTTe4qZZM9DFiymNec?=
 =?us-ascii?Q?LE4e6i6NkNYa36bJaHk+L6EW6JnSmAoZ8wTsl/dmjdmhQ8Bdre6+ucCUh5uX?=
 =?us-ascii?Q?+WN0a8eG1+VvoSnwyf2WdWGGSKIjGN4Pfu68+sImrk8aaOLQNORVc4y6MYoI?=
 =?us-ascii?Q?YYN0ARgnNGAbHlSaCslDJtVjPai1CsnGkhxYs2O9yxKP5P0wM6WwL6hz0FzY?=
 =?us-ascii?Q?tD/bzYk34/FjTCr8n8ANME3HYQb//nmzZUYfGfSf0G5Qlrt0tFNxh0Ihcx9A?=
 =?us-ascii?Q?saKhE58rUIp68qvs6/KszI9APOphTzlYJgetZjEsoyrc9/tADDIOadfsaFLL?=
 =?us-ascii?Q?fxszl1ooRA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f28a00-7502-462e-4ce6-08de60639e15
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:50.7834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fy3HmAGCzu71c4+0jG+Nlf1thrgW9zkF6oof0VPig9MQOevfaaa0j/JRTKHxLWWY0orv4Op5Ivmt/SeNulLQDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945

Add the FSP-based boot path for Hopper and Blackwell GPUs. Unlike
Turing/Ampere/Ada which use SEC2 to load the booter firmware, Hopper
and Blackwell use FSP (Firmware System Processor) with FMC firmware
to establish a Chain of Trust and boot GSP directly.

The boot() function now dispatches to either run_booter() (SEC2 path)
or run_fsp() (FSP path) based on the GPU architecture. The cmdq
commands are moved to after GSP boot, and the GSP sequencer is only
run for SEC2-based architectures.

Cc: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs           |   1 -
 drivers/gpu/nova-core/firmware/fsp.rs |   2 -
 drivers/gpu/nova-core/fsp.rs          |   6 +-
 drivers/gpu/nova-core/gsp/boot.rs     | 158 ++++++++++++++++++++------
 4 files changed, 123 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 7c502f15622c..a860f43ec5af 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -180,7 +180,6 @@ pub(crate) struct FbLayout {
     pub(crate) heap: FbRange,
     pub(crate) vf_partition_count: u8,
     /// Total reserved size (heap + PMU reserved), aligned to 2MB.
-    #[expect(unused)]
     pub(crate) total_reserved_size: u32,
 }
 
diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
index edcc173c2fa6..e10954aa146a 100644
--- a/drivers/gpu/nova-core/firmware/fsp.rs
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -14,7 +14,6 @@
     gpu::Chipset, //
 };
 
-#[expect(dead_code)]
 pub(crate) struct FspFirmware {
     /// FMC firmware image data (only the .image section) - submitted to hardware
     pub(crate) fmc_image: DmaObject,
@@ -23,7 +22,6 @@ pub(crate) struct FspFirmware {
 }
 
 impl FspFirmware {
-    #[expect(dead_code)]
     pub(crate) fn new(
         dev: &device::Device<device::Bound>,
         chipset: Chipset,
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 6a0bc800abb0..c97d298fd6c8 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -1,8 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 
-// TODO: remove this once the code is fully functional
-#![expect(dead_code)]
-
 //! FSP (Firmware System Processor) interface for Hopper/Blackwell GPUs.
 //!
 //! Hopper/Blackwell use a simplified firmware boot sequence: FMC --> FSP --> GSP.
@@ -11,6 +8,7 @@
 
 use kernel::{
     device,
+    dma::CoherentAllocation,
     io::poll::read_poll_timeout,
     prelude::*,
     ptr::{
@@ -355,8 +353,6 @@ pub(crate) fn create_fmc_boot_params(
         wpr_meta_size: u32,
         libos_addr: u64,
     ) -> Result<kernel::dma::CoherentAllocation<GspFmcBootParams>> {
-        use kernel::dma::CoherentAllocation;
-
         const GSP_DMA_TARGET_COHERENT_SYSTEM: u32 = 1;
         const GSP_DMA_TARGET_NONCOHERENT_SYSTEM: u32 = 2;
 
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 178e319d48e1..5284a35dcc2c 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -13,6 +13,7 @@
 use crate::{
     driver::Bar0,
     falcon::{
+        fsp::Fsp as FspEngine,
         gsp::Gsp,
         sec2::Sec2,
         Falcon,
@@ -24,6 +25,7 @@
             BooterFirmware,
             BooterKind, //
         },
+        fsp::FspFirmware,
         fwsec::{
             FwsecCommand,
             FwsecFirmware, //
@@ -31,9 +33,14 @@
         gsp::GspFirmware,
         FIRMWARE_VERSION, //
     },
-    gpu::Chipset,
+    fsp::Fsp,
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
     gsp::{
         commands,
+        fw::LibosMemoryRegionInitArgument,
         sequencer::{
             GspSequencer,
             GspSequencerParams, //
@@ -155,6 +162,55 @@ fn run_booter(
         Ok(())
     }
 
+    fn run_fsp(
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        chipset: Chipset,
+        gsp_falcon: &Falcon<Gsp>,
+        wpr_meta: &CoherentAllocation<GspFwWprMeta>,
+        libos: &CoherentAllocation<LibosMemoryRegionInitArgument>,
+        fb_layout: &FbLayout,
+    ) -> Result {
+        let fsp_falcon = Falcon::<FspEngine>::new(dev, chipset)?;
+
+        Fsp::wait_secure_boot(dev, bar, chipset.arch())?;
+
+        let fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
+
+        // fmc_full is a KVec<u8> for CPU-side signature extraction only.
+        // A separate buffer, fsp_fw.fmc_image, is what gets submitted to the hardware.
+        let signatures = Fsp::extract_fmc_signatures_static(dev, &fsp_fw.fmc_full)?;
+
+        // Create FMC boot parameters
+        let fmc_boot_params = Fsp::create_fmc_boot_params(
+            dev,
+            wpr_meta.dma_handle(),
+            core::mem::size_of::<GspFwWprMeta>() as u32,
+            libos.dma_handle(),
+        )?;
+
+        // Execute FSP Chain of Trust
+        // NOTE: FSP Chain of Trust handles GSP boot internally - we do NOT reset or boot GSP
+        Fsp::boot_gsp_fmc_with_signatures(
+            dev,
+            bar,
+            chipset,
+            &fsp_fw.fmc_image,
+            &fmc_boot_params,
+            u64::from(fb_layout.total_reserved_size),
+            false, // not resuming
+            &fsp_falcon,
+            &signatures,
+        )?;
+
+        // Wait for GSP lockdown to be released
+        let fmc_boot_params_addr = fmc_boot_params.dma_handle();
+        let _mbox0 =
+            Self::wait_for_gsp_lockdown_release(dev, bar, gsp_falcon, fmc_boot_params_addr)?;
+
+        Ok(())
+    }
+
     /// Check if GSP lockdown has been released after FSP Chain of Trust
     fn gsp_lockdown_released(
         dev: &device::Device,
@@ -196,7 +252,6 @@ fn gsp_lockdown_released(
     }
 
     /// Wait for GSP lockdown to be released after FSP Chain of Trust
-    #[expect(dead_code)]
     fn wait_for_gsp_lockdown_release(
         dev: &device::Device,
         bar: &Bar0,
@@ -257,43 +312,63 @@ pub(crate) fn boot(
     ) -> Result {
         let dev = pdev.as_ref();
 
-        let bios = Vbios::new(dev, bar)?;
-
         let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset, FIRMWARE_VERSION), GFP_KERNEL)?;
 
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
-        Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
+        if matches!(
+            chipset.arch(),
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada
+        ) {
+            let bios = Vbios::new(dev, bar)?;
+            Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
+        }
 
         let wpr_meta =
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
-        self.cmdq
-            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
-        self.cmdq.send_command(bar, commands::SetRegistry::new())?;
+        // For SEC2-based architectures, reset GSP and boot it before SEC2
+        if matches!(
+            chipset.arch(),
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada
+        ) {
+            gsp_falcon.reset(bar)?;
+            let libos_handle = self.libos.dma_handle();
+            let (mbox0, mbox1) = gsp_falcon.boot(
+                bar,
+                Some(libos_handle as u32),
+                Some((libos_handle >> 32) as u32),
+            )?;
+            dev_dbg!(
+                pdev.as_ref(),
+                "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
+                mbox0,
+                mbox1
+            );
 
-        gsp_falcon.reset(bar)?;
-        let libos_handle = self.libos.dma_handle();
-        let (mbox0, mbox1) = gsp_falcon.boot(
-            bar,
-            Some(libos_handle as u32),
-            Some((libos_handle >> 32) as u32),
-        )?;
-        dev_dbg!(
-            pdev.as_ref(),
-            "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
-            mbox0,
-            mbox1
-        );
+            dev_dbg!(
+                pdev.as_ref(),
+                "Using SEC2 to load and run the booter_load firmware...\n"
+            );
+        }
 
-        dev_dbg!(
-            pdev.as_ref(),
-            "Using SEC2 to load and run the booter_load firmware...\n"
-        );
+        match chipset.arch() {
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada => {
+                Self::run_booter(dev, bar, chipset, sec2_falcon, &wpr_meta)?
+            }
 
-        Self::run_booter(dev, bar, chipset, sec2_falcon, &wpr_meta)?;
+            Architecture::Hopper | Architecture::Blackwell => Self::run_fsp(
+                dev,
+                bar,
+                chipset,
+                gsp_falcon,
+                &wpr_meta,
+                &self.libos,
+                &fb_layout,
+            )?,
+        }
 
         gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
 
@@ -311,16 +386,27 @@ pub(crate) fn boot(
             gsp_falcon.is_riscv_active(bar),
         );
 
-        // Create and run the GSP sequencer.
-        let seq_params = GspSequencerParams {
-            bootloader_app_version: gsp_fw.bootloader.app_version,
-            libos_dma_handle: libos_handle,
-            gsp_falcon,
-            sec2_falcon,
-            dev: pdev.as_ref().into(),
-            bar,
-        };
-        GspSequencer::run(&mut self.cmdq, seq_params)?;
+        // Now that GSP is active, send system info and registry
+        self.cmdq
+            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
+        self.cmdq.send_command(bar, commands::SetRegistry::new())?;
+
+        if matches!(
+            chipset.arch(),
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada
+        ) {
+            let libos_handle = self.libos.dma_handle();
+            // Create and run the GSP sequencer.
+            let seq_params = GspSequencerParams {
+                bootloader_app_version: gsp_fw.bootloader.app_version,
+                libos_dma_handle: libos_handle,
+                gsp_falcon,
+                sec2_falcon,
+                dev: pdev.as_ref().into(),
+                bar,
+            };
+            GspSequencer::run(&mut self.cmdq, seq_params)?;
+        }
 
         // Wait until GSP is fully initialized.
         commands::wait_gsp_init_done(&mut self.cmdq)?;
-- 
2.52.0

