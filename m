Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013003.outbound.protection.outlook.com [40.93.196.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F04423ABAA;
	Sat, 22 Nov 2025 04:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763784913; cv=fail; b=cvytQ/Q+BlH0eJqqOwizxQZNkPIyMUPEKRvdfonyxvF7ZGt8u2GfCJeiTKLho1VhHBl2sVPoR5KKNClvgjXACfyf/pQzqApZ0e/WQp7Mh8vyWpGy/en696hvJsISCHsZB760enieEPVT3JyqSKK3Be0GuRR9onNJ2cZTlCBLPxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763784913; c=relaxed/simple;
	bh=Cs2SoKe6FWmzXYjOHgN7QqPyqqMI9CFOrwhGC4hZM6o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PaKnx1LVpvnvKRacQ74WPSRbQ19Yx3mV+Ks2aE6usuAbrACpdH0EelILTSMhT7ei1Uk8/qpJqlq9jaO3XVr2OFOfxv99ug/CVQTzxO/pgY6ANCXF40EhplUrakhKb7bLOW3m+XBU0V7KdBhBJAWPZpvprGZMAC1TN88R6Xwewuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KBK/1/47; arc=fail smtp.client-ip=40.93.196.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KBK/1/47"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJ6wNmq1W2EBxWa0wGwPyxMLHLS/jLxfQpFmKZ69k5ZqXyE7zCY7Jcge2SuWJu/+r5P98itXattLYZ+AczEe3VYieXIEmPTy/OyYDwH/t/R3UdY6DLam9gAp39VHYIdfU4UhY6AzWJTlabP32Tn6DEblXd3ktbiKo42MxUlmgmxIVv5YRJZM9ENUK7ZJ77/sy/rBbJJk7juQbG4qy/wsznmpCTOlsrMyDWvJh+pzXexmnK19eRYaAbRw8nkZkrh+bGKbz/f6Cp1v4kUMxrXR6uxsa7BwC4kfXnVigkLglFYDCuFA82wQUNEcRDERFBriHcjG4j8XyJyTzVih4j3ujg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PufiuLX9ejFhCUkABTHkni4lACJ6EgMekGyHziaawW8=;
 b=Pz1VPCO3jFQ0pM363tVjlsdHhEeAw6INrxX8bjo1bNlhbbBapJwTNCnayms/iPJ+pEnPcJlXYPX4fKpUy3RIsvGgBIT/Rx0MRUiIW4iWhVPE5BOfuoFdJpkCjcEQG2EtPPhZX4Ius6xtc8VySrYbVXe4DP0VybpnxL4Wsj7jS1l2jgUuS4kfvySYbzTh2sS8o941mSN8YFVtKdIQsuIXWuKgvucNxKX+JEPMxKHwZ4JBFuMbZSOkD18VWyybLHjaTGG8bDFWpfkgUlkiQunLspPWMZ80dBVxlgk735rlP3GTxnoQflswHBuNPr1u1NWO8JzeyjysgtSUCAA0XXVvug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PufiuLX9ejFhCUkABTHkni4lACJ6EgMekGyHziaawW8=;
 b=KBK/1/47Yg9SBU6yzxb8Hj+Wf0XjGCLxkJSSgiIIO457uemiuIROvOFV4dYCKJEpyf1Lc0pt7CEw9a6sE46yR9SERmQoTLaethkKnvAwrZkdJX/nEEMgCqFbS6rDhujaS6Mfo5t12cHQA0EIM3tlayjpnG3/TQWCeRXT/FUxfGPfuAOigOMJGN4ZQI/gvatS9KOpSHc0Tys+HXFzw62D+RmaakEoEisIrYa4I9KuluoLzDhPWqO1D29hiPWXKz3joxOx2G8EbJb0Pa5jNR6H+5k2iGYPyOfaKP4URipqrIfTih5ptaOUQ9SUYZbGM8ZSQ3P/drYK9x4w02ATwG20Yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CY8PR12MB7362.namprd12.prod.outlook.com (2603:10b6:930:52::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.17; Sat, 22 Nov 2025 04:15:05 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 04:15:04 +0000
Message-ID: <b6c7eaeb-34a3-4927-b4d6-70aab3ce1c46@nvidia.com>
Date: Fri, 21 Nov 2025 20:14:59 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 00/16] Refcounted interrupts, SpinLockIrq for rust
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>
References: <20251120214616.14386-1-lyude@redhat.com>
 <4b6ae41e-5cda-41ab-ba4e-628bdf23f917@nvidia.com>
 <aSClxW6jnspFRHMH@tardis.local>
 <49d7b2c0-9794-4997-8bba-78891f27abf0@nvidia.com>
 <aSEiHgI0PIprnIC-@tardis.local>
 <e11bd713-2404-449b-ab63-7d6c0dc47b4b@nvidia.com>
 <aSEvj7tDNLF-8TIy@tardis.local>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <aSEvj7tDNLF-8TIy@tardis.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0006.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::19) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CY8PR12MB7362:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a05ac18-d076-4954-5d76-08de297db687
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WlA0NjVvYno1WUJGVitBamU4RE0rbHBLUnlucFdrb2JGSkJsQ2JNL2JLZ0tC?=
 =?utf-8?B?alM1bVRJY2xlUG1mTUc3UURnY1puNm5maEttTExXaFVGY1Z2dTNCL29VV0hy?=
 =?utf-8?B?VU9DdFpzdVFmclBxZDBzUjB5WXlFbC9xVlp0bHJ4WWFuK2tPa2RyQkhMWTl2?=
 =?utf-8?B?UGozQ3ArNG9rTjcrWlBWSjQwTVBnT0ptTjc2Z1d2TkRXSGpjbTFjc3pUNE16?=
 =?utf-8?B?VmxDb0RoRkZmSTFXMjdjbE05eVozVU4vandTUTlwQjF0TXJ2STQvb1krL1Ja?=
 =?utf-8?B?eE5XTk1mV0VyV1drQW1yYmlqRUNCLytuTmlHcUd5S1lpSndLK1QveXRFRzNJ?=
 =?utf-8?B?OEVjWWhJRyt6dGFobHV3MXRXWlNCSEFUM3psMkJodjhuZzBrVm5UKzhkYmdZ?=
 =?utf-8?B?a0F3VTFpMlhDWlk4dkp3OGZ5Z3dZUDRobEJKK3ZXWklMeDdvQnRnT2NtREtD?=
 =?utf-8?B?dkNIWURJVjN0M2ZOV1ZEWENYb2Y0NjgxR1AvUGRhZkVlK1pMcVQ4L29EZXE3?=
 =?utf-8?B?NFQ1OUJYSytNWXBWeXpUNzZzL2gxczBEazdYeTN5TkQ0ZStFTEhnbEVGQ1BH?=
 =?utf-8?B?Y3lVUTdFYXpzYUhBK1NENmVYcGNtMDd0QnY4TS9BUDBDWmRlZkVLeS9MMC8v?=
 =?utf-8?B?TGNacmlqSGIxUmxzYWNYNzA0QlU5b1VkYjZ3OUpHd3RKNVdKbWdkb1EyWkFj?=
 =?utf-8?B?ZE1aTDMwaEI2MThISEEvNUlGTWlIQ2RPSUIyemZHaVJHZ3lPazVNa3ZDaHhv?=
 =?utf-8?B?Z3N0cDRCTnNEanRVQVVhZmt3dGcwWGRnZWpVdGc3Zktsc21oTmIzMEh1TmRT?=
 =?utf-8?B?Y1pMckdydUtTSUxLcFZRek5UQTlRV0M1NVBYYUZGVGdRSUFSalJnekRSWnlO?=
 =?utf-8?B?dnVZN0ozV21sSjh5OVZlVi9DQjFnY0t3d0ZaVVRNbFFDbGFZSWVVZFhIS25Q?=
 =?utf-8?B?cVFRL3FKbHEvWkgvSjlMYUpQNGRzckhHbGU5YVBUTFNDNUYyVU5SSUc0b0N4?=
 =?utf-8?B?VE5wQk9sVE1ZY1lLMkVtTXkwWlRwK3ZrUG1hejgzRStKaUNwd05JbG5rMjZy?=
 =?utf-8?B?RjZFV0tpK2g3Wk5IdmsrdVRIYXI1S2FZL05JL2lhNU15UkZxMGgzSCtRdy82?=
 =?utf-8?B?MEY3elZwWUdHY2IwNmZCTU9TbGpnVjBJQkU1Z0lLOU5TUFpLelMxSEJlSVBz?=
 =?utf-8?B?MTdRYy8wQ1Z6cW1CVkp4QUJNa0hQSi9BTDNHd0lJZjh5MXBKREFac0owc1Y4?=
 =?utf-8?B?YmNKZDNmNWVESVBhMlVkT1pibEhEanhyWDdxcmFtYWdmbG5INW9ubTdHZnJY?=
 =?utf-8?B?bDkzeU9lcnVxTXNDcDlkcWdVSDlrKzNwVXdYUm9uT0Q3ZXpIdG1sUnZ2bUZT?=
 =?utf-8?B?cUJDOXM1S0JMWm5lbzU2WnZJRS8wVGRxWndubzByQ3J6L0xMcXhNVEtZdVJv?=
 =?utf-8?B?MnByVXFZYXpUVjF1M2dERittZC9lMDI2NHhlUlk0ZWozSmtHcGs4U2h0SGpH?=
 =?utf-8?B?TUE1TkVMZmc5aDZiS1BYS29LZ2ZBKzREeTBNN2lLaDhzS2EvSThzZUg1b3BI?=
 =?utf-8?B?c29sQ1VweGNlM0pVbEVuMk1pWkhWZnJIZEVGT05sc2dQWC9CbGQ5OUp0akds?=
 =?utf-8?B?aW5FMUFvTGdIN08rWHBCY05taUdNYVUvMXZka2NSNTE0eHM2a0lwU25STVlr?=
 =?utf-8?B?T1d5d1FySmMvRGtTZHdPNm9McDQ0aGpoMlpJdlZqR3dKczJQQUtFWjduSXN3?=
 =?utf-8?B?amJsaXZ2b25pcExJMEtCYzZPS3FoRUhQTDRvcHgwT21rd1YyQXhFMmQ2R3Zz?=
 =?utf-8?B?akNBaFVpYllad3FRWk4ycDA5TERRMWJYeW81ekZkM05UVUFrc2ZVMTVLWDhp?=
 =?utf-8?B?VFl5VGRTaTFYVm1VNFl6OCtlVHZNb1pkRW9UQjNzWjM1RDd0QXZBeHlXVmRC?=
 =?utf-8?B?aDgzTVpDbXNkSkhGNHgxYVR1RS82dFJLMEE0R1R3cEZVNUJTK29KWnVtNEww?=
 =?utf-8?B?MWxUU3JmRzh3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1hsb3B6bldoN0xxbzFWNHd0L3YyRHlLTzhoQ0puTTFHTkRpTDhhY1ZVYUZW?=
 =?utf-8?B?TkQ0cnIzN2lYdDN1dldzMlpUZGN3UnduWmp0NEZCR3M0cDFDS21NSzd1OHI3?=
 =?utf-8?B?THNqY0JrRFBBd3RNblhrL3l5UDEra0Y0bmZkV2x2TnN5LzZVOWpkMEp2aWpH?=
 =?utf-8?B?NkJDQ0JNNFlQUjFRYXl0MlpmOS9tL2ZOMWlTbkwyVU1MbzNtdFhUbExaSE9S?=
 =?utf-8?B?Q2ROOFhvaVNoOE1zVlUyMml0Y1JsUUN3M3g3bEZZOWdRTWhYTmRxZlNVcWl3?=
 =?utf-8?B?T3dRZGMyU2tuRGx0MU9wVXdtZ0c5QVZsOUE3S2xQWHZtcy84c3JpVVh6RWw1?=
 =?utf-8?B?VG9GNXdmTGdnd3J2V2hXazZSTkxONm5VbUl5NnlqMVp5NTlDY0JRSlVOUVNQ?=
 =?utf-8?B?VFkwQmhtQmxPTlhDTXAyU3FKNnBReWlJZlJudGYveEpUdXMxckNZZHk1bFZV?=
 =?utf-8?B?bWoxMkN5YTZUTDQ0Um4yeUNpbmpNTUxORWFwTDlqZ1B2RGZUaEtVMzBQOVYw?=
 =?utf-8?B?S21jczF0VGN2K1hYWnlWR0d2dWRnTjJhQ25VTkwydDE5NnVDbUJqVHJScExy?=
 =?utf-8?B?WUluNURGTE1GeXV4UnpUMWp1dzZjKzkxZzFrNTlpZFpIT3ppV0VyU2dtNHpK?=
 =?utf-8?B?UzUrMXlWSWFGdGF0TVpYQkxSUHhhZXFDaWowTzNTVUoweTY5ZmZzQUlUTWdl?=
 =?utf-8?B?ZEYwUnhDbDZBdmhqa3Bmdkh3bzc0VDhINm9kbTFQNHVjZ3R4ejhIbXpaVjZO?=
 =?utf-8?B?NUNmRENNZjRWeUtzNWZIRVNQS1JPYWtVSS85VnUrOERUYUtBNlAyQnJIbktE?=
 =?utf-8?B?SlJwV1F2YUVzYklZbnpIQ2tSbkh6UUxWOEpwS2xhWCtIRi9FOFFaSzQwdTFC?=
 =?utf-8?B?RHJYTEZCVVFXN1pTSkE5Nm1aMUZBa2VUR1czejZGRjhqWHNWSG5BWjRKcGpS?=
 =?utf-8?B?UlNNVjRSSzFUbWhtalczWmUvZHNkMGI4Q09YcU91VjlrVTFlb1lRaXk1S2ow?=
 =?utf-8?B?dmtsZ2cySXFhTUEyQXpDTjFVR0Q3dW15N0RvTlZMTW5TdFpqNlZQNU1UbDht?=
 =?utf-8?B?VmE4em82SWlYK3BOd0ZlMG1uR3FQTnRHQUxRdzRsV04xaUE3aGJsVW4xWUtP?=
 =?utf-8?B?eEhndUs2MWYrTk5mU1V2emhCeWhWRlhDQ1pzWnFGakxCSGtTeEpQM3NzQVpH?=
 =?utf-8?B?UkVnWE1FWllWZVAvS3g5M2FnMlAwWUZmek1SRFU4clEwSzhreHBkdytkeFU1?=
 =?utf-8?B?M25rTEd6dnczc2FoL1RtZ1paZHZnY0ZuUnh1cm9FQ3JIVU9JWU1qUjJWQjI4?=
 =?utf-8?B?Ylc1Z0JJWE1vbjFYWE9LWVoxK2tJSVA2cUF3ZFlOb3VTV3JWUUFTcDFjbmVj?=
 =?utf-8?B?YVdPNlZCSmNBOXJEczJ6azNhVnRNN2JNNmdGWSs5SG5PbTRMYjkvdEpvdFRQ?=
 =?utf-8?B?YmQ2VVFRWVhJMGMweWxZaVFDRUpLWjlvelF3SzZyOGtwV0grQThzREVoSjFV?=
 =?utf-8?B?RnJ2SnJ0Zk13eWs5cWVuRUVOZDJuRFRsNHdLanM5QmpqTktmWTBHSUNGcTNC?=
 =?utf-8?B?emQzSEJzWCtnd0dnSURiVjFZdnFiRjViOWNYWEE2QXVkWWNSRDNndFR0TUps?=
 =?utf-8?B?b0tiTXZ4TkNpUzdWdkNyNk4raVBTQmd2MEp0a0tHQml0TlhEOEkwZTM0cWJO?=
 =?utf-8?B?WnFDd2NDcHdka3FIVXUvZmt0b2t0S1V1YTQrMGVJc0lCU3dJQzdrVkR2Q0xB?=
 =?utf-8?B?WVByY1FvV2oxdzlhU0RZcXBuanFHTDVnZDN5c2FSQi9zV2ljbFhNTXZOYmNV?=
 =?utf-8?B?N1haL1FSUTJibFd5cWxsMkV3WDlsemo0SldvYUFKZThMbnpkQTdKcEtyUnBV?=
 =?utf-8?B?SmJBdEhQYW9zcVVMUGNrY2hZb2pLYUo1MUcySjVLWVV1ZFNUVkl6b3crdEM4?=
 =?utf-8?B?ZC9aeUlFampGYURaOE9obnBmakYxWEdEamVWNkIvcmxsWnZ5SWtxOWt4ditw?=
 =?utf-8?B?RncvUUxhMGtyc0tYL0tnVjZsNEpjUkxQK01YME1WcU81aEI4Skk1NWRBeFlw?=
 =?utf-8?B?aE9RUVFHNndPWm9kWE5Mamg5dnB4bS9XaVVyTkp6L0lRdlMvQm5xZ1FjbTBV?=
 =?utf-8?B?eW0rRHVLWGZoeHlGd0IwdEpmZ2FQU25VWEhKWlZBZCs4dzV2U1BYNnY1MGtU?=
 =?utf-8?B?MVE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a05ac18-d076-4954-5d76-08de297db687
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 04:15:04.5672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHOMgnxruT/bu9fJ99WkLX7Yw0LgGlwxFpDlYj3wV/+1zpN+CrxMi2Gj8XNkATzgI4xEes2A+pFfXCefGcL3Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7362

