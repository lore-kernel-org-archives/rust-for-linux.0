Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011024.outbound.protection.outlook.com [52.101.52.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98FC13DDAE;
	Fri,  6 Feb 2026 01:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770340981; cv=fail; b=Os6RlMv5oxGldyDwt8Kyv0SDtb0Me8lrOP5GdKeNL27Gi2JJcejFt2ETNk0H8axP11nznqcWNZcjO3SFqSq1p5TB/p6Ubk34knbNNXNhbYpCETX+amHFzfCcsHkf7DArsFylJMf7/yG5fzIATv4rN4yANQTVcUHE1gKDze0Xm5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770340981; c=relaxed/simple;
	bh=jrsIV/7kCdT4J8NA34NzXDjBS8JMV6NH2GZMjW7EZQI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YeID8EB5Rz+OG5NJ1dKiVOeoWmbtpGGNBQ/Y7r1UPGErRTHgGitBIvlLDMcJqpyiqUv+2ZhdI3Fz9bwAVgNwtxqAY3sIcBzWjXW+Bqzf60mBM0GMaLMPCQewkAqdanSXSigYJJY57ioXhMAUwxwt7/PRLbgSZH25CMF1yKJx494=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EfmohupS; arc=fail smtp.client-ip=52.101.52.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EfmohupS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLcNzr20hwnPOHLV87VCYkkOjG3zcJAorvsh5QoMpgaUU7kanlx/Da2F4YP2tquQJF7RLVsSbBo01abrpKUhsLrFlQAK79d3aTggqXo4ra9+xnac4awNixqLhqs8v9qfmAq/5wWDIn7d/d5FYrndf6jakX3acg1S2Klaw7gaA+dJ9z8Ba1HcBwfw/asfPFfwHmDpwX8e2dnooM5OCbFwO3Ldqeby/QJOmPbithMooGQL/jmcas+ZqbIjWVSASXuRRxyQeoHOWOLZcmI2dzQdlFh1AZjktdAOd39Vy8SJZvdO+kroUchvbTZXdkmjwaNM1C922Ay8qnfw/UEN7cklww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJJ2xseVH62H+qTy/v+7yaqXXNz7cEcu3h49e+gCFQk=;
 b=KhwFtoso6kARVvG0r0FqgPqgaxXo1G99ojhuZFaoILnh35L13Rmj5RYfK80s/vz1nFp1ua3vg99wK5y3LWCE+2HvrSB/taEGT0TJJu8tVLinrtLjsn8FOsXyCFrl8mCogxxFljTlV9kg6FHcMM36wsfn78zmaCYp+ZdKRy4mEPaJhJCKhqumICXMmByjCF3g55udR+kYG2u9uqgduDjlO6snWc412i9XSOYd08x7G1MWExW8YLc2ZD4hPuQHQAMCidBqYF94/PAF1w1GjH68xPEuEu8vdqd2H2XRa+vPGz4Vln7Mz600yRJHC4h7yWrm+mJ6KaLYiS3nCzdiKcTEuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJJ2xseVH62H+qTy/v+7yaqXXNz7cEcu3h49e+gCFQk=;
 b=EfmohupSDq+ehQnMyPmJRd0aUa5DVLjtd2hOEmh1UkvgA0eJkqbsd8GoErcY202copOdMUyg9L7cZlQKzEHbWhuOb2IRjFIDQNZCKbw90Q2QY1yKUW3Qc4VwJCIwuj1rNtaPVjYeNjy/lBgT7jUBevqEUu3DBjTyoWF52ypH+KistH5wZRfFWwbCMIP4cucH2euxPjYGKNlWhu+jryR4dvTm1zxjehS22o8Nbodk3vjlRxGNX84W0fjDYiS2/7mcBIejoyCzxpKKaxx1Uh/GUBtYMRquFvTJqBEZfoamM3mZ6pE9i66cZxnTgq7Owo/DITL9OlL6AunhdE1Gu1sLFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DM4PR12MB6087.namprd12.prod.outlook.com (2603:10b6:8:b1::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.15; Fri, 6 Feb 2026 01:22:48 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 01:22:48 +0000
Message-ID: <cf61db81-be9f-437c-a53b-a82b0232d207@nvidia.com>
Date: Thu, 5 Feb 2026 20:22:46 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 02/16] preempt: Track NMI nesting to separate per-CPU
 counter
To: Peter Zijlstra <peterz@infradead.org>, Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>,
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
 <20260203114454.GM1282955@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20260203114454.GM1282955@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:208:32b::22) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DM4PR12MB6087:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c3dbddb-34a7-4370-3add-08de651e3d2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bkx1SVFDOHdPNk12QXpVaFFsUVZHdG1MdEhSc1hxUjJDdWRaamZybUNBZThI?=
 =?utf-8?B?WmlsOXplTGhDZDkzNTFqcjJSZEQ5dzFrTjdGQnhxQlpWWFZqdXAyWW1yQXRP?=
 =?utf-8?B?UDkzWFU5QUlUMGFBZGlLU0NyOHZKMTFvR0dabHJkQjZqQWVDZktBQjEwWUs3?=
 =?utf-8?B?b0Q1dUdRRTRMRXdSbUFOZ0g4VnRmdWRDVVA2MlpuMGFoMkVwb291SWdRQ2sw?=
 =?utf-8?B?bjkxREdHUnFueTk3cTJBYWhOWjNjOUlWTml5b3hPRzlBdzNEdzJpZWNFbjV4?=
 =?utf-8?B?enpxeGlYUlNtcDh3S0ZrU0hPVzVPS1h5YVBCRE9tek1uTDI5VE1EQ3gyVlVu?=
 =?utf-8?B?Y0NWTXoyaFNFSm0yNDV3RXlLcU1GNEtWUTRnZHBoMlV2TW81ZzBxRVZuZmt1?=
 =?utf-8?B?cGhNVTFZOVVlb2ZlMlV2ckVob1EzOUMvcGtMUXpZMi8xM2YxSm1SRnBKNEk3?=
 =?utf-8?B?MWtKc2RNWTdmLytqRExSY1BqSzEyMHNSQ054eGJYMDlCc0hnV2pKODhTejlD?=
 =?utf-8?B?WWVjMnV2VHEzaCtUWEZOc1ppTS9icjMyU29IUm5qdlB2TXV3VHAyRFZnWlk5?=
 =?utf-8?B?RWZpa3JocDJYc1hxVzRxZWN4WE9xR0pYaitNUU5KSkhOaVlxdEw2T09rUWtx?=
 =?utf-8?B?clhPWkNqNk1STS9LRlhWeW5mUERSV2lxdGxDNzhId1VxYU5nUk1DZ2JUVjlm?=
 =?utf-8?B?M0wrbjlQYmRWdmN4bDEvNXY1T09IdkN2RnY2a1NDS05KMm5hUEVPWDZ4Y2pI?=
 =?utf-8?B?OWpvTnVEU0tOZkFrdGc4WFV6K0NTTEFybWxRNXkzT3hBRUwyZVNqL1dObHJq?=
 =?utf-8?B?cnRjNElIalRyL2t2aW1FYXBiVHh4UlZsTTFuUStEL1h3VE43STZvMEdaTkhI?=
 =?utf-8?B?R3A5KzRJd2RyMjZWdjNjVk1RdmlEUFBSbmU2NXg5WlRBWFhQeDBzYlRjSEhI?=
 =?utf-8?B?dFUrbmpmNGUvMGNTZHZuOVozODFrdXFwL1I1N3BSc1Rjckp0NlVrU2JOU29Y?=
 =?utf-8?B?aGFFdDMzaG1kbnZQUHp6TTIzZDZWRUg5V0E4UmJDUWFIVUdRaXJRK1pGN25M?=
 =?utf-8?B?WDdsd2JpSWVRWWJCK2t1anlMemRGQTF5Z0xacWl5d2grU3hZN050VGNETFdi?=
 =?utf-8?B?a1lVY2VhYmlTamJ1eEs0MkN2bkU0dkJ1S29KelRXeUhPeVEraHpiaUxJODRj?=
 =?utf-8?B?aCtLMGs3SG5YMnA1UnpHOXZNNDRxRElaWDR3N1lLTjUrN3dUd3d0OEJPWDND?=
 =?utf-8?B?aXVHZHpqdXh2MllVT2cyaGtBMS9xaEFNWFVvZlhpcUo3Rmt1MEJDd3JRZWQy?=
 =?utf-8?B?NmF2TnhwSXpmUHJMRytnUGZtY0JhSjJXdDZ5MmlRRHZRbnhOUHh1LzdCUmxC?=
 =?utf-8?B?WkxVRUdSd3NNSEZTdnBUdlJCUGlPVy9uQXdqTThvRFdGMjNxR0RmVmJqOXMy?=
 =?utf-8?B?Zkp6bUtUMGxEWUUycVNDa2gvanJiNFRleXR4UzJ2SEd0ZmRkVXpSYmJZd29v?=
 =?utf-8?B?R2cyb200WTZ5Vko3QTNHL0REZ1BaeEk2c1oydlNBaER3Nno0Y1NpMVZkSnJH?=
 =?utf-8?B?WjBIY2hPREFsMlRWTEpxMllCZldxQkM0MStFdjVEQnkySk5lM1JSYnFGR3Jj?=
 =?utf-8?B?Wk1WcGJDTmc2Q1YyMlZ5TmVFdjJsK2J4RzZOdmYwdHNIZHZMQ3pkQkhiMUlx?=
 =?utf-8?B?eUx5Nzg5VXE5ZnZUZEJNdVNsRmVUdnFpeXRlV0I3ZUp3UFRNTjcxM21tQkR0?=
 =?utf-8?B?OU5Id3MxZ0pzK1Y3YXBmeTR6RXhBSk9NazM5MSttMDEvWU1QaWl2UHI1TTlB?=
 =?utf-8?B?dzZDSk9sdjdiaWxXQzV2VzFHbTEvSUtXd2tUcnpPV084UmlXT29NSjJaNUti?=
 =?utf-8?B?WFRUZnpHUXRnSlo5cm8rVEFWMzVsSVhvcVhvbEptcDVzVXJGTWY4NUJlOTgr?=
 =?utf-8?B?bW9qeG11UjNpUFd3cjQwME9YWklJOVpNdStRUTdFdHFzMlBJQisvYkRCVzkr?=
 =?utf-8?B?UTFHM2xOUnc1ODF0VStmR1JJQk5md1lPcGNpTGZPblNiZ21zRnk3eWNEcjNQ?=
 =?utf-8?B?SVBIWGhqcWZhbk1nU0VyOStpRGJZN1FKU3lCRzlWem13eHFKd2FVZ3RlQmRL?=
 =?utf-8?Q?R55g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFI3Z3dZUGhGU3RFMlIvNlE1bGJMT0hrUVlNTzJtOXlQeXNZMCtMdEJFajc0?=
 =?utf-8?B?b3dSRSt6N0d4UTVGaEtHQVdnKzI0TmZqWEVrYU9YMWRqV054YkFETzEyOW5W?=
 =?utf-8?B?VlkyS0l3TE91dWxxYnJ2Rm5qa1I2MmxVRUpOZEdadHFXZTk3ak84WVZwNS9n?=
 =?utf-8?B?cnB4cG9rOHZJS0JzdUd0ajMvNW5QbUxubXVibTNTNGxQT0FNamo1SlpzOE1u?=
 =?utf-8?B?cnA5MEM5SG9ucWFXU09Tc3V2bDJ6R2IvQXVYNEc3MCsvT0szejNnSWxPQjhi?=
 =?utf-8?B?aFh5VTMzdDJDYkszOGxZMWpvbHBlY1p2VTdseXhJTDBacjdMZWFFRm1YZHMy?=
 =?utf-8?B?c25QT2syQ0YwcWppd0FRRnQydUZ5aGM5Y0taY05iaGhyVkl0RGV0dWJpVGFh?=
 =?utf-8?B?UVhYL1g3aXY5dVVDcW9UNDhFVHBIVXBYSFZCeng3cUdaUTNHSlhmMTJMUnlr?=
 =?utf-8?B?eHlKaXdEMVlWbnB3NGloV1pLdDdvc2gvcUtMbS80NEQ0RUc5c2g4Z3dvQXNQ?=
 =?utf-8?B?YVNCc1JzaytLdlV5QnpyS3lhVUd4RUlrNk1MbkwydGhudUtXbHFvNkoxSU1v?=
 =?utf-8?B?eDJhU1hSNjZDcG5mM2Y5RkM1WndSS0srWVNVTVJia0VVbitrU2pzbUJ0R1lq?=
 =?utf-8?B?OHU0aHQ5dU1JblFsV0xYZXNaMVNyVTdWZVpHVzJTOU5lQ080YWlma0VGSE81?=
 =?utf-8?B?dVN4dVJ4Rm9BQzJnN2VKbzdaSVhRb2VZSytEYWkyQUZWcVBOd0RGVUdubUJm?=
 =?utf-8?B?UFFPcXVoTjl0V3VQWkVEL0ZkN2MyaEQ3SkplMlBNNTBoditHb1VadEp0SHR2?=
 =?utf-8?B?dG1scCtRNDg0RXlLTDVLSkROdC8yOWhiWkVtNDVIV1pDSnBYYjdkb3JmNHBa?=
 =?utf-8?B?bFBKOC92M3F3elVFcVZBYjJiOHA3cml0TjE2alZoZ3RLeThsc3dKNXcrVjlo?=
 =?utf-8?B?L1Q4SUh5bFRMeHNsRTkvNUpmeDBNQy80TkJPY2dIZXFpSjloT2cyNW5rNUd4?=
 =?utf-8?B?SEI0ZEhtN0crTmNtU1lyZ3RQKzg3ejFTL2RrSUxhYjh2V1p6b1hLZlJUMi9J?=
 =?utf-8?B?RjlVU3pLZFpCTTg3b0hDS1Z3TktkY0ZjWVJoVVVrZmhXajdUNXZ2b3EvdU1O?=
 =?utf-8?B?NGlnam1ON0h5cFJvQUJ4OGQrV2RjRlZKbGJLS292VmtndlhSdXFOTUJTVEpR?=
 =?utf-8?B?YjhmakZPMmFCaEp6T1VUY1BoT3lJbUZLbi9wYy8wdjd6aSs0TkJYOFBDdGlo?=
 =?utf-8?B?bEpaeVNwUXVSUkhsNTlqd3BWMFVxWUpVUGJmcXdxRitlcnlBZUIyVGF4UUN4?=
 =?utf-8?B?dUcwOVJFVGplT0N4bXVueFZmeElBbmU3czd0dFpiOHFNTGVmSE5iVjFUOFor?=
 =?utf-8?B?SUYrSXRMekppK0ZxOXIrd3NwRmo4NmE2Nm9KUWVpRlBPanFXYWFkd2toZ25r?=
 =?utf-8?B?TXBpMVB5dkR1WDJweGJ4M0dlUTBqNGIvalpUNytlZW8vZlVQM1Q0M3NTaWxI?=
 =?utf-8?B?ZHVreDZOcVE0SFM2Z1EvVTA4YytRS2YxUFZOUjdMekIyd3dMUHZJcUdHQkp6?=
 =?utf-8?B?Nml1NG8wbUFBYWlKZGN5TDhPcklZSzlZV0tXMTd2MG1qSHFYSTREbmJrSUls?=
 =?utf-8?B?cjlsMGpucERvTVd0NCtQUDdic0VxKzNKWUpZblRxNjBvemhIZm9KOVBHblYx?=
 =?utf-8?B?Ujg5OHp4YXhFZWZlNkx0Z2RKeVRSbHdZM0l4SWM3Um9zTUc5NzJZdG50WHND?=
 =?utf-8?B?NXpxL0taQVFQN3lLa0NMeDk0bTBmeVZtRkFhSGJuN2VuMVJWNUxldzkxMStP?=
 =?utf-8?B?QTJObkVXTXNkVGdUdklhK05vclhyV3paR3hjTzhqMjhQM0ZqMXF0M3lZNm5s?=
 =?utf-8?B?UlV6VXQ1cHQxUTFGcTI2QklkVG5relN6RklhMHA4USt2U0o5WERmNGdZVm9F?=
 =?utf-8?B?Ymx4dVdqZ3lEN2RNaElsdjd3THR0SkZ3dkk3TkhjSytINThhT25vajlnS3ZG?=
 =?utf-8?B?Uk1yT21EVmY0L0FKU2pJcklVSzdVVHI2Mng4WFJvU2g3MnlGQ2lxakQrWnlZ?=
 =?utf-8?B?b05iRk9HSGxCVHM1TTVhL3BoeXgyQkV3OEw1YW56MzhPUzZ4UUtsbk9TQWRZ?=
 =?utf-8?B?eUF5UmE5azc2d0Ryay91djdHNkJwVFAyNEkxUTRjeDJwbWVoc29qdGZKMDhZ?=
 =?utf-8?B?UVJVWUxUckxoWCswVnB4bWh4ci9teFdMNURRR0xmYUhKWjhoK2o0VmFXblNo?=
 =?utf-8?B?eG1sRjc4Q3R0d2grRVhQU3ZRV1FCU2JBYkZ3a1Jva1gydC92WHVxcDd6OG5K?=
 =?utf-8?B?RjA3VUtDRDZKRnNJRGVmM0VsVU1DM1dLMm5HVDRHWnMySVhmMUh4QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c3dbddb-34a7-4370-3add-08de651e3d2d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 01:22:48.4483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oyRXJ5sK6nR07GrJNrhIkpRwdwtGer0tLIytNhuOV/kMRyIeNDUq73hErCRqzLL11vMuEU2M0xerZHdXlaGurA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6087



On 2/3/2026 6:44 AM, Peter Zijlstra wrote:
> On Wed, Jan 21, 2026 at 05:39:05PM -0500, Lyude Paul wrote:
> 
>> diff --git a/kernel/softirq.c b/kernel/softirq.c
>> index 77198911b8dd4..af47ea23aba3b 100644
>> --- a/kernel/softirq.c
>> +++ b/kernel/softirq.c
>> @@ -88,6 +88,8 @@ EXPORT_PER_CPU_SYMBOL_GPL(hardirqs_enabled);
>>  EXPORT_PER_CPU_SYMBOL_GPL(hardirq_context);
>>  #endif
>>  
>> +DEFINE_PER_CPU(unsigned int, nmi_nesting);
> 
> What happened with putting this in the same line as preempt_count?

I can try to do that again if we still want to go with this patch. When I tried
that last, I ran into issues I can't remember now (the space being limited?).
