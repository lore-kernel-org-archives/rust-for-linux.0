Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012069.outbound.protection.outlook.com [40.107.209.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BC837FF4F;
	Tue, 24 Feb 2026 14:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771942937; cv=fail; b=DCiofVYKNpWd81qXgJm2xCBlfvtX4mUUUg7J2I7CqCGD7KUjfbRfYJf3OAppuoel4vQl/eCzN5EDPjgJ5KBqemm54hRqWuyFAfM8pQtfGDF87h5hY/N8zP4mZ1qEXJnb5h8pV0iZtVpn6hoJLgPaz8gdPXHIk8r13URC/V32Ehk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771942937; c=relaxed/simple;
	bh=0FP89CQyif/oPbzDEF0KNnDxci3xeSqE0b59wHIER0w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uXc8flx5C8jY91uDs8GhHqgtA9ECoPtlg9TOPrZNeHufNYy90Uw8POeWSKEaxlX8n4grlYC9aOzqW7AWUqaDEjQ62eKQeTXYjxGNtulP5aosFqXCXkYX2TFC3vjyptCQZ19Y96/ZUh+Dos2V/ZduvLaPZbIDEUey7PFRP19JoRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gPOdubpS; arc=fail smtp.client-ip=40.107.209.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gPOdubpS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ey+YyENiaPF/r/CUUaWfrFDtNmrby3CHViGZDhzL4x6al6Zt1OESg5Grn0HuAXHKTQUPz/r6EuwZpzar3fBdJwmsvjGSV0/Ub6NzDtohHidZvpAoLQvjgTP9lizjLwKwVFKJZxBvF8r4eXev7TxX5s4JcIdIkj8oAx/4F6BWrr2P91e8U63nVmj7z8qd9dr9qPeAgKfyNZ+7433JIxOIXYNkRx04pk2FYJ90EniF4XIat5Y/Y9BnhtdZV083C75Lm72pUP0AiGbV36SAWFqDzKghRLfmx7KkY3CyHMw7bEm6fpe7ASHfO4e2VY+4QA44UNX6KY4IgZXxruyzPGI3zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ae4UeDgfUfzoEEPMB/DfNXHA5UjZCs21uT8+xeI1MT8=;
 b=WcolQdg7cWKu4imQtnor2+v2rnB102zB+e24Cv4KI1yDtCyPAlsLKyL9ONDxfxtl7q9O2KLWMZlMYXBvEcxUI9DUQFXiwOrD3Ee9Iqc/AAxUGOxdo828pPNsEQTnXyzsDpeUt/wfX7Vn80q7+XfLWruEznqfe3jWaxz7BUwt0UYPWPKS3XLQ0nplXaEQtPsFs30FEM6ghKzOveEIq+mGIqIE0aSZy5dPdcUj9tKftCYyes6IxbpKGM1j8gom263wSPRDYwFidxnb9dNz/OwxlwI72D2aQH+BGJ4qDcs/szBrFrJ3pIoqITMsy16O3FlR9JCdOpC6rbnAbSU1Qiv35Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ae4UeDgfUfzoEEPMB/DfNXHA5UjZCs21uT8+xeI1MT8=;
 b=gPOdubpShtX0BvX68mQCLv2U8d7cDHWYYuv/9qedDfYXqfYem/FUSy1oifXF1GWIKJT34ygJ90GSpwXCR/0lBaWE6Dqf0BQhGyrcF5bzJTAZdtBFhvEGak+gd5obpO9hEkvddph8X+6VyeNJzU8g/Yh18dL3owuFHVvtIkNTxAFIV9tDCWJBIkCgX8qIQqLP7O/2ty+rd2eFAWW66SaBqhD0cg444WqyDtSMD+TvTa9Pq4VKqnYJkUsra8i/1jdHpM5FKIYYgi4rH7CsLtMSUUQmJHG4JGrS7Hv9zL/KiLbjaEWR5CeWNKgAii3H6vk+Znm7RDo23dDy1bocQrOgFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7811.namprd12.prod.outlook.com (2603:10b6:806:34f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 14:22:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 14:22:11 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 24 Feb 2026 23:21:39 +0900
Subject: [PATCH v7 01/10] rust: enable the `generic_arg_infer` feature
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-register-v7-1-aad44f760f33@nvidia.com>
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
In-Reply-To: <20260224-register-v7-0-aad44f760f33@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0341.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c12e2d2-fcb5-4d0f-9b0f-08de73b019a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djFrMC9GbDlvME5PUXVVVG9NVll4MHlXYjlVc1p4ODJNRFMyb1ZYQU1kSWZE?=
 =?utf-8?B?OFlRSi9BNFNyUUxmc09NSDFXSUZ4dkduNlVhQUJYdjZqdEx2ZWxLTHhtRzZT?=
 =?utf-8?B?blVuNE1OeUlpUGVzaTl3dzZDNStoTTRZR21mY1creFZoMlh5NlVPRmQzS05a?=
 =?utf-8?B?d3hKYzZhc1I2ZDFnUnB0T2tUNVUwU0ZoZlZqY29ucnB1WFJWS2F0OVFoV0ww?=
 =?utf-8?B?ajJjeHVta3RYODBjQnk5TVQyL2JxVWV1TWoxQU5pUDRHc2pxS3k0SGFkRVBX?=
 =?utf-8?B?d1Q4TjNCcklNK3BzZkR2ejF5ZVVuRG9jWmJBaUNVMlg0WnY0MW9TUEUvRG5m?=
 =?utf-8?B?VFByQk4vcjNYZkhIVTFMdDM5ZWJOS3NaVGRWUlFuRWVDVE05TUw5MHBPQ3M3?=
 =?utf-8?B?U2cybjFJMkRwVVFrdmtQeGpLam11WGw5VDQ2ZkhMTXlubzlpYzYrL3VPMnFX?=
 =?utf-8?B?c2w1RUp3QXlzM3RveWN0MG05cGxLWWl2WkZNN3hYcENzUGxFVU80NGc5eCtQ?=
 =?utf-8?B?RTA1TWFRVmxrdlluS0RvamEvbzlwd2pjTkNycEYvZlZxdnFPN1FINTVoMUNj?=
 =?utf-8?B?Vk9FRlUwUnJSYjkzYWp1ZUkwTHVmQTRQOWp5bkEzTHdid1ZvdEpQMnY1VGZX?=
 =?utf-8?B?dmN6cHc1NTlmS1J6M2RteUpMT3kxc05TMzViWDVPSFNONEl0T2hqZHdVUFRS?=
 =?utf-8?B?ZVhDcmVvTkdEWU1zS3RqZDhEV0lkVCtFcWw3NngrcFFQMldBckVkOExqa1Zj?=
 =?utf-8?B?ZjV5TzVLV2NZL0xzRG5vbzl3bXdVYzEzRTNGUGNQd29za1J5Z0hVTW11ajIz?=
 =?utf-8?B?dTNtTWdqZ3AvcWo3eEQyNmRNQ0ZpbTFiYXRaRXlDNHVoaGttZk1OQUt2a1du?=
 =?utf-8?B?VHpPSmQ1VExUZlg4NnRBKytCbnVlTmJyZG45QTFtdFlaTnBmUk05NE8rYXVU?=
 =?utf-8?B?ejRxUklWcG5ZcHJXZjB3RHNiTUJNcy9VUm9GMGxlcXBwRmtaY3RhUVh1SWZZ?=
 =?utf-8?B?YXY0TmVHbkRjS0pjUGx1UzJYQy9qSFZnQ0pZRW5vSjZlQ3AxZTkydGFONmg0?=
 =?utf-8?B?OU9CTjNDL0p5ZCsyb3FpTERRcTdDRnpxZzc0Q0U3aG9hQkpqMW5BRVA2SjBk?=
 =?utf-8?B?TEVlM0s2d3dRbWJGZTNER0tLbFFDcWI4T2FyRkF1aWRPZU05cFl2aFhESkhX?=
 =?utf-8?B?MDQ4dmpLYklNM2hnTlErUUZFRmowWUlTRG5XbmdzYXpRM1V4MUZQWklYL0Nu?=
 =?utf-8?B?cjlSRWs5YVlCb0RHWU5oMy9qZWlaQzBGcUlFRTZtbUxXVkNLWkRIRG1aWHJy?=
 =?utf-8?B?aGtFVHc1VHFQRTBaN1ZJZTYxY3N2VTg0SUticlYvQVpVTk1CQTJlK0czLytQ?=
 =?utf-8?B?MFNxOXk0Y2YvM3E5VU85c0tFdTdPUzJYRDFCaGYydGlVeUlBeVpqajF3anBQ?=
 =?utf-8?B?NmJOYUFleWZKMzdWeDlnOXVLbEowTnJiSGNoWE8zZCtrWHA4TEJEL1ZOTFJs?=
 =?utf-8?B?RjZiZUdKUG1PQ0hFdlVHek9TQ0syYWN5aEVCSzJ3cnBITlpXYUFaSWZVNWZK?=
 =?utf-8?B?RC9xWm9HWDNoTWxVSEtFVkdBaDY3K2hRb2kyVjFDbWE1UVF0bVVpdHhvRDBk?=
 =?utf-8?B?L0tGZldWWjZ3OFJtWnJRU01RVms4UlhBbTBGMlRZem5qSnc2NWNYL1NzNlkz?=
 =?utf-8?B?VDdCS2ptTUE3cWUwZ29KcldhM1BTVmE3dHBHamRlQ0lLYWg1aXpsUHFGdzNo?=
 =?utf-8?B?bU8ySUo3NUpKRTFTK08yOTlYN3JmbTYzOFdqNHpRVEtUT0hMeC9mdk92enJj?=
 =?utf-8?B?c3VoYzRqUVBleFI3aFB3cVc4RThTeDkzRHlZN3kxWGxMQU1SV05EeHN0eTdr?=
 =?utf-8?B?WmVBbUFJZVp5NVR4czYySW9wdUJialVSM1pleFVCM3ZxYTRwNjFxcXlvWUw2?=
 =?utf-8?B?cTNkOTkyWUhCTWcweFF6Q3lNTUtMOG9QWE5aTDBzY3had2JrRGxhM3JuM3R6?=
 =?utf-8?B?Qm1PRjRQS29CREMycXJFaXhLMGF1SVNZazZsSktMSGVQTjE1eVdMOHNaRlhN?=
 =?utf-8?B?dE1iK1R4ZmxnS1FuM09YeFpGaEFpTVFOMU51T2QyR2YzdytwUmowVUVwUFpU?=
 =?utf-8?B?aDhsQmNIUVNtTlVUbm5HU1lIbFpJM01VdkRyVHFoajhVNHRYTEVsNTl3R3dk?=
 =?utf-8?B?L1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWdaRk1HczlOTEdwVGtQYUEwQ1NLajBWdXZVNDlDU2VMT0RUUWtkbGJScXZa?=
 =?utf-8?B?bGpSbUVpOWoramx3YXpreUx5Qjg4WktiRlUzZjlrRUptM0JiKzlxZVpwc05n?=
 =?utf-8?B?YzFsSDA0a3E5V09SZnZ0U0NMTnpYcnhjU2w5T2JhUkpybTF0ajBDaThOK0x3?=
 =?utf-8?B?TW9lek0xNHgxZTF0RXl0QjdQNFEzUjFnaHhIbkJZS0NzL2RQbTFZTnhpWFVZ?=
 =?utf-8?B?Q0oxNlZyOE5OQ29DOENTTFVSOElSY2pMd3lqMmhRUDB4MWhmTEdEbDNHTlFq?=
 =?utf-8?B?SlVsTEQwZVUvaXJIdmlNQStrb3EraVUzZHNmS2VERGR6c3drQXJnS2xSWGZs?=
 =?utf-8?B?cGdzZU4wOXNOblprOUVwcGhWek1CTmFsUzkrWmU5YlVHc09JNnhMRG03QVlR?=
 =?utf-8?B?SXg5M0FrV0ttcU5PN1A1ZkpIMnMxNEpjUDRsK2ZCczZmN1hWRVMxTVoyRFRO?=
 =?utf-8?B?V2o4OTNpZ0dMYVNwT1pkQjNHMDRidmRlTExnOTI3NkF6TFJKRC9sSmUyMjdx?=
 =?utf-8?B?cXlVV2p3TW1TVUtwTEpFT1pENm41VFJtalh2SGIxYk9zN2xhSUlpRzNtaG40?=
 =?utf-8?B?dldDYnQ0NUw5UGphRGZiUGY3QUpKSG1VZVRWZnpiRkFRTDhoandhV1RERTZi?=
 =?utf-8?B?cWJqUDB1WkhTRG16ZEpZSW5WQnUyd3h5K2RGK0tOVnlWMmJQSHBMd3VhNFZv?=
 =?utf-8?B?cEVBWHV2Q2JPWmhEaEZ6aWwwR2tvb3dLZFYzUjVMcDdHRDEyN2p5YndweGla?=
 =?utf-8?B?NDlHS2tCN0QxVGk4WXJFVlBLSUJMMUhCbDNzdjIxRW9FWmdHbkRkSXBhazNh?=
 =?utf-8?B?WTZoeEV0MDMzNDZ4UHJUcHlhNzc0RWhZcnE2VCs5NXdBVzl0U0FiSkxzZlVi?=
 =?utf-8?B?TmN1dFZFdG90ekxGNmxvUzU0anFyQUk4RFN0UTJwSm9uRHBPNjNSK0kwV2hF?=
 =?utf-8?B?bWh1UEM1UWlweng3VVA4OEg4Q0Q4OEtOdnlxUjVUb1dWcmZxY2xOdmpwaG1M?=
 =?utf-8?B?UTNUa3h6aWVHNXhUOEVJK1hoL093dDNkN3pkUFcwR2FYL3BxWUNkVEdWL2g3?=
 =?utf-8?B?SHB2aW9pN0VXYWhWbGJIMlJzckMrY1NPOGIvcFlOWUhJb0NGTi9RZjdsNVNZ?=
 =?utf-8?B?UFllc2x2V2lYM1BIN2taZ2VjYWs2ZTFsSFNJeHZjdGFKZFh2YkZMY3VHYXJR?=
 =?utf-8?B?Y0puTy9rZnR0ejJ5WHdMMVJ6d1VzRGhNUHBFVlhZOXBVc0RkZUZlOWFTNFQ5?=
 =?utf-8?B?NnlldzB1bkJPSHdxK1NWcCtLV2JmMGpnZFRVU2ZNQ3kwbDZvYWdWVDlCdjJG?=
 =?utf-8?B?K2FWNnloOE1rdnJ3OW0zcHFzT01iYkZtSmZKTnNpRUI3ckFDLy9NajNVdTEx?=
 =?utf-8?B?SiswOTVFNWlFMGNqRXFqMUZrZ2w4YjBTV3MrVnROQXVGMnNXY3owZ21qcVhS?=
 =?utf-8?B?K1duS0ZaRU00NnNSQWRxUlhNYzMrUEFwZTUrOERLQmFxTTBPaTFGNjB3dVJ6?=
 =?utf-8?B?OWR5NG82TGVqbUd6REUwV01NSU9vYkIwQTQ0NFhxcWFGSmowcHZIQjE0eXdu?=
 =?utf-8?B?bmlab21sWWRQV09SVC9BTEROZnF3cDNNNU1TNFM4a1h6ZStSVnJ2ZzVPWE1M?=
 =?utf-8?B?eXF2SC9GL041Uzg5N0xzUU9vM3E4bkFKUjJNS0FpUXJUQ0Y0YVNXMUdMT0JV?=
 =?utf-8?B?Rkd2VG5jRmhST0FvWlVvdFhIMTJmUDJLRmx5NlFKbkhCb3o0eWVrYyszTmhi?=
 =?utf-8?B?NkFTSmtDZjZ4ckRiRmNBYWZzZG9tNkIvL0pCNFBEdkt0YVNtZWNjc3oyMktn?=
 =?utf-8?B?Z1RsT2NkMExTdFpVbi9oYTRWV1pWU1VES0RaS0FFdE9Td2t4NjRwenp4Ym9m?=
 =?utf-8?B?di9wMGdBRytXTEhLNERYaTg1Y0JPOC9EWTJCUWVzazNWTE9OWkVnSS9UTGxv?=
 =?utf-8?B?Uy84L3lZbXV6bEx3U2R0aktHVzIybW1Oa25GWW1FM0M3Y3dDUmVtVHZhQWly?=
 =?utf-8?B?bEhqcUY3eDZvd3k5SXBTYmgwZzEwaER6YXhEdERHQXRySjBLRnY0UEVzOEhK?=
 =?utf-8?B?amNpUk1ZWWtPK0M2V3l1K0ZJS1JZcGU5bWkzUFBYNTNyVVF2alhhQkNMNThH?=
 =?utf-8?B?YUViUTNwL1dnNFRTSXNsd0JyM3ZyN1MxK2lZZTZHdFRObmJrWmpMTjc4Sjk1?=
 =?utf-8?B?LzB1RkJaUHlwWFFXdjVWbmF1TEsyNmxyQ2svdmxyT3lTTlZ4b2tBU2lZZmw3?=
 =?utf-8?B?YzZ5d2RhMkZYYlUvVUkxUnZtRDdxL2xwUjAzMWNqUXcyc094SmNMd3hHKzVE?=
 =?utf-8?B?UHh3dFlwUC9YV2JiWHJvUmoxMFl1WWVXSDBSVEZuMWZLWnVxMGZxRXU5ZWFl?=
 =?utf-8?Q?TSsq3h5c/8rx/6BRdvhB+dS8sMpqjVKY2tgU8oNk9w/Q3?=
X-MS-Exchange-AntiSpam-MessageData-1: H4pUMGWpZvponA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c12e2d2-fcb5-4d0f-9b0f-08de73b019a1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 14:22:11.7425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8d0qJ7AD9Hv8Lw08jzUGrgOK+B2cBZOlP3x776Zci/CRSIpnxrSGFw82CpgnovqBQswJe4h/3DgPREf9kqJzlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7811

This feature is stable since 1.89, and used in subsequent patches.

Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/lib.rs     | 3 +++
 scripts/Makefile.build | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3da92f18f4ee..cddeae8b6cb2 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -37,6 +37,9 @@
 #![feature(const_ptr_write)]
 #![feature(const_refs_to_cell)]
 //
+// Stable since Rust 1.89.0.
+#![feature(generic_arg_infer)]
+//
 // Expected to become stable.
 #![feature(arbitrary_self_types)]
 //
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 32e209bc7985..923886735299 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -314,12 +314,13 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 #   - Stable since Rust 1.82.0: `feature(asm_const)`,
 #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
 #   - Stable since Rust 1.87.0: `feature(asm_goto)`.
+#   - Stable since Rust 1.89.0: `feature(generic_arg_infer)`.
 #   - Expected to become stable: `feature(arbitrary_self_types)`.
 #   - To be determined: `feature(used_with_arg)`.
 #
 # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
 # the unstable features in use.
-rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
+rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,generic_arg_infer,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree

-- 
2.53.0

