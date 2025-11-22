Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011001.outbound.protection.outlook.com [40.93.194.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA09C2BEFE1;
	Sat, 22 Nov 2025 02:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763780208; cv=fail; b=pkQOMDXnXZyIOwKnTQGJ8ZxiKjzzny6wLJDHIwvhMc6ad8mgGf57ybUFBDfjmeJvuLEcR43aNlrm27uwBP+V7/L4QU7B8JXGAZZYq52RVO94DJVqp4nc6hNoIKqCA4/t/ksF1OgnZ29rDvBD34fYgPwtAzM05butcDXfKGii574=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763780208; c=relaxed/simple;
	bh=kFT3/EjfQ95Bb9MDx2qMrGNTOi8WAeXV5MQkMYAqROQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o7JJVm58NU/szXCc1gQAKKruQXvEnrlbrxgoTga2I7aj4EVWBu00pTHeYhtIhK9UcnbE9Zr2mKEO8HpJdeExtWJQwLysKrEWXypMvFhRWWdiULippn/Ip/BH6zssbx9xRfkuL9piUzpTlfG0RZMo+Fi3kIyO+vjaXb8L3U/s+CU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IwgEKeMF; arc=fail smtp.client-ip=40.93.194.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IwgEKeMF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wGqmEnFxDtB4O5bLUTQoXX911rqsLCUMbVZuOXpTY/nG7aO2BmWNMIdTRPLpMVhmb5Rd3w+g+2byk4GrF5UnVCHhprUpvkPm6q3A7v5QyKYAGExU5BEcmQcDG+PEEYXptL9HXWjX3BXZxEveCszZB4mFTrICogQkF3EZmlFP2MijJfkUzX20PalGPB2nyIRl2htRou9sd3W/1hgGF4NgrKiBxUWk5n9QCCD6WxrypYWc7FCJO1q+N6d5p1XDBTTKd8KhqWlO58UmGvoEnDFHZrtHqgT5GziuuPCGVcBMnelIAJYilTPJLKfX2DNdCgPPZN7OX4QmoXruCkXmRWjr+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6VGA9HVVy7TZSfdqTFtI7rs8uOSulB9bGZp9X+0HqY=;
 b=aC8MRTa02O75Ix4vLCT4c0GGOeUqyrsWhoRiQY6CDRL3YEChocOXUdfhU+7g0oDYjIP3KS+tPvcIvux6iCwuWlaf7eES0MUzjA+083If+/8rhC/KjRKPxZeEmgsYA2blChroBh8ZQXBwerUCPMeQ70e0cpyT73apcpfh8xz3+RUiNYHmEwlaU/38BrK1ikkGzbRbK1ov4+BhNAPKtDs3ukhsTt+pjW5H4HiCQOqS4BP5HzPR8ADa5zQbgA7jdQsoxtx5trV2s9u1WurfMZf0d/WpJvMwQUdDD0O8aJAmO9NJy7a9BMlkp7lLlskAOe6ePXJg2kcJsJmWy+CDscQIxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6VGA9HVVy7TZSfdqTFtI7rs8uOSulB9bGZp9X+0HqY=;
 b=IwgEKeMFAJq2LRZKEuxY5mb/eEzozCVtdjBFp0rWDvr0Jo/m4Gona4f1Xjw1kaMfQ9nyMAwsQIDesJPyJGOUatdoaY3O1/gKV5VXadPAi0XDG6LWldYf3/EZ39TyyaqKg6XyWtD9kPvUYAT71TY0IVBV9Vigt2OHFCZL6S4EGKd2bK13sG+Y4RDQW4qtkRGByEBeUck9xoI2mhDrRyQEULSjJWFumsq9oriKf5Ku5u7HG2DDZX+BF7GxgxyVvmNb67SC+lFLzuGDvTLx049fmBzrV2bYuHhzNQVoyU/HnR2gEkP+RN9mdpwrtPbq+ebxdlQiAdSadIv6LF6Wj7FZYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB5747.namprd12.prod.outlook.com (2603:10b6:8:5e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.14; Sat, 22 Nov 2025 02:56:44 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 02:56:44 +0000
Message-ID: <e11bd713-2404-449b-ab63-7d6c0dc47b4b@nvidia.com>
Date: Fri, 21 Nov 2025 18:56:28 -0800
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
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <aSEiHgI0PIprnIC-@tardis.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB5747:EE_
X-MS-Office365-Filtering-Correlation-Id: cf5af013-182a-407a-d828-08de2972c4c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MlVMNVZIRjEva1g2NkdCUXVWZXVPNGNjT3lUcTc0Wk1QT2kwNDBpQ1NIWWpR?=
 =?utf-8?B?clllMjUrc3JjYmM1clBLMXRUYVYwL3lMcGlBQjVxdmt6V3N3TU5oNFBiYUth?=
 =?utf-8?B?dTllc2xlOFhCYjZTd0g5d2JnK3hEV3I4U2RxVTBaZUtHOStsZ0dqY0FjVkJV?=
 =?utf-8?B?M0liOEJVVVZnYThKQkpYMVpkbVBZc05UNDlDZHNHNWxwSVZDVmFMU3lISWpr?=
 =?utf-8?B?ZEdnc2ZXNlhNOHdXclZad2lOVHRWS2NlQVUwZkFwUjR4amRsNjFpeUpHallu?=
 =?utf-8?B?YkJEbFJwNXpLd2htMGJ0VnA3Z3N6M1BlOVk1RUUyeHAzcmVyZHZDcW85c0J5?=
 =?utf-8?B?ZlByK09nU2h6MTBYeGM5NEIvcnRiTjdoTEZQUllkVFBrQjRjU0htVW5PRktU?=
 =?utf-8?B?U3RRTkF4VTM1NzcvZ1kxU0praFgzdTRLWFRsRlRuZUZBNTNSWitMdnREQTkz?=
 =?utf-8?B?bEZrZVFWMU03Q1h1bkpWQnUvZ3l1UVJEL1ozM3BkVUgvYmRGOG00L2oyOEl6?=
 =?utf-8?B?eTFNdDBjcnl0VjhjbXFCMVlST1ZsQTF6QjBQbjIrcHFkdm5GUFRIUUJpWW5X?=
 =?utf-8?B?YUxJbE5SU1Y3QlJwNUErc3EzcnBzWnRaUXZZT2cvdkJsZWJYbStHMFBUdkEr?=
 =?utf-8?B?aGFnNERtbXB3ZDNQQzVIblgvVDFnRmpFTEgxalBhYUZQS3pWVzVncDNoMFQx?=
 =?utf-8?B?NG9UY1pWMUk2V0FQMmgrd3UvRWd1WFJHaE54YTZ5d3MvaHVuSjVJY0ZvNlRO?=
 =?utf-8?B?T2ZvNWE0bGlZcXkxWjRCelNSQVVJY0pVY05KbzlKd1E3dm5VQktFRVNFV0lN?=
 =?utf-8?B?eFBWME5qam9WZjd1UzZEK2VQakN6RnlveTRqbWwySXd0N0l5U2RmWHZ3eHRa?=
 =?utf-8?B?a0pYMmpod1FTZ2gvT2FPOHJJdkloYUVzOG9FbFJiZ3RzVEdMMlM5MlIwdmIw?=
 =?utf-8?B?eE5HUUErU0JXOWhhdElxUS9UOHpzUEtGV0gxZ0NGTW8vKzJueGFUOGM4ZzVC?=
 =?utf-8?B?dWY5MjJUa3hzd2txSHRjSm9UQ0VvREpsM2VhWU14aUpMa3lwQnVDNjI3bEpP?=
 =?utf-8?B?d3VjT05mRzN1ZUo5c0ppVnhPSDNTREg5eklWaEE4NkM4blM0emh5VkVvaWkv?=
 =?utf-8?B?am52NmpVZXFvSi9PTW91UzVkSFhLN0g0SVUrY0JPZURZWFhHbFJPWk85TVph?=
 =?utf-8?B?eEcwRDVkMHptZGJGWlV1MFFENERuRjRxZENyUXFYQ3k2K05mS0txak9ZTHJB?=
 =?utf-8?B?bVdFMjRmZlVzQkRYMGF6bG1hWkZKOUE4RUZ0THZ0K2Q2YjJTcFQvWGhJSFY5?=
 =?utf-8?B?dzFyY2lvdlhPcVNmQmo4b3ZRdnhhb0R4NDdwUzVuTnF6eFBMNEFkZ3BObTZF?=
 =?utf-8?B?dWViTnpwdFdqQTJlcmlueE5wZ3RaMU90VytIOWoxbm9xZlRQQzRHVGtEWDE0?=
 =?utf-8?B?Snk1bkFUa1d2L2hKYTR6Mkp3MEliOUVFbUNOSWRDenlJbERVNklVelVYYVFU?=
 =?utf-8?B?Z3ozMncxeXlvRzV3ZlpBWW5QOFltcmk2VHlJOHVKSHlzR0xZelRDVlplOHla?=
 =?utf-8?B?OHNEMWlqWEtZZDVlZWxUT2tRUVk2YTVZQ1lvMDhQTllZWW44NWpQemFzaGJj?=
 =?utf-8?B?QU5OazR0ZlNFbEdhNGhiSXQwT0Y0NVFQMTJXVGVNVzZtWVIrVXgyRHJpcFR3?=
 =?utf-8?B?YUpXSTRBcEJuUmUrdDFVRnJhVEFFTG9ZWGpYd2JhaGplUGtkS1M2eVRqRFNK?=
 =?utf-8?B?SXUwbGMrckxyTTNsWkk4TDhRTkxQQmU2aGp6VVkxT1BMK0VadjVHWGw2NWdk?=
 =?utf-8?B?OWVYalQyMGdiR3k0eU4rRzQ5K21ML05YRTNKZ1VjQUY3UTdpSzFxb2VKeUwx?=
 =?utf-8?B?azIrREo3VEpkL0w4d2h5SUs3RWtwT0JoNU5NdUl0STZpcmZsLzlJQXpuajR2?=
 =?utf-8?Q?Ff9SYc4w+z4AxlT+X6fq5s/yUuWl2U5d?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1B0NDR2QkJ6TllURXI0N2lEZkU4ZW5Mb0FmRG0vb0xVWlBsckRxNWR3ek9S?=
 =?utf-8?B?cFg4b2hFSS9vcjlHMGFxeEYzNUhKY01PaU1hdWltdzZkeEh5QjdlSHI3RjRX?=
 =?utf-8?B?bzFZYmxkZGs4S0ZKSHBJOCtGdEZZejAzZEQ5ZC9iWUQzOWdqWmpwdDFJaElC?=
 =?utf-8?B?K0FIdVY0bUFEYnJKU0ZPRWdzZDl4MDlDV2xyOXlyaFFwMnl3SFpIdTMzSHJa?=
 =?utf-8?B?U3UwTVhicGo4OW1YRFNGcDVoT0RqMmxlSmU3NmpDRjRkcHpRZlg3aXlKcC9M?=
 =?utf-8?B?MTZoNE5aeThaOS8vZm1yRDZkeWRhVEJKcFJqN25ScHBVLzgwUU9FcFFnUTFV?=
 =?utf-8?B?b1pudk9mbkkvMExFR3MwclRPdmlDRjRRWXB6L3BlWmVBYU5qL3FmNzF0QzZC?=
 =?utf-8?B?VU1seFptS1NGRDdsT2RpQjRGS1FNRzlwSGV5SE4wU0ZRYm9wdkhEYnNra05F?=
 =?utf-8?B?RlU3d0Q2TWhyWm1mMDV2eUpqR3ZoMkJ4YUpNN3pYQVM4TWxuTHN5UkFUWE9G?=
 =?utf-8?B?STJ3cjVjMkdwcUgvSkJYQWJTVVhDd3VvVE4zK3lacUxPcjRKSEdJVlFuYXZ0?=
 =?utf-8?B?dzhCcCtpMTc4dWhKSmg3WjhvUEVmdFZtSXdUQisyVmd5ZENpYnI1M3JBZnRj?=
 =?utf-8?B?M3hGUTRZdUZZVGtTSFFBeElJN1BPOWNtdVh5NjNXZmJBUlBnOVMvaSs4RGs2?=
 =?utf-8?B?WFdINGIyeWhPTEFYNnJqd3pEWlptaURQMEtXTXpGT0dGVTlpWm9KdzlNajNx?=
 =?utf-8?B?TVVuSzlQM3ZDdGdNaFJEMklMT1N5ZWtNN3QvVG1SN1ordmNnc2MxQWpuQ3ly?=
 =?utf-8?B?dzYwekE1UDVrWmcrVStsaWF0UXJ6Z1UvL2V0YWh0cmtBR0xKdlU3QXZjVjVw?=
 =?utf-8?B?bzJ1ckZaeS8zZThQYm4yNWt6M2cvMEU2OHpXSGN5cTFpZE1MNWhyV1VEYkpI?=
 =?utf-8?B?Y1hJUXorVGozT00waldPOFJLU3FvRFlsSnBraHRVYWtVLzBpUGZlKzR3dDhJ?=
 =?utf-8?B?MXdsTGRQWk44STZldzRUUisweW5TMThhall0TG9LekIyWEo3SHNnSjlDWFpm?=
 =?utf-8?B?TVREZmtwY0diRSthNHRtZFhkOHozRTQxck9PTWdKT0wzQ0lOVUp2b0oxYmt6?=
 =?utf-8?B?b3NBejVKR1hSSGNyaERGUEo4Q2hsWitZTFdSMnovbWM0d2M2UXdpRllvQ2RD?=
 =?utf-8?B?MGRKTGswN1Y1bGVVTGxTczl4dmtHdS9wWXM5NU1Ja1lvYmsvMTBVT1dpb2RO?=
 =?utf-8?B?T3BMaHd5RUdxc0JzT2dIYUJaNFdReG9LWDR3bmZOaGFRT2d4U1JrQkREejhz?=
 =?utf-8?B?UGZtTlRmdHlWbUlDRzh5MjJxRElDREo3QWk4VldmdGhESW9DRGxsdHkrNHNw?=
 =?utf-8?B?YW4vM0F3ZXFxclBQSFcwc3BNS2U2d2E0NG0yZko2MDUzQUFxSXZadHVNR2tR?=
 =?utf-8?B?bjBUWDZ6czJsL0NEZ3EwVDcvSDgwcWt2SUpOVXJhRnhEMG9SWUpZQmJyWHN0?=
 =?utf-8?B?Y3FPZXQzNkZvOXU1RFdtd241UUxoTThCU3RWZk9sUVVvWG9tQmxpQjJHNCts?=
 =?utf-8?B?a3RPemJnODBPelRBTjUxOGhkSzh3WnVUY0NSYXJIUmJxMWJjSEF2L1VYTHoz?=
 =?utf-8?B?aDNhdWNtTS9nOElmN0Z5ajdYMHpoT2VkQXJRZmc4ZDdFSUVVcVYvK2JydEZq?=
 =?utf-8?B?MmdIMlZNKzA1eVlhSDB1ZTB4clFwT2gwb3oySFEraTdDZURKME40Yi9WRW13?=
 =?utf-8?B?OEpXR3dpZUpORjhRSUIvV01GMW9EYkJSSkFjRzFaS01Uc3lEUWozYTl1RDBo?=
 =?utf-8?B?dW9YZVl6VnFsSkc0NVBxYk1KcW1SNkdMdVNMNURxMHlqTDJaSlZHQm1VUVlo?=
 =?utf-8?B?dHFzNnlvQ2Rxa3BqOEdEL2VSWjBBU3d6ZWhVS1NCRnN0a3JjZ1BNOEp1UDhW?=
 =?utf-8?B?ams1eWlETjk0NmFlUlNLZDd4cndHUFU1Q3BYKzNUenJxQ3dLbWsvV0RVSDRn?=
 =?utf-8?B?ZUdEWG0waTN0MkExY1VIa2p4N2VqUHBINEwwTkxPUlBOMnZncU9xOUNGKzVQ?=
 =?utf-8?B?T3RNV2tQSXJaRkorUnRjcEQyNW56ZWNia1Irbm15WlpzVVEvZ0JQV213aXdI?=
 =?utf-8?Q?TGMUXNlfW6JcA6g3s++Gv14RR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5af013-182a-407a-d828-08de2972c4c3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 02:56:43.9319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBoW9fCSAhXE8c8dJODPk3fkibfymkv35rmi9FRbZoSIwrko/weHMl7nS9jkc1oULmhIoDZ7QcVFUfjNSre9Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5747

On 11/21/25 6:38 PM, Boqun Feng wrote:
> On Fri, Nov 21, 2025 at 05:09:24PM -0800, John Hubbard wrote:
>> On 11/21/25 9:47 AM, Boqun Feng wrote:
>>> On Thu, Nov 20, 2025 at 03:16:04PM -0800, John Hubbard wrote:
>>>> On 11/20/25 1:45 PM, Lyude Paul wrote:
>>>> ...
>> OK, but there *is* a performance difference between Safe Rust (which is
>> the whole point of this project, after all) and C.
> 
> Again, this is a premature statement.

Yes, it is. :)

> 
> First of all, the safe SpinLockIrq API is made to work with other API
> like CondVar, there are certain design requirements making it being
> implemented in a certain way. In other words, the cost is justified.

This argument doesn't apply directly, because the response to "Safe Rust
is slower in this case", is "the slowdown is justified".

Perhaps it is, but that doesn't refute the claim. It's still slower.

Maybe that's not a problem at all, but it's not yet clear.

> 
> Second, one safe API being slow than unsafe code or C doesn't mean Safe
> Rust is slow than C in all the cases.

Yes, we have already mentioned several times that micro-benchmarks are
not the final word. However, they can be an early indication of a problem.

> 
> Last but not least, safe Rust is preferred, but it doesn't mean unsafe
> code should be avoided completely, if we establish some data that shows

Perhaps we need to be slightly more precise. I'm not sure if you are
referring to the usual practice of creating an unsafe block, wrapped
within a safe Rust function, or something else?

> some unsafe code provides better performance and we have clear guideline
> for the particular scenarios, then it's definitely OK. Hence I don't
> fully agree your saying "Safe Rust is the whole point of this project",
> to me understanding how we can utilize the type system and other tools
> is more of a realistic goal.
> 
>> Is 3.6x longer really something we are stuck with? Or is there some other
>> way forward that could potentially provide higher performance, for Safe
>> Rust?
>>
> 
> Well by 3.6x longer, you mean ~1.3ns vs ~4.5ns, right? And in real world
> code, the code in the interrupt disabling critical section would be more
> than couples of nano seconds, hence the delta will probably be
> noise-out. But again, yes if 3ns turns out to be a bottleneck in the
> driver, we are happy to look into, but you need to show the data.
> 

So this is what I'm asking about: given that we *already know* that we 
have a performance drop in the micro-benchmark, is there any reasonable
approach that avoids this? Or has a less noticeable impact?

I'm asking early (see above: I agree that this is "premature"), because
we have early data.

It would be nice to explore now, rather than later, after someone shows
up with detailed perf data about their use case.


thanks,
-- 
John Hubbard
