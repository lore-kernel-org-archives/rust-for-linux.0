Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011043.outbound.protection.outlook.com [40.107.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9B42FFDDE;
	Fri,  6 Feb 2026 16:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770393637; cv=fail; b=R0stYGSU6ir9a2Y5L3zZGucR5f4w11VLzcEJ9v34Ta8AqY/chVmu8PorZXT9UP1XjJcPqTWhDw/TxSVvVzxzz+9bd305TDS2PUn1E63dnlZYqshpITkteGuwvO0iVQs53O8cs4bV+l6n2F2pDNwQO3z5KOn0y1nNKcR9+oAJWWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770393637; c=relaxed/simple;
	bh=0pScUFakJEc0Zw6Zutj+ze8cjxAw83JqMQWnjwjoRxA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fA3RWTMYp3RBIYMC9sjHfu/CmgQrFOX0cFbDCBbaBn6hnN7MTkezysgOHeEceyz6EstZi6RAdLACklmm4eisz2ISeTGphfSJBj5MDtffBVWzu9SSIKLA0DIISKMHsfm+neCYdSo+NL5YZlAdlhAFjaBhPOxddBnzUDKbN37+8fs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=K7QR37Bi; arc=fail smtp.client-ip=40.107.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="K7QR37Bi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIsNTR2Fu+Barfg5zTZSuQRptj9eU6gxkxPAEc5JE3r2CFO7E4NgizwTCzKWwVUq8uS4KCYQGk1xau0TwNjvReO4lfOzLXYge5tcQMsvBaX2RZhfUEOBLQ3dhf6a5vtmfbzfBY51Bs3MRe35pvxe2HbXa7MNQeQhcySsik/lJdm8DOiChi/A1hPaOC3SEBPPIE20kxvI999wE6or1jFYMnnM2O37w+VkwH7rrzSGTqZIKVvN5PbFVWe57psZEd1wUnUrr+FlmTDyMeTmnINHCDu0ajE4DyunB7etGzIPDpluqb3SRP4OSENUEsyiLN9khMFmbue/mmeLwhsXxBXx4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plxcu3UVwUlq8iXr7RnVtVIX4Sbgnzh9DWTXlFgmM7w=;
 b=kTxPxtXNJzKZzRqO0jisPlXRv/tVwMimzn7b+7SG+MDgTqAxq7GhjWaJrUGw1CckXUdY6l9CnwjsNH8lFa0dhLmg2GDxMfiPyrGz63dBxoOTI+iWy10IUQUNgLohYKuv0dxS4ddvvVMbL2LQYR9+gzfEuVcRiuOnMR6FkFb8RHK/NOX2OkZh+DCKBAtUJbQEvMmpIJeOydUDLD3Aa+uidjEur83Ol7GDtnVzA0FO0jMoAzcixLfN5fsIovV0BtjdaGbl7+1zMyQ11RbNQevDDy0lRStj1wjTgf/6tg3XE9cP3RD6PJJ8WloyU/iCSEtieTUgVFt880lFMdf/Zulcag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plxcu3UVwUlq8iXr7RnVtVIX4Sbgnzh9DWTXlFgmM7w=;
 b=K7QR37Bi06llPqRJlz9aw6/DGHerTk7ZJ6oaE7JgxxG+0KlHMtqPpgy1Pjw8SrHvDXkMxq6vP8AVmOLtD96V2cuFp0XVCRXGhUt1jQNalzfd7lpZRoK/22wz0pBNzevFzY+uLQXuiN/CFKeV5RGBv0Le2VUQwdfZqufHO4J4EgbJ7HHV7ylKuaEpxkkMUUk4i3cKrtBVELKKlTDU0C6lpy/1mSrx4b3pf8UUudbA8TVJ8x2nPRXsjpgSqcMInw+hmXWs8Q+nklHkiXw3/baRdt5FJXOm0o4H3MynJfxTKezQuy6WdeT4TKJd9KwmRr/dimio0sjpy2TWCUAVbSgqjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DS7PR12MB5935.namprd12.prod.outlook.com (2603:10b6:8:7e::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.15; Fri, 6 Feb 2026 16:00:21 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 16:00:19 +0000
Message-ID: <cd3e4e70-a007-47e4-8313-ae786e363a34@nvidia.com>
Date: Fri, 6 Feb 2026 11:00:16 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 02/16] preempt: Track NMI nesting to separate per-CPU
 counter
To: Boqun Feng <boqun@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Lyude Paul <lyude@redhat.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>
References: <aYVXQVwOZapVbnP5@tardis.local>
 <6792E792-2043-4BF5-952B-90847703F23F@nvidia.com>
 <aYYIikXcrXFOZDra@tardis.local>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aYYIikXcrXFOZDra@tardis.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0205.namprd13.prod.outlook.com
 (2603:10b6:208:2be::30) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DS7PR12MB5935:EE_
X-MS-Office365-Filtering-Correlation-Id: 1054db64-99ef-4550-b2a6-08de6598d361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXRBVGlidWY5bUlMYW5GK2l5UGZJQ0RTdmFYODlkcGtsdnZKM1NGTDl2M3ZC?=
 =?utf-8?B?a0RNbmgvS2pRVFV6VlNidURPMGkxY0lIYXAzZ0l1d0NYQ1RFcmJnRTJYc0h6?=
 =?utf-8?B?dG05OVdONnhPT1lRSlVFekJZeTh3TGlUblExRmhrSzV1WGxnVHNDZXBKN1JW?=
 =?utf-8?B?SGFjOHlGQk9IZzRiRC91Yk9HUFVsTXRsQkZXeWtIcW1VWWhLbEhzV0xidlRD?=
 =?utf-8?B?d2lQN3F5VkhmZFJEV1Y5clJTekpvMW1xTVBwQ1pxM1JUd2creEdabmc4MTVV?=
 =?utf-8?B?bHZSY2RXclgvTjFYUEtTM1dRRklrMXc1VkFxSTFaLzRJUmZ2dmM2L0UrMzNm?=
 =?utf-8?B?VlJ4enNxaDZWRFRHQWJvQzdJcHliOUljQzlaV3h0YmNVd1BqbGJlemZNNlA3?=
 =?utf-8?B?a0FlTi9JYXJGdTlNb3BtVFR3OFgwZng2UllRVWFkSE9OVEZ1OTJ2YWhDOWRS?=
 =?utf-8?B?czh0UzQrN3pTSEpqYmVUOG5lUWlYV1llZ3lwQVU2WXhMelJ5SnBsck1Ceko5?=
 =?utf-8?B?MTBNbDFCRUdLUHpnanZOZjVXRFhoemtYTU9BR2hlL3dISGpmT2ovRmZFdzNq?=
 =?utf-8?B?TTFIMVIwaUh1R011STBQbUxuMFVSWk5mTnppTS9mT2x6bjlxKzVjWHZiT2hT?=
 =?utf-8?B?eFJwWWNBc2wzOC9sZDAvSm8zcGdyc1VBMGRiSlhDcUh3c3pVdWpTc0wwb3B5?=
 =?utf-8?B?RGY2UUJZakh5ZGhGWWJyNWNlYXJXYkxNTGNoZ0FTQjNHNldROFRFaWJqbHNl?=
 =?utf-8?B?VlVwSDFJalYyaU1nejkvVlJLZmpjdFUvTC9yaUNUa0ZNdk1xalErd3JDdDg1?=
 =?utf-8?B?V0x6Ri85QmpTd2JvR1Y5anF5NXNVWUFZOS85N1FGaUI0L2o4bTIvTGFHZnI5?=
 =?utf-8?B?NDJVQlgzVEwzQkJrbHhycEtRQ3ZBaEF6RVNVdDRUN0tyWUxCbTFrcFdGRWhF?=
 =?utf-8?B?UWJkMHJBaUJqV3NidjY0b0hnT1A4TDkvcjJERktoT3I1VTZVYzgwQVpoZFJC?=
 =?utf-8?B?enJxSHExWG5jTUk0RWtMU2xpWFpVYk04aGZWQkJOb3pBUUZPL2I4S2VYdW5K?=
 =?utf-8?B?cktscEF0OUF0amJFTVBoWjNGczdrenZJYk5NdEpRSHBjRkVKNDN0UjFKYzhC?=
 =?utf-8?B?ZHpNMVZkMmJHeFRLcnZoN1VRSkpCY1ltTVhPeGsyNm9lZGlPTEpxKzJIR2po?=
 =?utf-8?B?Snd1N1NSY283WkZEUjlBRjdGZUxBL1AwMTZaa2lTKzE4V0E3K1BqbWZwZ2F3?=
 =?utf-8?B?ak1nSFhOMFdFRmZMY1JwYUwzNjlFVXNPcnZHWllRQXA2dGRZOFZnM09PUHBE?=
 =?utf-8?B?OHhwNFY3bFZUc3JCTzFvTEFUQ0VQRE9SbnRxSkdKWmJhT0lGNEE3Z25wMkRo?=
 =?utf-8?B?V0gwNHJhQ3BBOG9GUEtoZE4xOUJ1N290ZlYwRDRSeXZEYkpyaC9zczdmYnZj?=
 =?utf-8?B?QjVjNlVWZDR0bmxLNEhOcWU2Q291SkFmL29UcUpDdmxMcWxROWlGQ1E0eUhq?=
 =?utf-8?B?VW1xRjJUY1NsVHhOWnpEdEF1SWN1U2h2RkVpMk5vOHBKRlhXaE9KTVJrMzRX?=
 =?utf-8?B?WnUrcEhFNG14L2pXMTFpeUNkVkc0a2ltdU85ekNhZnNjZVpaUzFPZU10UGQx?=
 =?utf-8?B?Z00wZmlXWG5TMFBudEVGT1MvN1M5d3VOTkJyQm03T1d1QnFFZDRTMnQ2U21j?=
 =?utf-8?B?NHNyajV3ZzZzeVBYdHZobmpxZk5XRjFLS1hpUU1xam5wbHhkZ3dyTVplUjBT?=
 =?utf-8?B?OEd3RUNKakxQeE1uaFVkM0VieitqRm9rLzY2MzBpRURZOHFtc3J1bmRTb2Nv?=
 =?utf-8?B?Z2M0TGx3M0Y0MmFLM0VMUU96c21uZjB4WUpkS3FiVDZ1NkYvSWIwZDRlbUFl?=
 =?utf-8?B?eGVoSllNa3FWcHczLzlqWlNsek5RaVNIeU5McnI4OVZFR1FIUzI1UHp1SFJQ?=
 =?utf-8?B?OEFuaVJjUGdOYUpVVnFGSjBPaW1MZ1JweUNqSG40bHJIUVV3SzBrbGZ4TGJZ?=
 =?utf-8?B?RHd4S3RpaGhUU0JmdVlrb3dvMldpUkxJQkxEd1BWN3p4MzFaNXk2MmNRZGRX?=
 =?utf-8?B?RVJla1ZmbjJZdnl3eDdUclhiQi9KYWw1QVF3TnJHVnE2UHQ5SG5OQkc3a1lx?=
 =?utf-8?Q?QvvYhiJghB/mb3TohUPrt9NC1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3d5ZmlMSnhnbm0rVDk2bmQvMnMyZGxKUEFpMjF2MVpDMDJ1SFJpTVJxK2xn?=
 =?utf-8?B?eS9BSWc0ek9wRzRxTXBBRnpKakVkRW9nTWozQUpHb215bWRvOHNvMXowV29x?=
 =?utf-8?B?Q0l6QjhXZ2MyNDBXNkpkYWl0TkZHQXByakk4b1Z1Mi90MXlpRzNPSmRVYWJx?=
 =?utf-8?B?cDlFc2NYREhoNk16a00yRHNPSUNyZWNacmxJa2RCd0FEd2ZIZTlXNERXaG5r?=
 =?utf-8?B?d09OV0ZIZzNlaWpqc1RvT3Btbk4xb0RYVUhsTnhmd1dGTlZUWnl4OEgvNEg4?=
 =?utf-8?B?d0ZQOVlXYjYxQzBSNG84ZjZPSlpVNFRGYkRvdzdKT2wyTWRHUW8wL3M0QWVI?=
 =?utf-8?B?Mmk1QVFqN1VucWQ4UVcwaU5RRjBQRHNGZHhNU2xwY2haMWRmd3gzcWZBaXUx?=
 =?utf-8?B?M3RsU0UzbXlPQURPWkxkSDhOZlBrelR3QjRDZWZzbFE1K3VxcWsvRVprWWtj?=
 =?utf-8?B?bWxRYTFZUWlhSnpOREE0bXdoamcxemhvYXNFRlNZNk5YMnMxUTV1TnhOZ3Za?=
 =?utf-8?B?ZmdCZWUrWE92OWZWL0VvbE9xd0FFa05rZGk5RGFzT0oyem1QbFJka1JBclpX?=
 =?utf-8?B?VmFQaENBaHZIRXZFT2xrcmZnZGNEUkxHT2d2SU5Xd2l4dGZZdnltR29oRWxq?=
 =?utf-8?B?YXZ0ZEZOTWZFZ0pyNEUzZ3ZHMU5IWFBwb2RrV0hXR2ZXZXdlNmFwOXRvTjk4?=
 =?utf-8?B?dThvdUhTcmtHRWZzcTd6UnFhS0JGRVczdXFLWTJVTW1jS0k3TGpyQ3MrQnZY?=
 =?utf-8?B?V1AyNDdDN1l5NXBmZSt5TTZVZEt1bnljZnZzeTJyTGNqRTgxdkRrb0p0T2w4?=
 =?utf-8?B?SGRHVnhpOUZ1dUYwZkNWNGZrOUtvbVExZlRFNTZlaE9pdmFvakxDWUszeEI4?=
 =?utf-8?B?cmZIemsxUVQvMWkzTWpXemMxVFFYMGswQ1RKcGh6VzJqNEJrREs4ZWZ6cHdU?=
 =?utf-8?B?RDFpTlE5QS9mZzBsdDJ6V1ZBVFVSMmsrWmF5RmJiRER2bWY4VHJOUnhneUdP?=
 =?utf-8?B?TnByZjYrWGlmSlFBd0gvTFNmbm5oZ1o0QzNZK2QzR3A3Nlh1NGZ4ZXRzNTlU?=
 =?utf-8?B?bHdyNittYXc4ZzBEY3FEa08xUy9MNC83YVRtNWFmb0RxV0U2VzlIQnFJYVh6?=
 =?utf-8?B?Z1I4WlFGc3poVGVOQlRUcHV2WWJqMHFYbERpcEUxWGd4cFYyZzRJOXlFVDZk?=
 =?utf-8?B?NTJGVnFHeTh4Q1RLenhzcnFScEZrTWgyOHNaV2pmV002M0JqT1dsSFBGQUp5?=
 =?utf-8?B?ZGxEcjFlblVFOG5Xem9CbFdBMTN1OWMxbWlnOWpYaXlHeXI0T3JNMHZKclRa?=
 =?utf-8?B?UWliMUd4TEFudFhqWEdmbjEwalNHSHh3WmlPd09lZzJPOEF2a1oxV1pQWVRX?=
 =?utf-8?B?Umw3b2Z3OWYxZ1p6WkdGYUQ4YmlzV2ZLNG9OcHZIRkNiMmFjbm1MT3U4Zith?=
 =?utf-8?B?YVR4ZEoyUHRFNXhqem9oczhEd1JndTQvNldHWDcyZy9ZNlpoRGp4RjRvL2ZX?=
 =?utf-8?B?amJKeGFqU0UxM0JJTkx1YWxqVld6M3JOZzFjWjVzOTI4Ymc5Y2xTcUJzYmcv?=
 =?utf-8?B?RXp0dHp4bGpFSlNNbzJRbWxkOCt2UjYwcjMvOHRtUE85V3NkRVVLK0RLRHo4?=
 =?utf-8?B?NmtyaWE0RDdSTkVNMFBwTXJEcTlYbUphT1A3TDBZRzR5LzN2RFh3VWhXRS9D?=
 =?utf-8?B?QzFPUVhlZmFLZXFFcVlzOHc5U1VyVTRDYWNpWGpZbjJrYUhFdDNGNU1QY1Uy?=
 =?utf-8?B?cWJMTTdiTWJaM0V4SmFXMHZ1UGpoRWgzOVVGeG5tTDlGV0loZzg3bHl6RnlX?=
 =?utf-8?B?dnl2YWt5RDVzMWJoSGRnRnNOY1F2THJ0UnNnQkdjSWhlWi9TekxHRWY0VnJ1?=
 =?utf-8?B?S2g2ZVl6WnZadWFrRmI4bXVCWWtvM3lHdzhpSkRXU1pPemNTVDNXc1FJbS8z?=
 =?utf-8?B?bEMxYmsxZTYzTHEzenM4UjFSV2MzY1FYY2laU2VIbGRJUEl5a1ZEV21pYzk3?=
 =?utf-8?B?cjQ2dHhncTc2TkQrUnpBcnp5S3lZUUVMQWQ2TGFlaFhsVndNRUlWZ3B4aG1I?=
 =?utf-8?B?dW15Y0dDNmt3KytqTTRWb1hnYUNLYk4yK1ZpNUx2MmQ5dmtPRHNxME13dDdH?=
 =?utf-8?B?aEN3U2xJVFd1OVJyNmhMc2JVMWpqQzdLN1ZZSC9YdEkyVkRub0E3RnI5NjRR?=
 =?utf-8?B?ZkZVZXJhdjdQNDRqbG9DNDhYMWk3amE5WVJCRCtBYnVZcy9mSEg2bHBpNFhK?=
 =?utf-8?B?TFJla2ZhK2VHdnhZNzRwL1Y2SnBmY0d2dFhRNFdnZmQwNmo4YzVocG9Sbmk2?=
 =?utf-8?B?QklaZ1c4dXFNcEFFR2xIUjZEaEFqcDdoYTFqc3M3VHBKMjhZbWNudz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1054db64-99ef-4550-b2a6-08de6598d361
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:00:19.0796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: loF4ibuvWQia1/C8sGoZO4EkvlqfAuRVCGxtshBaO1dT2g07/wag8GA9o5sDTPKvHi3n0uNNTeu4X8Ibitcduw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5935



On 2/6/2026 10:28 AM, Boqun Feng wrote:
>> I was also coming from the goal of long term kernel code maintainability. If
>> we decide to have additional preempt count flags in the future, does special
>> casing 32 bit add even more complexity? (not rhetorical, really asking)
>>
> First, given what preempt count is, I don't think that'll happen
> frequently.

Not sure I buy the argument of not happening frequently. I don't think any of us
have a crystal ball. There are cases in the future that can come up IMO.

> Also I think the reality is that we care about 64bit> performance more than
32bit, in that sense, if this "conditional 32 bit
> preempt count case" becomes an issue, the reasonable action to me is
> just making all preempt count 64bit 

You might be missing something here. You can't make all of preempt count 64 bit,
that's the point, it doesn't work. That's why Peter did what he did to
special-case 32 bit. See:
https://lore.kernel.org/all/20251020204421.GA197647@joelbox2/

That said, I am ok with the approach now that Peter mentions 32-bit x86 is
"deprecated". :-)

-- 
Joel Fernandes

