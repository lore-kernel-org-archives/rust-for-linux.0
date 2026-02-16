Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010036.outbound.protection.outlook.com [52.101.193.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4E72F7ADE;
	Mon, 16 Feb 2026 08:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771229125; cv=fail; b=MO6w4YsvSJRIWyF782HnBQKefIYJkg+EVQoqIXgyaDQqU8GZgrkXZ6+TXz9gDEfTvvm6g+RBs2MWlbEV8NUjkHyw5JuzKr3mANleein6OYMNh7dfspq2On180qaRAnY7avTCAVa5X9m4NCL3pgi+FnFE2ut5bXUXysp9DMyGyi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771229125; c=relaxed/simple;
	bh=hv97a2fqzXjikua63NuXqoBix+iReqw8YTH8WK+k1Dk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=T9FJVa25hKhGNg8p3kwbE6i32STiyvncEmejd1c41GTjDARKSMlzG5vukNKqzyjLe8/XbzPlfPXM2j1E8C2sUUHrZVMgsRNJ2QXE+GwPM3AJsmR6sLKlF2X6fUKms0MLTSTUUjSee9S5cSXKw1IdM5YNVMt6KHcF90JG1mJkKfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sz0DOJG5; arc=fail smtp.client-ip=52.101.193.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sz0DOJG5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XRXv/D+x0Bkh7PQxVDUFLZDtzOJetT3gfiWzfiUobvZpKhHEDcHaxrqQnnsJs7xGCUVV5cGuVQrwrowlIN21PI9huiNs1tJx9aOZ5T8cObAHvdcvKvJNNAG8KoQg/hR4N9fDVsEL0Wg+VVgA0dtbxrodKiOPrAViJdoBH8FgSfwSB8LU/Zmc1fYyQfNn2mJrVwRf9S1QGf1A9hng+46q08dFlZPgdVq3DvEJ1A65X4EyFmQFahuQafnDxdXqWOBWXvl8iBPNI3KDFQ8EPBoogg+Fs8Ewt2ovtDrIF8G7B18tSCvtWdhLfy80+3EFxQae2v3+ApNqbiLOHz1N1i1Aew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cv5JKYnqpvrnuUFVg1sieZamDmuXJk2Qfart1UP3suc=;
 b=K246QZLMjjwoPGD5Zb1PuAQtpn3ZFxWGFzTK6WaFnG/ImyRDDnbBnw05fCowyfGrFvovASvdyYvyg5Gcv7sumAVr8yRVLEof8IKbkJDZefQZ9WmugUgjZ7RipFAlaH3K3aCWzEqgnHM8A7St+gKwI2ubPCJpltqEWLSi10kIi2nuBP9O7oAaFs8C5gg4fJeTEF2dKX9JSjuqRMtSCXHVTlJPRPNdn0cIJhgiiAMFg6QykrW7HizIfX4jONPTwAr+O8mjK5TEoS4b1v3Lmm5gWlZDvZHJVF9fRKjhatZ94j8vtdTBrp0cuB1DYlizRwnTHkY7frxmcpYUHzTBo52Glw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cv5JKYnqpvrnuUFVg1sieZamDmuXJk2Qfart1UP3suc=;
 b=sz0DOJG5yJCkqRL4LfNIjMR++5uJ87phkIMtGGWo4hN46lvvQ7kiHnTuyLRzXdGSpSyQ58hljsM8S9iJYud/bsRAwunvwBjQY2/TIAk7lk9RRf5+m47lETlstpnfvTHnNqJvhl8IpC15pS/IOUHV8kg8+K2sL8Y5HPOoPuaMnRMojB7o/THtKnkDrSnQPcrx0k6E0BZN8N1D+BaiRsD45QOyA0ZLSxZyoHHRUQ1O6ad79aHzhXCOisHaUg9GoK23qFf3xp4jM0Qw9YmKO1FQDKVCK5laCPnnbT8oeH3TbC4sk9Z3Md2YxZ8Aj44J2g9rTQemyTI7vuQKNjO/jQ02jQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB6832.namprd12.prod.outlook.com (2603:10b6:a03:47e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Mon, 16 Feb
 2026 08:05:19 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 08:05:19 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 16 Feb 2026 17:04:39 +0900
Subject: [PATCH v6 3/9] rust: num: add `into_bool` method to `Bounded`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-register-v6-3-eec9a4de9e9e@nvidia.com>
References: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
In-Reply-To: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0136.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB6832:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d90c98f-77b1-4df2-5729-08de6d322045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkJnTHBLZXBRQkdNRW9RS3JyUXpjcXJzbDV5SnFTV3JnSHNJRUtUbm1zTXJn?=
 =?utf-8?B?QWxNak0vcFZzdEFsTTFHdXplMzU2WXViWDRhb0ppd20yUzVieG5xSENWZk5F?=
 =?utf-8?B?TXFQUExBdCtobHZXUXJFaUNteVgyY0wrNFhDTjZXdTdmVlZBMFlPTFozc3VX?=
 =?utf-8?B?QnY0dDFHaDdSWTIyb0p1SE5BM25halhZNEdLS2FrOEM0cDYza25jU29leE1q?=
 =?utf-8?B?SHljVDc0aEdJdjEySEpQU25IWHJHYmFDT1FlZzdtU2RwejRHUmJWRVpwK2Y3?=
 =?utf-8?B?VVJXZHhVdEdqMTBtaXV3UmtCdU1kQkhjMTRqT1dUWm5nbGcydWtRWUxLSEF0?=
 =?utf-8?B?YzQzL242a2JvZlhyVkExbEVpYzE3eWNGMUJKclM3N3pGbFc2c1pqcGNCQ2VK?=
 =?utf-8?B?dWFQNVhZT0V1WVdvbGEyeUlvRkV5REROYlQxVnlPSjcwZHB3TWNRL25hSlM4?=
 =?utf-8?B?bFRQdTVnYmxKU0MzWXVIK2FrVUJDcFB1ZDVFTDdOUUtrSWZTOGdkNlU1cVJj?=
 =?utf-8?B?azNhcDRhbjhENnZ1Y0lIaUV5OGpZRFZHWWQ5cmJyMVNScFV5WXJHclZkVGJD?=
 =?utf-8?B?SnlFaStFUzJFNTVaMW5Kdk9JOEY1NGpBSkVWMUtsWkpZSVdSeTYyQW1HRHdu?=
 =?utf-8?B?ZmViK2pPbUM1Vk42Z2d1bDFkSlgyb2R0cFdPMFpvN21aNFc0WUxDUzRJKytm?=
 =?utf-8?B?T3ZndlhwakVad0ZhYkNOVTY3cDljaGRaV2FxV1VoUTVpSnZySi9oYmJBSDJj?=
 =?utf-8?B?Y3JreWN4dWVEc0F3K25jdXpTZkd3bSttV2RKK2pMQ05pWlNQcklkK0RFK0NT?=
 =?utf-8?B?MDRCM2hmK05kOTRYV1IyVE5qbXBROSszQzNIM0VzaGdWS2xKOVlvb21TRWJq?=
 =?utf-8?B?RVkxK3FsTzJmNjJHUzBLNWNpc2tGemV4Y1NIdEtVRHJISms0c0YrNmVwZG93?=
 =?utf-8?B?RzhYc01PdmMzOVJQZTVnVnNUMjhhYy8rU2IxVzdYT3k2cFRBV2ovclJDajV6?=
 =?utf-8?B?V0RkOVAySUJZQlljcUVHdXdyTnZIcTRpd0lua3dzMHdvK1NrSjZxa1BXYkRu?=
 =?utf-8?B?Qm4rK04vcktaWWpiMW9lWE9MbzRtcWE4UHp5SDFGUk1GdUkwVWZMRGNQdW80?=
 =?utf-8?B?UW8rd09wRjBHTm5wdjh2eUtzVDVCZXdUN0FkVVI2VlJBUkRJTDZjSWhMalNN?=
 =?utf-8?B?bWNoUGllMDJQRVo0RkI2cXcvTmpsckZNMm1KZzl4VkpOdndFeEU5UFZieng2?=
 =?utf-8?B?c05UVllDZkwzekwvL2VteElSQWRFamViRVdybTgvOFhweHdWWWp0WmR3a1pS?=
 =?utf-8?B?U0Rvb3psaWIxSG41MUU0Smt6emozb3RQYjB2cjZ0NzdEVUppb3RmV1YwaGR4?=
 =?utf-8?B?SGN0UzNOYkh5WkRXVUtTa213Q1dPazFpNjQ1bU5pbU9tUWZtS0FiWG9SaWVH?=
 =?utf-8?B?VVppZk5SV2hRaklQMUhhMktwOHkvc09RMnhHcnVuK1dVMFhrYXY3cWlNblFm?=
 =?utf-8?B?VDVpbnMxUkVyWWtqSzdYM1lKWjB0Y2NCY2pldmt3dGY2VHJUZGZCZ3ZhalA3?=
 =?utf-8?B?VWNjbzRsZHF5dlFuRDVOSGJ2bTVIRG9RWFVlc3dUVGM2WGVhTUszQ01IcENC?=
 =?utf-8?B?Q0g5bjVqOWJyb3FWc294L1JpUHJMSTRHTWJwektabDhzdEsrd0gxWXVDYUFP?=
 =?utf-8?B?NkJuWmhoaWV1dlZPcDQ3UHFGejlWNXRVOGFOaWVrYWY2djN2dzd3MVgwbTFW?=
 =?utf-8?B?MHZLM3NOUkg5cEFxdUdUZXgvakdjb2liYkEvdllIMHAxRm1rUEJBUmZiNXds?=
 =?utf-8?B?dlZBMXova202Q2dsVG5yY2FmYTAwR0duOHllR25qWXZ0MmlMRVplZ1krRlAz?=
 =?utf-8?B?ZjBLb25mYWxWS0lyd0gyTjNBSStCaUNPVGlDRW5SeU0rVlcrTDBueVJhbktt?=
 =?utf-8?B?YjRacnBYWVp0QVR2VGV4c0p1RWZPT0pNRHpkanViWjBtS3Y1cWVrWVdhdWxJ?=
 =?utf-8?B?cWNFRjhWZUNnNGtYdkxMeWFMRzlBT0I0RWljdTh1d0QyRUtERWg0REh4czhQ?=
 =?utf-8?B?Umc3dCtMTWtPb0dEWWJ1RloyVTVkY1ZGZ3lDMHFsQlFtL1Q5UUw5ekd3Zndz?=
 =?utf-8?B?QWQ2endTYTZPR21uRkp2Y3lyS0tCZDh5aEVsVVZwRE1ta0loUnM3aks2Zkk4?=
 =?utf-8?B?RWc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NE1KMjZrVlB2MllXZElYcXNPZ3owY09XZ09GQ1NtQzhwc2tRUWdoRHc2RjM2?=
 =?utf-8?B?TnUvRGRUL3lSSlp5SDBNNTk1STZISWNvazBIalh1ZXRRbFFGdmU3S2c0eEhm?=
 =?utf-8?B?Q0lUZXg0U0NqaEgwOUtXZm5OTUR6K0g2Rkh3bVNuSmY0dGViREdFUVBTMTdQ?=
 =?utf-8?B?TkRsMzU5OHN2MktrT0ZqeVh3TUtvaGtwdWdGV3Jtam1DSC95UEs4SWhMeFFZ?=
 =?utf-8?B?NEM2bk0vR2pUd2dCOExpaldrdmpFdytGU3NLYllTTmwwNDZPMHR1cVoyV0FX?=
 =?utf-8?B?WFpTSlVXTTNDcENrcmNkRjU1b2ZNd0wwbzZkUVRtQThQRi9lUm5Nc3N0dlJ2?=
 =?utf-8?B?Y3c3S3czVSs1Lzd4ODVyRGlEQ1NFR2NQeFZudElJcmNLOFhKZVJvazkzb0t0?=
 =?utf-8?B?dEtPMDVJRUJPcXByYmNuUXZzQUJRSFU4QVdaV2RmYS8rM29aZGhNWkkzWDNi?=
 =?utf-8?B?ZVFwaksyWUZCYlNxT2hBSEFQU3dlb0lZdzhSK05QVW5NWjIrYWxsMS9rWHBP?=
 =?utf-8?B?T21JUTArOHFQSC8zdGtVR3dhNUt1L3lodnJ6UmR0M3dtVmUzT2FtQVZuelZu?=
 =?utf-8?B?elZPQ1cwWXdBb1JnejZCSUVxM2lJOEw3MXM0SmtuZ2hnMDljLzdoU2w4ci9n?=
 =?utf-8?B?bjJUYzVsSlBFSmJkRWlRbFgyZmhhSkFiT0lHNU8xd2RwRE02bkRDSDAzNHc2?=
 =?utf-8?B?b1Y2YmZrU2RTK0Y2V21ENHNQRWNkelpibnFiWWovdUJBYWxkaXJVRnBRQldp?=
 =?utf-8?B?VTlyVGZ4aXBZbkVLTHlNQVVYRGlBT2Y1akQrS2RtUXR6eElEaUtGZFZWdTM2?=
 =?utf-8?B?bVhqd05wa3BqeWJmb3diVDhmcGhpQmFGWDB1Q1gwcVVDenVDZG44YXBpU1k2?=
 =?utf-8?B?akFIK0p4TmlFakE4UTFTbVdHK3ZXRTM0eE5Sdjd2WWpSS05nRHV0UTgxUHYy?=
 =?utf-8?B?b0dibjlIZCt0QTVRRUY1WC9xMGZVNlRUNytoQ3hOdWZjY0orOXJXaVBXdXM4?=
 =?utf-8?B?R0g3alkrQjFycUIrWW1nN09yY1FDcEhmWVh0SWgrTFJ3cDdDRE5QeG1ybmxx?=
 =?utf-8?B?cVljSmZ3MU9iRlJqZ0wwQ24vYUlqQ01zK3hJNkhmZ0JibzhXanpFc1JZZ3NV?=
 =?utf-8?B?UGJQcW5qU2t1aWE4ZFRmNVFGc1RjbWhKSVdFL2MybFdkdHBHWVNFVjdTS0E2?=
 =?utf-8?B?VUZ0aHlpSDBZc0krZkJzNDlBSy9pM3o0S1VPUVhUSDExWUo3bWtNR1gyYml5?=
 =?utf-8?B?VDFiTmlKU1RwYzVlL0ZiY2pKREdEMndDUHUydnBEWW9BUzJCRVhkemJrSkdL?=
 =?utf-8?B?NU9hdkFTN0RHZTJWdWtMSG93SnRtb1pqSFhBeVZEWWRxeHZSVVlWM25hdkpu?=
 =?utf-8?B?WFpyZ1c4UnY0VTdjMERKd3BvYmRZaE92M3UyajMzNjlDMGJvbnlIN28yYUdZ?=
 =?utf-8?B?Mi9rMTcvRGJsVjgyRjRFdzVKb0NEcGMrUU11M2FKaXhhZXg1akhMcDN2L0o1?=
 =?utf-8?B?RUVHYUZNY1ltL29zWmRPZ3lEamY5L1ZFT0VubTEyRkdsTWg1R3VFbFVpdXF6?=
 =?utf-8?B?UTFJSDNBbktWOE5pNTZNOCtLak44cnZHUUlpZFp1YTlRRmExL0RPUC9iYVFM?=
 =?utf-8?B?dGZ5UWN5dGsvcHVBTnZIemh0bUgwdkZpbCsxZ1pKVDVodkx3T1c5aFJ4QTd2?=
 =?utf-8?B?RWVXbHNIS2RqeG43K3hoU0ErTllwZHMyM3FvYU94RHByWkxrYStOVVVGTkt4?=
 =?utf-8?B?Ukdod21vdTl3Q2Y0U29uN3V0TzhEVTVobUljWEdIdkNySVZ6c1pCUlhxU290?=
 =?utf-8?B?emwrZlFVQTkxUi9wU3pDVzFaMGpxbStvSFIrNW5SY0VFQ2p3T2xLUE5VYlFZ?=
 =?utf-8?B?L3ZxNkNoVktaekEwRnJsaEJxQjlod1BkSWtwSHZlS1NVQ3l0a2d0SGlrQ2ha?=
 =?utf-8?B?a1drNXpuM051SmxwdzYva0FHc2NpN2s0Ym5MQWtvWXdQWEZ6N0VVT1BYN3N6?=
 =?utf-8?B?am9wZXFVcjc4N3hMYWhQRXgvR3FDdU92SU8wSDZERmxMWEdNMkNob1duS1Yz?=
 =?utf-8?B?ZVpUZE9mV3NEQ3ZmdVd5Vi9yTDRJZ1k5QWNzaHV3UHZOSHU2Wk5EZjcwRjN3?=
 =?utf-8?B?Sm9obEJHRnF5UnlzcWQ3b0lnZlhqeWFiTWtEaWp0eHROWHZpeUl4NkpTT3l5?=
 =?utf-8?B?NjlBeGFPRjBGSkhjeW1RYnVUWU54Q0V4cW8zbm9GTERSL3hkbDBvWDhjbnRR?=
 =?utf-8?B?OTZnbndMM0l0RWJkTGZJdUwvUE40Q3pTV29oRmV5cGhibWVMNWxiZjZqMXlp?=
 =?utf-8?B?YWhOeFpWWlBkdWloVEp5TWhPOVgyS2krQ1VES1NJazhxbUtkTGZSTFJCZ3Jq?=
 =?utf-8?Q?OtPvxG7qxJfuiFkMQ38fDs5oATjUrymMsXkZsx6xF3BF3?=
X-MS-Exchange-AntiSpam-MessageData-1: e2L2q6UGqh7o3w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d90c98f-77b1-4df2-5729-08de6d322045
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 08:05:19.3188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4hv/MRG1dm0Qw9L0cLu48NcwwrWisFkQF9hET7n55d7qTCHyr1thdeD6i9ddFRseDgt2ctPty2JSYc+snOgd4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6832

Single-bit numbers are typically treated as booleans. There is an
`Into<bool>` implementation for those, but invoking it from contexts
that lack type expectations is not always convenient.

Add an `into_bool` method as a simpler shortcut.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/num/bounded.rs | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index 7014b5be66db..8e4c08924d96 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -1101,3 +1101,24 @@ fn from(value: bool) -> Self {
         unsafe { Self::__new(T::from(value)) }
     }
 }
+
+impl<T> Bounded<T, 1>
+where
+    T: Integer + Zeroable,
+{
+    /// Converts this [`Bounded`] into a [`bool`].
+    ///
+    /// This is a shorter way of writing `bool::from(self)`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::Bounded;
+    ///
+    /// assert_eq!(Bounded::<u8, 1>::new::<0>().into_bool(), false);
+    /// assert_eq!(Bounded::<u8, 1>::new::<1>().into_bool(), true);
+    /// ```
+    pub fn into_bool(self) -> bool {
+        self.into()
+    }
+}

-- 
2.53.0

