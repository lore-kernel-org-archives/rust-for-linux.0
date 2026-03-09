Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012026.outbound.protection.outlook.com [40.107.209.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F963DA5C5;
	Mon,  9 Mar 2026 15:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773071049; cv=fail; b=AejS0i3lCoBjrek3q9qDFmphfdPcOcJvTMyWWVNmQwq/g8HU+et6CfxjybEwjDyj2ABUhOM0LA4TVOKl7QxFbHWmIR+SXPIDP4xSdSvmY9Y748Luhxe+QC0CaUxOrLMcgsBsnt6qFQcco/u3ic94lBk0+IAklrTeG4PYMI1+rGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773071049; c=relaxed/simple;
	bh=7DIfs7pvF6faG5VNQRmeDd5bTsizHXXShDqO3jDuSqI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qipYZHBPkUMnP9fOXxrT3SIarZk9UinbYOso+AKiReADucneYMwoOR3FWifmY3cMV+ESHxlW8ShOOvHLwMiqEYrsDnzD9bV7nUKuxSQx8nSo2KMyBXnUX9DcFO1LlxCDNXQ9jTgl5DvAFqJyYAtTLA2aWPn4ijRDxWD0qWvkXB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NNH1gnua; arc=fail smtp.client-ip=40.107.209.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NNH1gnua"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=StPLnACekHkV0wUW7001Q3lT37RvF7aDSJW9pTKRKixMWHioaeJ/NxkToBRTIM+/29j1R1FBXSpMvhIlN+/QiqWLxEPwQjA6lfIMwIiulAatdiX2gex076E1kUSUWixaVsLjJRWyKugKZKuhvex3JpgbKl0fBqbRA4pvmWxW7myhJlGOj5DwOrXSb8C1lrruakuBaX18yoOkAnUYXNoSWhWK/6qi5xeMqqdukfToNa75k0+0254TR6DiOCMw5UgE7FKJoTd8JHs47E5AOr0JzTyCUrhCZ9nivh0175uykZ8N4ev6KvO98E2ZJcS9hGZp5k6zNC2Wt4SjcQWyo9EpGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0vz+iMpR134YJ7bE9PPNTDLmh9Wj8Hk7MxhTDCF4pA=;
 b=QcJHfQ/V61p7Cw/j+tEywjCFuoxePoCyKGHAcTwG17A5dqDRVfvo44BCT6Df0BTkWTH87Eia5YbjmuLXYaVLirRQlitklbBBmxhzNli5CZEIDhsiyyEslemxKTnH81xDNEVjvXruno0Fj4R4Ii1uP82BE+gPzgsBdK7MzbTOigBc2xRLER01kWe1ivxOzMJgZJcoOPVj9hkn4pL+Xy+swQGu4rIwAbXHovvwKRInvIXRnkxiDbdNCXxIxmnFCCWhFL6xTtXU7y73PO/s3hB3aI3pLyZ6T7rA3ZjzwPE2RvAYI0FnuaaS7Y8MoR23LYNPKtvlQtyExN4Uz74JvelBKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0vz+iMpR134YJ7bE9PPNTDLmh9Wj8Hk7MxhTDCF4pA=;
 b=NNH1gnuayeE01R3XvsSze7x99VKuR1fkuvGsgKQUPYOk7aJUJvSMyT0gXUCrtpJFR+EDsQte81aDxQYP/eO8oCLdwhfvEn/32wJ18VNOteGDu0gZfK6NM58xDJScwfOp1LZccnX/eI0Jl7VkRTokXXJXPOth8zASANzw222hV7tWjQZ8I6l3x/o+T52anRmxrrgqSYRquo776ljfFtix4izKRxeqNc6zzj112UjZ637VXfOQ5FgXTR52xaAtSP+qJLjrvLdaTxOKfzOCxHBa/kJsEr/9t7h3SYChhIbp6dZa/KKRS4+Go20vDzyPw1GH9R65oe0t2K62V8hJKTMmtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB7202.namprd12.prod.outlook.com (2603:10b6:806:2a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Mon, 9 Mar
 2026 15:44:00 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 15:43:59 +0000
Message-ID: <3f0329e0-6718-4a5a-958d-4a8fa263e879@nvidia.com>
Date: Mon, 9 Mar 2026 11:43:55 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH FOR REFERENCE v8 10/10] gpu: nova-core: use the kernel
 `register!` macro
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-10-424f80dd43bc@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20260310-register-v8-10-424f80dd43bc@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0152.namprd03.prod.outlook.com
 (2603:10b6:208:32f::16) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: 86620765-28f9-4f95-825a-08de7df2ae63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	70rJSTkdK2sItcivVcmlNQTUICf2zFWlxeeIBq5ZzCnv8lJ2nB0odvKygINIFnQXIdo96vDVkm4qE3wU4UIbQfXpvmLNxLRzLqbpjvAWSZ6svFrCo6HMJmE5oaP0yGW3syfAVMnoWW67J8NEg5aS3sKCT6Jafglw5rWDXndLkuethoevGUBs7DHgDeivc14qzAj91AepomK5duiKfHZTBQ2XpXjIu0Ic5UPM23HoPVfiVwAua0W3ZCk2t97OQcYGBrUPqOSfBnsvXUKzkZxE7xz5GOx/9pj5ixonuF6+sEuxl7KSpDecrQYOP0unaBncMdDwGElm6zSLA9EeGs2Hz0ccAiem8b/B46HzClswHdqt+nB398G5VGWfsnGQAClTamJI5TfOKXjrterisZfwwZzrdRDutkYW3wTltizmeAgb1ZQV1JhBsOvT9wQ+7zf2Nc38BOpCzJ5IrFKL5AqJxt2LRhCBziZ4dHY3neWQajZAGAFGKkGUrxONcd6a67ZGOWwmf4TkZzGt5cDj1mjHFsXP8F4VXfVjki0QjzgyzWfLD+R4/UPf5rO7ACTnIIKi3u3khrKbdFiJDIlfdCdzH34ZKaJDyOM2Qki/kavETSSjXEg26MV+X8zWKlgv4bpE58DVEEeZN1D5wEojKR24LcUh8Z5U2S7tIRMxIgx9C17CusJg1dzUQw37LbtiR3RMtXGEWCbD5F3uVDh/qcnUcpXKKv1ofLAGoSBxUYvqCikjIPlHTYZrh/ivm37MqQgnKO8bZsVDtreZGZpVuZXpQQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnJlTWxoZHlZTXJhclppRk9xZ093YTR3YmNsR3ZOZzNLOHlNQjZXWmxGakpm?=
 =?utf-8?B?bXVpRTVnSEh6UWl3SWVtYlVoeGlXSXBDWW50bzNmZ1ovRXVKcnozSXN0WHNW?=
 =?utf-8?B?aURlc1VkRXZNNGRpRmRCV25QSmZvSCsyRWxyeG9VcnVsU05sMFBWZ0drRHlU?=
 =?utf-8?B?T04zSXBneklvTk1RZHBCUnBieWdOYjhTcndkOEF0ckRmR2JHL3B6RUdnQXBq?=
 =?utf-8?B?TlBtTFliZWhrKzhHZHFzMnV3NWwyN2JldVRuWUVaWVdSSTh1bFJwUVpwMElv?=
 =?utf-8?B?YjlXd24rUWN4cnRxQkt3VklPeHZLSGpnTndXNFM5K1ZoaDY0cktNN3luWlVJ?=
 =?utf-8?B?MmFrTjVaT0JGemc5Nk81UHZnakFlOXVsbWwzN1diOWZ2UU0xMXFoNkE0WVA0?=
 =?utf-8?B?UlNGOEl6dGxnSUF4SWJOQnp6akF3OHRsem1rejVtVkFzdXlUYlJBdUpJN09H?=
 =?utf-8?B?clBJRmM0dHg2Skx0V3JBd3FzbUk5R2tPOTBMM0ZzQmxsaG54Zk4vQUtROGEw?=
 =?utf-8?B?YlNoRDRQYTFVMFZHQkwzV1M3YTI2cnA3dFZ0YlNpRVdjU1hyT1Q2WWVxSWhu?=
 =?utf-8?B?R3JsNS96WmxaSFh6a09TYzZOUXFpbzJSRklhSmR5U3lzekF3dFJaOWUwYkM1?=
 =?utf-8?B?LzBxdHdaakxiSDExejBwRmdZOEphYjQvVWVUT2M0LzBiVll4NEZkRUMydGxj?=
 =?utf-8?B?SHFXQVdrblRSWlJOaWxkTmhyWm9ZSXBYT3NrcE5seCtER29ZZjdRSUNDUFQz?=
 =?utf-8?B?eXNSMDNUaUZ5VHhUTkNvbk5mUS9QZzkyaS9PaHc5Mk1OVWFCZEVEN1JpVDY1?=
 =?utf-8?B?SzdqM3lTMjgwL2dNNTl2R21ML0pRMEFIbTBhTHBiNDd6ZU96bUJ1SVR6SFpC?=
 =?utf-8?B?Tm93U0IxMDNRS21oWTgwdVdBc0VReS9kakpqVG9ibWJOMll5OUlzdHRXUFRC?=
 =?utf-8?B?RkRxZ0g5bmhIY0FQb1dKbmVqZk1VK3FJRVVwSGJJeW13S3lwUzdGM3dXczQx?=
 =?utf-8?B?M0hKSC8wYm9DT1JXQ096bHpaZUZlY3hFWGlPcFJESDdVVHkyeFBlamRhWU16?=
 =?utf-8?B?Vm5rMlVqeFhJUjZ0MlN4eWx3RFNuckhYM0dFV1FCL2NieThKK25uNVZDeGFu?=
 =?utf-8?B?dkVJOVFJcGxyRmlLWVBENVJqQWpxTWp2aHlpd2ZPa3NUem9Melh4TmxTN2d6?=
 =?utf-8?B?LytyMmY1c2NNdkpad0lLM1lqOXNLYVZXbXMyQUl1YXV6Q0t4OFNpRWQ1OTRh?=
 =?utf-8?B?OFhFb1dhZnVLeHF1ZzNxOGwrSkZkNWh2OHB4cE4vQktmT0RUTGZpU2VxT3VK?=
 =?utf-8?B?eDUrak41eVRPNlFpbXVCYXdVdWhDUSsvVXp6WjM3WXpQUVdJZmRNTUE4NWUv?=
 =?utf-8?B?cFBSQUlIendyVkRLRzZrRFVKQzkvMFJ2VzBjeGlrdXRqTE13TUZDYzBUYVNz?=
 =?utf-8?B?cUZVSG95Z1ZMU3loVmdlZlExRUw4cTB0Vm43ZTV2L1ZvbnFKbm1aUEJGS0NC?=
 =?utf-8?B?YjRYb2lkdTdIcU5kbDFSWjBwZnlEVVU0bExidDJCL0o5YS9vSXYyOFEyR1Ru?=
 =?utf-8?B?YUN0WG5oKzBaWHFDcWRKaTZsL0RKTm5QeFgxRERxMjZycFNLTVhrMzVIdnFP?=
 =?utf-8?B?Z1FPTlBrZUZsOFhZdyswOGVud01CbEFITGtUaUdqckNGSDZIVlRZcURFMDR3?=
 =?utf-8?B?dzU3WXpwbEtzY0dVNVVrcnlzbEo0dEFoRGp5ZENWem9ndkY0VWRHOTJyRUpm?=
 =?utf-8?B?QzBwaVFXUFlQL0l2UUFXc2Ntd3RHNHpMNGo1bEZ0aTQyNHRadGcvdHBWVFFV?=
 =?utf-8?B?ejg2RDZuSzNtQWFPT2Q0T1pOMHp6U3haaGplb0JFQzFZV2pIT2hQMWFhc2Rn?=
 =?utf-8?B?azJPVFNWM25KemV3MTFndmtwVURBMVo2MlNGWGpsRFF0cFhJN1RvVkVzaENr?=
 =?utf-8?B?L014YlIyMFBrMVg0U0JrNHMwWkVjMW5oVWwwWlg2QVBHYnh2SWtWMnNhZy9N?=
 =?utf-8?B?MHVCNUZLcnlJNXozL3cySm5hRUc3R0kwMkwwVG1oWVIzWWxNbWQ0YWxUanFw?=
 =?utf-8?B?Tk03QzdDcHVWblBHY3dTdmd0U1l1VzZ1djVDelRzVWdFQU9kVDBPSERFOVNH?=
 =?utf-8?B?MjR3c3NQUG1jWnNDQWx3b3VkZDJTdzVRazNTL05QNHc4QWxrZmlONklsWEpI?=
 =?utf-8?B?MXdVaUgxZksxMEdrWVRTQUdtM0w0bkMzWkw1K0c5ZjJiMWNnbnFETFh3bEwx?=
 =?utf-8?B?UURFczc3aFNQQmN3MkRSdVBIcUM2QnNzNC9iV0NqOGZFeHZqRS91SnJ1UDRj?=
 =?utf-8?B?N0FoVWZpTjA3Z2w5NzVuYkpObjJZZS82eGtGQnNwZlZtSUluQS9pUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86620765-28f9-4f95-825a-08de7df2ae63
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 15:43:59.7220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2a0+69niArPkGXeEoHHcBJYu3fIfmcvyZdKwSU4w4px9bpJwS/I7DfehSOy6WVmX5qparPCmq7hInM1gI9vM7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7202


On 3/9/2026 11:14 AM, Alexandre Courbot wrote:
>
> @@ -797,26 +792,30 @@ pub(crate) fn start(&self, bar: &Bar0) -> Result<()> {
>      /// Writes values to the mailbox registers if provided.
>      pub(crate) fn write_mailboxes(&self, bar: &Bar0, mbox0: Option<u32>, mbox1: Option<u32>) {
>          if let Some(mbox0) = mbox0 {
> -            regs::NV_PFALCON_FALCON_MAILBOX0::default()
> -                .set_value(mbox0)
> -                .write(bar, &E::ID);
> +            bar.write(
> +                WithBase::of::<E>(),
> +                regs::NV_PFALCON_FALCON_MAILBOX0::zeroed().with_value(mbox0),
> +            );
>          }
>  
>          if let Some(mbox1) = mbox1 {
> -            regs::NV_PFALCON_FALCON_MAILBOX1::default()
> -                .set_value(mbox1)
> -                .write(bar, &E::ID);
> +            bar.write(
> +                WithBase::of::<E>(),
> +                regs::NV_PFALCON_FALCON_MAILBOX1::zeroed().with_value(mbox1),
> +            );
>          }
>      }

TBH, this is quite a readability hit, the previous was much more readable IMHO.

Why doesn't the previous caller-side syntax still work?

thanks,

-- 
Joel Fernandes