On 11/21/25 7:35 PM, Boqun Feng wrote:
> On Fri, Nov 21, 2025 at 06:56:28PM -0800, John Hubbard wrote:
>> On 11/21/25 6:38 PM, Boqun Feng wrote:
> [...]
>>>
>>> Last but not least, safe Rust is preferred, but it doesn't mean unsafe
>>> code should be avoided completely, if we establish some data that shows
>>
>> Perhaps we need to be slightly more precise. I'm not sure if you are
>> referring to the usual practice of creating an unsafe block, wrapped
>> within a safe Rust function, or something else?
>>
> 
> I was referring to providing an unsafe API for core kernel
> functionality, for example local_irq_disable(), and then teaching how to
> use it correctly.

Ack.

> 
>>> some unsafe code provides better performance and we have clear guideline
>>> for the particular scenarios, then it's definitely OK. Hence I don't
>>> fully agree your saying "Safe Rust is the whole point of this project",
>>> to me understanding how we can utilize the type system and other tools
>>> is more of a realistic goal.
>>>
>>>> Is 3.6x longer really something we are stuck with? Or is there some other
>>>> way forward that could potentially provide higher performance, for Safe
>>>> Rust?
>>>>
>>>
>>> Well by 3.6x longer, you mean ~1.3ns vs ~4.5ns, right? And in real world
>>> code, the code in the interrupt disabling critical section would be more
>>> than couples of nano seconds, hence the delta will probably be
>>> noise-out. But again, yes if 3ns turns out to be a bottleneck in the
>>> driver, we are happy to look into, but you need to show the data.
>>>
>>
>> So this is what I'm asking about: given that we *already know* that we
>> have a performance drop in the micro-benchmark, is there any reasonable
>> approach that avoids this? Or has a less noticeable impact?
>>
> 
> Lyude had tried another approach [1], which uses an unsafe public API,
> and doesn't work (easily) with CondVar or PREEMPT_RT And that eventually
> triggered more discussion about a better API design, and as Thomas
> pointed out [2]: "Stop worrying about mostly irrelevant low level
> details which are not relevant to the primary audience of rust adoption.
> We can worry about them when we replace the scheduler and the low level
> interrupt handling code ten years down the road." And I agreed. The
> current implementation is actually quite efficient and should even
> out-perform the existing API in some cases as I pointed out. More
> importantly, it utilizes Rust type system and make it easy to use (or
> hard to mis-use).
> 
> That being said, if anyone has a better idea, feel free to bring it up.
> 
>> I'm asking early (see above: I agree that this is "premature"), because
>> we have early data.
>>
>> It would be nice to explore now, rather than later, after someone shows
>> up with detailed perf data about their use case.
>>
>>
> 
> Not sure I fully agree with this, given it's to my knowledge the best
> solution at the moment, I feel it's hard to justify the cost of
> exploring a better solution without a real usage. But then again, if
> anyone has any better idea feel free to bring it up.
> 
> [1]: https://lore.kernel.org/rust-for-linux/20240916213025.477225-2-lyude@redhat.com/
> [2]: https://lore.kernel.org/rust-for-linux/87iktrahld.ffs@tglx/
> 

Thanks for this context, I hadn't followed the earlier discussions,
and when looking at this v14, it seemed to gloss over the performance
implications (they were linked to, but not discussed).

I won't further harass you all about this, let's see how it goes. :)

Optionally, it might be helpful to include some top-level notes
that justify the choices made so far.

thanks,
-- 
John Hubbard

