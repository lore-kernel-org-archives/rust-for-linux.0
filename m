Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013063.outbound.protection.outlook.com [40.93.201.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E97FDF59;
	Thu,  5 Feb 2026 22:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770329856; cv=fail; b=Xvj++ecNT7Ml2ySk2B95ReCsx3vOGFmVLuVcJEPKt/EnNdI167fy2VY6Tbhe9Yu6M923vH2T/45H6gwcsWKHt+5EHT+xEE27mEhhpY4noI+ockx4yIl8odNV/Chs1gSNJRvO/QdpFE5XrZ7DYP61cDAOQ1/JufYoWXy10y4rMcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770329856; c=relaxed/simple;
	bh=J2wuD58DEOBtW3XZXPlZlkxtikJKW1VpPcvq3OsHzww=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=txoO8+K95jn7HZNjPyFE2XlK9mRWtyZl3J1F/Lzsim5LV4i9M6OxradwYxvHc92L2f2fS264ok0iizVn6Ic7FNBapGBZZgr+8rANrr2Z9RtpUW1lJUd3564XwjTM/ZcpIx52wCfSsQiP5csewtJCWzmwG1mC0t86UNZBdL+dNts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WhJsJ66z; arc=fail smtp.client-ip=40.93.201.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WhJsJ66z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dwAz3uWAyYtQvtIVIAXBx9DQ3CtrlsfHnZ6TFR+mezMR81nlLRzvBJqEtzOFvXcWqNiDHj81uxVo16HLoT+L2XL+LvOjeOKnI9Z25RpNk/3L88Kh4TT64xhVclyH1hwDD52RLZrdjJs+KDngExZ8OgmPy7p8RH/uyWm5lAF4WVm2JJrr9vgKC3dP3krE7tg6J+YoLcT2LZCyiXQblPswluVo1wWqNzh2DclY74vJf73tKPVAkaKXkUwuv7LjhIqX28mulxohtrcgzE5whrstnv64yJ4xhYtTCfX6oftqj/qEmN+rXzVzmN+4+QjspdGgHuOUy9HfmwexNv299PJFIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EK4qvMXKB0/G5R2dPtd4cSwCtbIdNMHtw9u4E5V7a38=;
 b=ZrWmuS4Qj5rpUWp/woQs7820btpdmZKZQmovx6wzmyG4kPDvgA5j23zYQyPfBdfWBU/OmisAynf3cPxD9S1YmVxda6md8EbAAoYzz5TUiA1NONfvX+fe5qsgTAFBhQmnXD8DAXSd8CJJeLg+2+Vg2hxP5j9gEQ5e+SVasDP6T4sQRCNdCf3jB8T4KshEo3u+JmMUuWz5taXaGtKWPthFnpOsvu7ZuSDdap/7XGar9XH33dSuyyiJtlizS6HboaG8oBujUc2rXLJtIMZimRo4dbFsaZjqbNoa136fXTO3JoDo7fK8pJSPfxevvCaJxyuw/SG3SyV1vqSv0erT8DqZxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EK4qvMXKB0/G5R2dPtd4cSwCtbIdNMHtw9u4E5V7a38=;
 b=WhJsJ66zYYbaL9xGRbGD3mOH70gqwe+i9F7BJUIgdZLrvTRywRM3Sl6CXBB436cjz5Gb1AN+sCUM8p6CL+MD6RSWvJTar3CfJlhDT+V9X5/5ZUd3Q/tQYGsa6A5F4NYEFQodYAZKhg9odpEh2CsgmEvXB1XEshixanK/wE3+XyIXCFbfILg9vqge6A5xYGgi2oPK/EYC/4kKOjb70LDPk8airzWKVEeUehmSmEUbtF/B9PB6LFqDxkCGwDaEluNCRoKbaycG2H33d/2uDrewqbWUfNLE6LG2y0z0JSsjQdlfgc3qe4Qzae383zkPEZQNvKUSjImFplYpmVK1tAv7qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DS4PR12MB9794.namprd12.prod.outlook.com (2603:10b6:8:2a7::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Thu, 5 Feb 2026 22:17:29 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 22:17:29 +0000
Message-ID: <1a332333-0706-4548-8fbe-d65956f70f99@nvidia.com>
Date: Thu, 5 Feb 2026 17:17:26 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 02/16] preempt: Track NMI nesting to separate per-CPU
 counter
To: Boqun Feng <boqun@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Boqun Feng <boqun.feng@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>
References: <20260121223933.1568682-1-lyude@redhat.com>
 <20260121223933.1568682-3-lyude@redhat.com>
 <20260203121520.GN1282955@noisy.programming.kicks-ass.net>
 <20260204111234.GA3031506@noisy.programming.kicks-ass.net>
 <aYUOME2XV_ZmRk3F@tardis.local>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aYUOME2XV_ZmRk3F@tardis.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR11CA0028.namprd11.prod.outlook.com
 (2603:10b6:208:23b::33) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DS4PR12MB9794:EE_
X-MS-Office365-Filtering-Correlation-Id: 4010c261-da16-4942-65b8-08de650459bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RlI5MmpkakoxK0Z1YUx4MyswTUw0S0NNZ1NRT0dMNWVLOC9nb0QyS051N3B0?=
 =?utf-8?B?Q3B5K05NSXNhNUdDMDVsTi9XSlV5V3ZVY3lVRWRUK3A0aWM2THFnRjNrQ3Jm?=
 =?utf-8?B?Y1FEaGIyZjRKSjJYZmxkL3pzNkRYSnEzMGlNUWhmcnNCbHZvOWhQOThaUG5J?=
 =?utf-8?B?OFdKUmJEZGIzVEFEYUNuek5hcU1IcG1Xb1dnSWV3eVJjOGp2ZEpuYllIVncv?=
 =?utf-8?B?ZzFmK2Z0Y2NTMEEvb00rOCs3WnAreElrZzRZTkRkQ3lyb012eUdDWHNaTWdB?=
 =?utf-8?B?TElMV2U3SXdDVUtIZVdrbDdKeVhpMXFtWThuckZKZTAyT01kOG9CRFlvVGFV?=
 =?utf-8?B?Sys3SlY0WjJMVjJSMEtIVW9GUDZLOWg4blZnTW9UenZIUEZ6MjFFWmJhR0s1?=
 =?utf-8?B?cHlBYnQvNGcyK01mclpobVY2VC94ajZNeTkyNlJ6TEcxT09LSlQwNWQ1amJB?=
 =?utf-8?B?WXJtWTI4eGVOUURkRFZiL0lnZ2o0VldoQ3RnOWt6UFJxMHVsRDNKYzBQTVVL?=
 =?utf-8?B?NFFSVlYzcGJJZUZVN2RSaW1UbWFxVFQ1dGdsa2xXR1lCSzBNRE9Pbkk2TVFE?=
 =?utf-8?B?U3dWdGdpcmlNNy9Hc0Q5Z2dMUzltWjZVb0tIZW5XQnBmV3dZSStZQjRsd0ti?=
 =?utf-8?B?OXJqVGl5VmgwaXYwb1lnQS8vdzBnaDJMc1BSUXpCNWpuRWRGRFNkaTdDNHFj?=
 =?utf-8?B?Q0ZvdVNmZWJ6elZaVFZIT2hKVno2RlM4b2R3Qk14enpaTFMvOUtJdUlhYjJV?=
 =?utf-8?B?Y3p5dkNOd1BBWHI5K1pQNVl3N0xFUWxsZGZPVXpRV1VVWWpQY3E3SlFUdXpL?=
 =?utf-8?B?Q2NUbUdDSklRQjNoeUtUQXhZemFxa0xQbndWaW05M3cyTU1zVXc4ZWFpWEtK?=
 =?utf-8?B?VmtnbGZzZW8zb0Fyd2lDazF0bE1jZE9NT3RDbExZRTN6WERmajRNay9LTVJD?=
 =?utf-8?B?TE5vL2FKeUxRakRyakh6dHROcnhtZVZmdm54bmxZdHpzVjhnUFRpKzRWZERV?=
 =?utf-8?B?c1g0RjBEV0lTWFp0bXJNQ0RaNmFVSXdvMHBsZ243Rk5tYlJCVm1lRURWdjU2?=
 =?utf-8?B?Q0Y5SW1uMFNTTm1vbDZQcW5BaUVqNDdRVGhOZVlpNm0vZjhsUkdTMUg1RUU3?=
 =?utf-8?B?SFc2RjM3aG5QanhCR0kzRkdRVW9VaHRDZ2RqbUNWMi83K0krRXVuTEpTTnVM?=
 =?utf-8?B?MC9pMEYyeHNGSS9QVm5CSnlSQ2EwaFV6azB2WjFFNGY5RTFhNmd2Wk9PU0xk?=
 =?utf-8?B?WmdaYW93VExORnk0ek1CVFNJbG1wa3RFNDJsVDVwTkxMVjI0Y1JJbFNmVUxN?=
 =?utf-8?B?N25iNXRzTFhmMjFKaUdQYlhoajlzNjRJSHhYTzR0VGhZYUt0ZmRDS1FvWTh0?=
 =?utf-8?B?ckplMHpUWitQWHV4c2tDT0V3S3J3SFpqckhwUEhqM2JBOXNVVHRzY0I4OTVV?=
 =?utf-8?B?ZHAyenJmaVYyOXREQ2lYNHNJOUlOUkFsRllNYnB2QU1GUEIxKzhPa2JjMHdv?=
 =?utf-8?B?UFQ5YXRBNC9qdjVpTlM1SEEzRkRtNE4yMTNPYyt5aURSOHd4MnJwa05DcFBO?=
 =?utf-8?B?Y0lkRFBiV2xFdlNlUUFzQk9EZU1IRG42MTk5UElOTUpEUzZaaDcxbmRYc2pl?=
 =?utf-8?B?SEtlY3lCeitVa2hmRDQ0ZUxHYXY1amJTSnU4Z2JQRFRpamZKVTFUdnp4bGNN?=
 =?utf-8?B?YmVUUlpPSE1FUmppajVndldBbDBKNWg0ZWxYMHFua0xhanU3U05CejFRU2RL?=
 =?utf-8?B?YldnaXNiRzZBQTg5c1ZsdnhJSUYxakMxQkoyeU5RODRvc2t0Y2VnQWhJUkpS?=
 =?utf-8?B?V0kvU2hGWVNFcDRYb3IxMmZmaGFMbHpJOTdUdzlQaXdPeTFuZGJabVF1WnJJ?=
 =?utf-8?B?c3Q4enRjNE0xY3hFN0hlY2tuUTAwWWF6alA0aTFwWUpCNU9PeFVXRE1XTnFr?=
 =?utf-8?B?WlNDbStVZ21iU0J3c1I3TS9zc21mMFVpMENWSTdiVTFHb0N3b2VOUVZBVmx3?=
 =?utf-8?B?eFAvUjEvMlhGL3lyNDJRTU1MamV2VVpWY1VKdm9IM2lZelBrcU9FaUpoZE1S?=
 =?utf-8?B?aUErN3lBOFM4Y0YyUkxaeEhJNFlXSHI2ekwrQ3hzWFYxVTYzTHJIN2M0N1VE?=
 =?utf-8?Q?r2Do=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXgrOGtjdHFWYmNJM2VyOHZQcWlSdFdlOXJqMmE1d21rQllsdDY5dU5zSkJR?=
 =?utf-8?B?dmFGWm0wUWRUUXhjbEloUk1ET0x0dXdocFUvYndhWGg2UjZRNWFONnR4R0xT?=
 =?utf-8?B?Vmt6akVPUUJleTN3NjVyVG1WL2pJb1phanFqbm45T1Q0OTFwWlRCMzRuc1NE?=
 =?utf-8?B?Z0pFSFdsMTUzVXlyRzhOTjBid0QweGZydGI5TjNvOEhkNHppcFpydVU3eWtZ?=
 =?utf-8?B?MzZoSmtFWElnaVB2RVhpNUpheGdnZk1SRGtsOTZKaXgvelUvZk5VOTE2NnVD?=
 =?utf-8?B?czhLRlVDNU9SVVYxaklQUXNXZkRLUlRzM1FiVFlZZHRMdS9ielpscE1iYUlG?=
 =?utf-8?B?MmZqQ2FxVmw0WERzNDhja3JKN2VkQjVyYkRyM0cxVC9XMFM3bnE0MHIrY0ti?=
 =?utf-8?B?WjFSZ2YvZFhMK2I0ZDRMMGJkbEpEWmR1bXdiU3V4czZaSkxOcTlOS2lyTXc2?=
 =?utf-8?B?MytObUxualBEVUN2enAzOXZkUEVHRlE5Vk5UWUJzWFdQQ0E1Y1pmZloyUU5V?=
 =?utf-8?B?Yk9oU3creVE3Y3FmbGNqdnpWNHZhUGZaNnArMGtKNnhHckJnaVB1bzhDNXY5?=
 =?utf-8?B?Z2ZWT2RTTXpYNWhaYlpGcGlicU9TUmRkVlBQOXBzV3NZQllROGFZTWxaS2dL?=
 =?utf-8?B?bkNxclNlbE1mVkVGay9wRUZFQUZudDNrWHNBVnpIY2dTdkhzMVZaS2xITzdi?=
 =?utf-8?B?ekpzNlNkeklJeVlucVhjNGVrbytnOCtoUXg1T0FRR0hrVVgvbWJZMlVQZnAv?=
 =?utf-8?B?SGZLSkJEaGpqRWFrY1JRSDNsaDF0SWhmME9kS1hsUzNLRW5Sb1ZyWWx0TDFF?=
 =?utf-8?B?bFcrNXFkVnNjMkd1RnJpQTMrNjRZZzZUelhUeStIL1A1QWlEeFcvV1RSRmpH?=
 =?utf-8?B?dUEvZ3I4elhpVCtOZWl1YS9rZFgwV2NySnM4WXM5V0RXektRRDl3T1lxNGJ2?=
 =?utf-8?B?eE9tRjRiTGN4cEo4YWVWVlF3Y2ZQbWNXQmpFRGtPa1dvM1lpTWRtS3BXN2dH?=
 =?utf-8?B?dkpJblZrWmF4YnZhSFNlMXZ6MW5NV3hHcmNoRXp6c1B2ZzNZVDE0WXZnRGk3?=
 =?utf-8?B?TERTdG9MYWRQMEx0Sys4VGZ4RjZkVG9obGYvOUdqWWpvTjh5RHVJZXd4bWRU?=
 =?utf-8?B?NjAveEY4VVY5dDZXTy9xY2g2Z1ZBMXlyaDdjLzc0N0VJNEFhNjdFTEo4WStW?=
 =?utf-8?B?aDdPQVNySHJrcElOM3dzczZyandGSWM5UFBtWUFCalFHalFBMktlcUQzc3NV?=
 =?utf-8?B?bTNTY2NGSjJnZEFLeWRoVTBnRVhZUUJKT2ZXNTVrNGJWWUZpc1R5Rlowdm9H?=
 =?utf-8?B?bUxUTVVwSmM2aHFoK0dzVjV4cDNKdVZlRTd3dE9BY0tuSDFZK3FCYmRIc1B4?=
 =?utf-8?B?VUZsYVZZR1I4Q1hyM004aFIrbVJsQVZBUTdQbHI0V256TGl4TFhlSEdJa0Yz?=
 =?utf-8?B?M1BCenN1ZDd1VXo4NTFzRGdCTXIzRjUwV0JCN1pFdDJNbkJTNzdjZzB4a09s?=
 =?utf-8?B?OHZvUE1ZSzFBeHlxRENEbWh1bytORXltdVVSQ2t6eVpQV09aL2Izak9QNzlO?=
 =?utf-8?B?K1dYdm91TldSb1VPanZOSjRxWW5MN0U1Z0lKQ0drTlFldHYzMGpuRTRTSGVx?=
 =?utf-8?B?TTR4UDRHMVRIWWhxUGg3RytxRGNhWjFFcTJZQUFkY1hIelZDOGlYQ3JxZTdJ?=
 =?utf-8?B?UnlTRnFXenFRUVkyNkxJRU5uZDNTeTFzRjlxY0lIY3MwbTlFVUo1d0hKTTF3?=
 =?utf-8?B?QjRJVnFPU0llZ3c4T1hDOFZSeXVMYUtkK0RpR29rU0JTT1hxSG14Vkg0cVRN?=
 =?utf-8?B?YURzQ3lacDhMQTJTa2lUdHExOE5EMzFITHFOV0JRQ3NvNml3Q2FXU3JVY3dK?=
 =?utf-8?B?aFRlL28rNG1UNVY4VUZMYkRTenBYNjBmbUpuL3QxeDJDSVduRStNbjFBdmVz?=
 =?utf-8?B?SEdTYWx2OC9hSUI0cGFEMDZuRlNiTVp0Mm03ODNoTnRhQnBzeUtDbnpqTmJN?=
 =?utf-8?B?dXNXSStmekpwcFlpYjdBMzJVeVdWWjNxZXlOZDVWaEc0WTJuK0hoNXE2aGFK?=
 =?utf-8?B?Y21Gak1oUlFqZkN3eGlXbTE4TmlNRFpPR2xhaFYvZUM4WU8xbjd5aFczeGVi?=
 =?utf-8?B?aDZuVlF2NnozQVhTelBtRUNIZHlJdkVlZ0hjaXI3Tk5rMTdyN09tM3BDVyt1?=
 =?utf-8?B?MWdxK3ZKdzNLT096MS9xL0J5S21xeExXOXQrNTVFd1JyaWpnZ3VLVENRNS9D?=
 =?utf-8?B?a0FrMzJWeC9uUElHaHk1R0twRE16TUFmeU9ONEdLMnZUSDV1RDYrbDNOc045?=
 =?utf-8?B?RjhVV2gxY1FCREtYcjhYUTBtRERrbDd2cmVMalRsZXd2VFlJNFVFQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4010c261-da16-4942-65b8-08de650459bf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 22:17:29.5584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IB+PRYWPr18+C7qSmEe86k/iW2moFIHVcIIdFO5uHcOR10RmREYMsYa18K+NTjrICTJncbWIn+zEkWg9eW8o6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9794



On 2/5/2026 4:40 PM, Boqun Feng wrote:
> On Wed, Feb 04, 2026 at 12:12:34PM +0100, Peter Zijlstra wrote:
>> On Tue, Feb 03, 2026 at 01:15:21PM +0100, Peter Zijlstra wrote:
>>> But I'm really somewhat sad that 64bit can't do better than this.
>>
>> Here, the below builds and boots (albeit with warnings because printf
>> format crap sucks).
>>
> 
> Thanks! I will drop patch #1 and #2 and use this one (with a commit log
> and some more tests), given it's based on the work of Joel, Lyude and
> me, would the following tags make sense to all of you?
> > Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>

I don't know, I am not a big fan of the alternative patch because it adds a
per-cpu counter anyway if !CONFIG_PREEMPT_LONG [1]. And it is also a much bigger
patch than the one I wrote. Purely from an objective perspective, I would still
want to keep my original patch because it is simple. What is really the
objection to it?

[1]
+#ifndef CONFIG_PREEMPT_LONG
+/*
+ * Any 32bit architecture that still cares about performance should
+ * probably ensure this is near preempt_count.
+ */
+DEFINE_PER_CPU(unsigned int, nmi_nesting);
+#endif

Thanks,
--
Joel Fernandes

