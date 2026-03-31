Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012063.outbound.protection.outlook.com [52.101.48.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F533DEFEF;
	Tue, 31 Mar 2026 16:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774973876; cv=fail; b=PAk80M0YlJy1cZHdvZTZYzuHm/XlOfRqEa/1iZzkLz2Yq+w47ODeUwBMIqGvEeMIj20KuA8CDvyWFuRuFiLQdc7uAOJq88kn1a7oSZSAGvivFWQO4UfreOKeySnPzmFyifx51frbl6alCAjBLNEGhKNXb8YSHpiGOSOcqsPlqsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774973876; c=relaxed/simple;
	bh=DJpwzTAOeodLtn0z86KoDKnUpVOlssFQBcwEHI2w5sM=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IvvvYr0DAjMhH+t96wbetPe+j6Gl0NNzF2UHU5RqgI6ZSX/8/qXUmSuYJsq03nnjdQ/jekxDBeO4VNA/43OcyYCrmnm4mXH4RrYK/nsrhx/0aoRblMQtrDjECoBHaTbowRpaOYhc4jJlzVqqY22hQ7GTYLWj4KLbd2BrnBjukoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FBAVqmtV; arc=fail smtp.client-ip=52.101.48.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FBAVqmtV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xAuEEecmBhr6Dp3FHWslXVmtaiGT+wxo2bs0e8XgJL0mFThUNk1eDsEWV6KEHbalN2RfQMsL0bikqNtHDqtW6aqPJVgirLaCEfg2N5GBU8kyX3C/qlNtdGMUfF0sTlAR+fGsurj1zjtsPZodPaOIKEAxwGmf56ixBxtzfEPntZPBxjMbYBWHO8nWNDs+uS9h3ck+unKW70t2H12ZFzC87e7f7y0BYp0SIBc7LZl3iSahKkx+1YC71a/On4QXsjCMBCyVHez7tN2CkYwrjo3yVz6insThWq6sfk5WM9rIoYgMtDbM9X87bJa4AHL7bw/0VxFxmBntfyItsLtEr70iNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAz0+vg7D3zbCQ4R1OxLNWLwKBjrY46rXJThbv0W4o4=;
 b=n6osn61l6hgGPNf5krj7DPSVFi0Vq1vub68mF5SnMCD48GSebY7Np0mpeUvmggYT4JPhbiv7YEJGHaKiMO1EevfLaDly1M+odHQzseeTan+zbpGd/v0JUzjYN+CKXTxLQqRjpl9avaOQ9WkgQWNQLwD+SRciqVRGwZu3q/K7vY4pw3dHkbDKrhTI4p8Yiyb8SydQPoacWYR4O7xX4QUwjDU55+NJp3dSVSRgtGUnKI+M+ldxSwQcg0LOgLzR8H/lTDrcdORPxJqVtNQGbcxy18J389Xnb2TtGRl+AcONiQ+k2vcKJEgXiVWGkXD4QB8wwpOYhnRdeRuO68r+rTR7HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAz0+vg7D3zbCQ4R1OxLNWLwKBjrY46rXJThbv0W4o4=;
 b=FBAVqmtVDnWUok8eRxKJcHwpFLIQ8+DycV36cQLA2h95rVnguDeJkNFKCdBKrVmNvQpr3x3o518kc8nFiJS4xYeA5kiFCVaYpvf5IEcjkxDwAqXFZcxR/0mXs1jKwUtqA3EmjfeC+kqxLdxLvuo/hDlPJFWGK0pEVQcaRctjiGOC5v6HMKddGamobA7AA+yUA0w6J7XO7O5Rcx7TsfzBPB0DU3cMTm8baokhBd6F07qS98xL9khhSWsA77NWOyVRgpfQf272/VZ12oyEeGqgEj5cRJ7S9b1hgoeQq8R7WYAT35pzhK1gFXM9A0vhxKnD5+DQLJqwbUjm30ZHOfgWLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 MW3PR12MB4377.namprd12.prod.outlook.com (2603:10b6:303:55::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.15; Tue, 31 Mar 2026 16:17:51 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 16:17:51 +0000
Message-ID: <6e3c0858-17f5-41f4-8814-dfc166c0d4bb@nvidia.com>
Date: Tue, 31 Mar 2026 12:17:48 -0400
User-Agent: Mozilla Thunderbird
From: Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH v9 06/31] gpu: nova-core: Hopper/Blackwell: skip GFW boot
 waiting
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Shashank Sharma
 <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <20260326013902.588242-7-jhubbard@nvidia.com>
 <DHG7AEASTW6E.2QTXB1D0GA0UF@nvidia.com>
 <79c3a1f1-50f4-475b-8a56-282289164ee3@nvidia.com>
 <DHGJBWGJVJPP.1HSRO21R5RH79@nvidia.com>
Content-Language: en-US
In-Reply-To: <DHGJBWGJVJPP.1HSRO21R5RH79@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY5PR13CA0064.namprd13.prod.outlook.com
 (2603:10b6:930:a::29) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|MW3PR12MB4377:EE_
X-MS-Office365-Filtering-Correlation-Id: ec21b429-bd1c-4791-4d47-08de8f410e93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Uh0gr+jRf0eygo+i/EPAQH8/f6EqSqdyPAnE3S2vtTQf9yFLalZ+YIN1T3OP5LdEr0Ww2CQa1mtyxL3PAZbi3e/mXVUsVL+L5ym9R525FcPiMXKdZ/6c6NpTYQ2G1mCJ+tW77C0xRp6prh0gHHCiq3WBdzZlqHQ7Hl9ah2ypyKaN5n+RjPySh/uwXYOjO8SpGbHXSIvaie+wAuwyN5etfXJo+STFIwY5nslF0XmPXMPIMiUsIn8bhumGqrEwP1YWm+5aBwliiUUuVmul075KgCOVLhIhxY6w/XEXxbebYNNWRtgq5vIH2WpASI/tbaXC+FcsddHsrREdc7N2Ec8CnxcLj/+nd91yBa49hS32p13YPzp25A0vc92g8rCeGLhgYEbWRcRDMStm02Pq6Ho0dT10h1W4ilACVqNZSwWgMFz/3YYiql2P3qXcMTyRxOuceUaOKcLGAY9c5DVC4GCFEMNC72lJGKS+TIrZ+9oVfg2Svt4XTdr/vgb7zRCVocx4LARKe2YzTfJoWFl3PCoBquuAn29IT8HjUE5rynBqO91IChwtvLFL8DUhKOSnhLCqChJNucSca+sPubVvRR/8tLUOdDgAHZo4iceVfF/JpeyHGUm4cedbFAu03j2+l9dOcyu74/35cNOxSxpzyrLE/tz6OO6I9HgUYOV02RuJGCZPgqYQTZwIev+n9sw2yqABN1eW7FBQkEzJzhOeHBoGF8EdJ+AHZxcXXwIxvNTO7XA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzNML3BqVnV0d1lWQkF6QU1uMXN1S1M4VEhqSElseGhXSnA5L0VydUhMMXhn?=
 =?utf-8?B?ZTJkWTlrbkhvaWc5alQrODFzQWVuaklzS3YreW0xMlJYc2ZDdWxpWmxidkVW?=
 =?utf-8?B?T1NhallEY2tWSXVtUVRnUHVyNVY1bEhnMHc4MC9QYm9objh6a1NXdlVvT2l6?=
 =?utf-8?B?aHdjZXRMdTdHRTBGSXZ1OWJIdjI4QlJTSXlYR3FWTlZHVGtkV0MxcHc3U1kx?=
 =?utf-8?B?RmxqS2JMamNLRjUxT0RCQlo3Q0dlVFVTbFFZOFBSWEoxT3ppZ0t5UUN3czFq?=
 =?utf-8?B?WkVvSlFVRVB6ZFdHaHIraFBlTjNTeS9XRFBaOHlOUzI1cmtiM1JkMlMvV3lh?=
 =?utf-8?B?UEVtWFNMUXF6dGUwUGdCNmh5Uk9YOVBvWU9uQjQxSEN3d09rSlcxWGhtRmpQ?=
 =?utf-8?B?bWJNNjBYaTZydlVHSWI0ckpqTW5FTFB4SmtKNElCdXJKNCsxVTdKdnZMOUcv?=
 =?utf-8?B?MC8rTVVONUVwcjVUNFhmNGdZN0VTWStWUEJYSjNXMXhXYUxVeW9FS3VYWkFk?=
 =?utf-8?B?dWYrenFDQjlxRXR4cGJRUUgwWTNVVGdJQjkxM1hVdmFLK1BOR3g5Z2xXYkpa?=
 =?utf-8?B?RW43T0IxYUZpc3d5TzhYc2VyZ1UzWmoxeWpLZ2ZrVEthbThTQ1RNZ2FxbUNT?=
 =?utf-8?B?MG1BNU8ybXFmVG5qQkZyeENYZHJEK1h2NVhTa0F2QllLblArai8zdm1nTzZj?=
 =?utf-8?B?dHk5VDRSZ2s0WDFHdDYzcnloT09KMXRPcWlJL2RjazZMUlJkV0hXR1ExSys4?=
 =?utf-8?B?b0xFcWpkWkRXNzdSR2tPL2N1Sk1LNlVDL09xY1BGc2JZbVlBN0U2ZzFoUHRk?=
 =?utf-8?B?c2FEeWQxbmFNN0RVTzBjY0o4eGdRVUhBa2Q0cXFtZjFwQnRQbXlZV3dZaXEr?=
 =?utf-8?B?b0tybUxxamlBSHJESlRHcTBJbWd0VTh4ZFZhME56OXVvdnd1MjkyYWl1YWVB?=
 =?utf-8?B?OUUrWHo4Umh2MEFpSFJReDVLZWNrL3NLSXRxTGFjTTFqYnRlUFJ6bGxudldO?=
 =?utf-8?B?bU1SVmI3VnUydkxQaEhGUWlYM2xuRWdUS1dIZEFXQlRBQUh1MEF6bFZzWFcx?=
 =?utf-8?B?UmliU2JhYlBUSGdqRnNqYmJBWEMxSEdEWG0xNVlaMHRJdjNIRnA2YnVTUG1a?=
 =?utf-8?B?NnNnbUlsaWtISHlyczJqdXBEV0Y5eE9IZTUxMTJJZzB3Y0pmT2dkQ0NhWW51?=
 =?utf-8?B?UlVDYld3M1VaM0YxeHgzZ20rTFBQc3BTK2k4T3JwdUE0UHJzemxYWk9oME4z?=
 =?utf-8?B?cVFkY2dEdlBybldlNHFxbjZYeVhIRjBiQmdkZkdESjYySFY5UlorVUw3ZWY5?=
 =?utf-8?B?RWtHNkpNMmJrS2ZWbFlFbjRQUmZtRlNGZTZMakgzd05IZkU3MkNPTEVqYlRw?=
 =?utf-8?B?WGtjeDJONUxWdW11bGFUSXBuZm02TlZzZ3h5YTJ4ZG81aTdjVGZ0bjNjSGd0?=
 =?utf-8?B?Rk1xZU5ldjNkOUQ4dlV1d082Rlg3cjVRK3hwZ2I0Q29mZEIxZm5kcnpuV2xF?=
 =?utf-8?B?WXZqS3pNQXhWWGRMWFc1WThhMVlHa2NRRG1qQ3VMVmJZQ3Z5YS9OY0ZjZlM2?=
 =?utf-8?B?VzYrcnBZSTBSR3dZUjBndmt5Ny9uR1QwOTNrV2lpdFRoUkc5WUNOMmlNVjNR?=
 =?utf-8?B?LzdLanY0eTZKTUxPRnJqYUpaUWVGTnVGaEFDeWh4a3lqd1p2L0hvQVFJVlRL?=
 =?utf-8?B?bURQV1NDZ2JUY09Obm5tbG1URU5HOG5xOFJKbnZ3VHRTNy9KNFgzNnJsMzBK?=
 =?utf-8?B?OUdYV3p3UTBjTjF5MXZ1bC8zQ1ZHcUdjWkxZQTh3M3hoaWpSUFFVcTNTc3B3?=
 =?utf-8?B?UnByWDliUkJ1TitrWU4vcE1RVXBoZzQ1d3pIOXJGRVZ4UUJLSlA3a2l1NUhz?=
 =?utf-8?B?eGE5aDNBamNOQ05LUGJrZjUzZ0hnTS9UUFJ2ZW84SUFNS1QrNDNadjBYTzJq?=
 =?utf-8?B?bHY1ZHZxV2JPK0F3NGxUM3JVeTBNdVc4NGRraW80UkNldmRtUTBRa09VS0FI?=
 =?utf-8?B?NjI1RVFpQUJhR1lRVFVyZjhQdTlnWmR3anMvWDh1UHk5SlN1VUJDZ080K2xi?=
 =?utf-8?B?NGVkOUJJcHcyYmhSSCtaZ0g1TGhYb3lIRFk3RlJSOENhUGFZNGttZlU2VFdp?=
 =?utf-8?B?eCs4bUtHODB4TXI2TFNNUXVjZFgwVzZULzNxa2w5bHJaRjNhTG43WTlEREdC?=
 =?utf-8?B?dVBPRjNRU0JDUyswbWpNTjJ3emYzc3NQeVArR08wcWJGM0ZMTVMvYmJMaTJ1?=
 =?utf-8?B?c3E2dk5Id0ZiSmtITVZqWExoeVJocnBHUDZPY0h4SEo5RmRieUM2WDRqRUpO?=
 =?utf-8?B?Y01oSkdDM043TnBuZVJxSmR0QjJsQ1hVYjIxRmlmVlRieTlhekp0Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec21b429-bd1c-4791-4d47-08de8f410e93
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 16:17:51.6362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDqVEivx0DUsH111zjhyPZS6SoLB+l2bYAy6Xfn8P7o2/lw52hcvTkDRv4HgtPhP2WqxtgKqAlUIHoe6LzFZYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4377

On Mar 30, 2026, at 8:19 PM, Alexandre Courbot <acourbot@nvidia.com> wrote:
> On Tue Mar 31, 2026 at 3:33 AM JST, Joel Fernandes wrote:
>>
>> On 3/30/2026 10:52 AM, Alexandre Courbot wrote:
>>> Please take a look at how other HALs are implemented: each HAL instance
>>> is in its own module. That's not just a cosmetic choice; it allows us to
>>> keep the chipset's specific HAL struct and its helpers completely
>>> private and forces us to make code-sharing explicit. Furthermore, this
>>> particular HAL is bound to grow, so let's split it properly from the
>>> start.
>>> If you do that it also makes more sense to use constants (contrary to
>>> Gary's feedback on v8), if only to align with the rest of the driver.
>>> Once this is done, making `gpu::hal::tu102` absorb the `gfw` module is
>>> trivial, so let's do that while we are at it - having `gfw` as being
>>> driver-wide makes little sense since it has a very limited role for a
>>> specific subset of the chips we support.
>>
>> I feel a HAL might be overkill for this. Looking at the series, this is
>> also the only method. I am doubtful future architectures will have to
>> once again wait for GFW boot (is that expected?).
>>
>> If not, we can just match or conditional on .arch(). We do that already
>> in other places.
>>
>> Something like:
>>  if spec.chipset().arch() < Architecture::Hopper {
>>      gfw::wait_gfw_boot_completion(bar)?;
>>  }
>
> It's not about the size

Simple things can trivially use match/if on chipset/arch, I just don't see
the benefit of a HAL for simple things, and only drawbacks. Even code-wise
doing the simple snippet above is simpler and cleaner, no need separate new
.rs file.

Even if we look at the HAL approach:

Some one reading the code always thinks that a wait is required but the
wait "mechanism" is arch/chipset-specific, not that NO wait is actually
required sometimes. ONLY if they look at the HAL implementation will they
know that on Hopper+ it is not required.
     hal.wait_gfw_boot_completion(bar)
         .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;

Instead in the snippet above, it is absolutely clear to the reader that
Hopper+ does not need to do GFW wait.

> , it's whether the code paths diverge enough. In
> this case they clearly do, and using a HAL lets us get rid of a
> minor module that was at the root of the project (`gfw.rs`) entirely.
>
> I expect this HAL to further grow with the different boot paths as well.
> Not sure if that will happen in this series, but it will eventually.

But just inlining the module in gpu.rs will also get rid of the module?
That's not a strong argument for a HAL. gfw just has one function.

Also, I checked and nouveau does not use HALs for GFW boot.

Other than that, I am concerned about HAL fragmentation (we already have
other more specific HALs like the fb HAL and falcon HAL). So should those
functionalities also go into gpu HAL? Its not clear.

What about other code doing match on chipset -- should all that also go
into this kitchen-sink gpu HAL then? It
needs to be consistent, not "let's put gfw in a HAL because we feel like it
even though we know we're never going to ever have to do per-chipset/arch
gfw wait." There is not much reason for that as far as I can see.

The argument that the HAL will grow in the future also doesn't hold,
since a HAL can be trivially added if and when needed. My understanding is
we don't want to add code until we need it and you haven't provided any
"future" things that will be added to this new common gpu HAL.

Please keep it simple :). The snippet I shared above is just 3 lines, not
new 41 line boiler plate HAL file.

Now if some variant of Blackwell starts doing some custom GFW boot scheme,
I am all for a HAL...

thanks,

-- 
Joel Fernandes
