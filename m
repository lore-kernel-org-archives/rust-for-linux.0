Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010000.outbound.protection.outlook.com [52.101.46.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B08378805;
	Wed,  1 Apr 2026 21:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775079002; cv=fail; b=Nue5TrWPaodinuD1i1sBJ+tQZosfbk+zM/6203/3NOYwQnPg0bDdlpQqj0zNSHKHcWg7EIbxGSWpQit4qB7IlP73k6Qv8c0Q8f+2946LTGBfXWdK7vC5ZDOT/utGMMJ5PM/BYDi5XZm2fCibORoh4Z6LQGQD+PSiP6+FniQCYgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775079002; c=relaxed/simple;
	bh=RK/uIioVFyYFcNMv1aGsRvUs+dVPlBmAa3PfGxqAH+c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=grYfv6IAJOkTozBKdEh/L95TIQYrcKDZ+fspKsMgxTbC+B7uYwr1BdHw8hLPDBACnTpCLhInjLlIbbp/zG6XtU2FlRlUTOTRNWHnrXkTCMzY6j+MhdXXnyA1oE9JdLYu7fC5qfI0014O8hEFguz/LvlvySrM6XITiNVnmvQbkMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uPJSMrrr; arc=fail smtp.client-ip=52.101.46.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uPJSMrrr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cD/mnCuh82ZkHm906cFFogFYC18Mhr5a6AHSZ0bNSW8K2zWWYrAU0H8vxDuRNgSkQcyeUHKU1+3ol1WfU81odA7pBro1hL02EE0LJXZxEJtNEx/dGUGOdCoQbVYdSwIXcrDS66FTRIcVVtsLresMDvI6r3CNAhw854Rc/dIUxtlRsS4HQL2DF9nGyBNgGJHZXcrNTKfit0U0TRIZ+Ngs541opUfjl1LxfS3gENfaC4OgvqwIkYhuby91mJ2lE08udsEzG+rYvu8vLojWKs1I9IPTlxB/D3qD4yDVIihYeROOWXK3pBLG69R97kJ1qoI2MpmtU0Ve9/kldvsqmE21Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPIjEnxeSoIm5kjK8o+tQ7UAUQ2D5Ehnz2AZO2FkafY=;
 b=s3QG9sReqbU4L7Vvhp00QNhq6GH8p2nj/ZDdPF0sRglf+Ea6W5TGYcans4a+w/lcqw8SKus5M74rKyCgCdsp+TyTZK+NC1rOJB3uCI3TsPNWHaSG+ONrRnk/2zNl7FANxtbL0jfAj+soxQhroPzY6PEARF1huV+XkZ83h39iqRgN7HXbj4gSxgV/nmD29BJ8mqYt2GS+ahK2c3rXaEoHw9Ypff4Bhl11EOVjCsamsahVdpmhCg84P5hje8YzY68xXiqJwpdbGnFbgDmPZWR8mxDqShMe6x1R7UYKz/umY4tIPiD3z0KRzTJr8JN1WWkyb0iyru/lYpUV62yT87ZJhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPIjEnxeSoIm5kjK8o+tQ7UAUQ2D5Ehnz2AZO2FkafY=;
 b=uPJSMrrrtHiHesUR4ewyYzZLcSlyhEhQS08ZO5fToDYfal4bJTBNo4MlnTvFBJc5EJqiskTQVOrTgqZy29i4G5wBewWlPMa46jOQ/+50JKhiNjeNZ5KccXnqDMBWIebw9sUt+yhxGZRoASNy8DNO9xhp8MWspIb0kJIrFZ1Seq8ug52J+LnFC4S1qzompcBwWgykTs5j6TqVIJ/H9DBtTGpCK67muTr3nLbY1M9jNr7yl9QtdBOcH/x4UhLXuKkvI7Kf0f4fM91Ttc+F44G2p+FEwchhcsNitnW6JLHZujFXncEPK0RdVRlOR9j10thnuKxXmPZttUgQFWNqrdaCCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA0PR12MB4384.namprd12.prod.outlook.com (2603:10b6:806:9f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.15; Wed, 1 Apr 2026 21:29:58 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 21:29:57 +0000
Message-ID: <4f8e038e-ff0e-484f-915b-3b292cd91363@nvidia.com>
Date: Wed, 1 Apr 2026 14:29:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] rust: sizes: add DeviceSize trait for device
 address space constants
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, '@google.com,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260331224319.107082-1-jhubbard@nvidia.com>
 <20260331224319.107082-2-jhubbard@nvidia.com> <aczpifqz5CoOFB3N@google.com>
 <c42c7074-5f17-4f61-878d-414762461826@nvidia.com>
 <DHI4SCEVOQXG.1LN5Z1S7XYYLM@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHI4SCEVOQXG.1LN5Z1S7XYYLM@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0370.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA0PR12MB4384:EE_
X-MS-Office365-Filtering-Correlation-Id: b0078293-1bf2-471a-c770-08de9035d277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	z8qETTQd9tjFv33z1f6bcSFDQ4EplkCuxx/OdNYePg0uGnDGEUjBOxGxWXyIe93oJQFAGEj200o2QJIFfO7eF65lIp31h1BF2w/W5PrRBZJIeyrAJWh66ahRPNo061NEgE1YwnOWAC58lszWvvwxnH2CnqQsyVmXTTmtvealVg6UdfQZkGT945J6m2fbKyiUmRW2iEVJ5ysxwbWBzAFiYpRPpFUe7ExHfasatYnN88FfQshSVeREW8xr//EDZU72nnmUbM0c3WZ9gaI38wJJxgjMu99gzruLlrk4vhWUttm+Pl4YVRG9BOUEpMQXM5KnSyUpi5GL+bxrOGCP8JP0CtTDwwI6npBbMn2W6Bz9jq5M6vksnQCKOJOxGEfoTdzl1SeyuniHh9s3hZTnvb5oPSzPvZS+o6m2r2SLFk8sGCjxI9fRssa/BpNecFmBn84UFWW9c5Ww+1UmC6D1iw5WEv+0wPRG7Wv0M3iyrXYRMggmfIVBK7gE3M2cvhPG90aRhcncnGo5sXadjauavCiNu5DhtDoDjNf3WOUfT24S0HHZmZSFpjEXCxiqnKIpWwhBEFSb6OSnSLtY6PTAnj85g1R3zhBXjpN20REadNOF2ykN/UoJNs0k2vYBoGOyBDD76OywRDKJ7MapK7N/K5+3XGH177bpyHAX+svAiCEULb6mCi1GlABO9z48NHek9i5UUpyfMI6gE+rHonIl/hWQAq/gCbSWR8+S9xUeA8JeB/M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTVPeUthQk1KYWxKd3Z1djNFbll0U0hrQno1OEt3QVJkVDlPejBvQ09zZEtm?=
 =?utf-8?B?K3Q3ZnhySDgyVmEvS2x5VlNxTGxkcTZtTXZNb1Z0VU1XZlloQ2h5OEEwTDUr?=
 =?utf-8?B?NVY0cHB6Wmlvam9aYytSVnFTUTJ3SUE2WEZKOFlrMXB2RGJJQ0pvNmlJd2hz?=
 =?utf-8?B?ekdVVzcrRHFMekwwWWVyenlPTUhNaERXQXI4ZEphVzZsL3BKSU04VytlVTJj?=
 =?utf-8?B?WEx5Z1RteXNuL1lpQWZJQzlDZlVwSHRRdzhNN1MwcEhONjZxUW01dXQva0JX?=
 =?utf-8?B?SG82V2hSdnJaZk1TSmo5OVAwM2l1K3VEVng2UjFaeFVybWJCdDFlVUI3ZU1o?=
 =?utf-8?B?Tm9BUmZnaXU1cTd4dVg2ZmFZZTJVQmd4dlRSWTBMWWJiaUk1QlJIL0crS05K?=
 =?utf-8?B?b3RPbVpkVWhwdEhick5OVStIR1lSakF4UGVuSFBPNmJ4Zy9qaFpCdXVZTmNs?=
 =?utf-8?B?TXk5V3Q3am02RXlWektNRit3WkpmUDJlMEV0SkFGbml3MFBNN29RVytNM1BS?=
 =?utf-8?B?K3JTWFVtZWM2dlJnTTRSNGk1dTJWT08rVEhPWnFUM3NyRlY4YXQ3U0ErKzlo?=
 =?utf-8?B?TXJSQ2FiSnZHWmpvTVVrd1NTMGhwVDMzWmpDd0JWUFpBb0lNSmx2THN5ajhH?=
 =?utf-8?B?QUFqNmEyUk12bktRUTJJRWdYaFRsQmkwRU96NFZ2WnRWL1VybFhCS1lHKzlj?=
 =?utf-8?B?Qkw5MEdaQkxvamJrU1daeWNGSEpudkx4Mi80U21XQlhVK3hGMkIxNUxkZDdr?=
 =?utf-8?B?V21WT2w0Q1NlYldrZ21FeWI2a3NkSC9WSWdyS2NSdC9qaXo0ZzVySWhVaGpN?=
 =?utf-8?B?YXhnRGozV21UYm5nNTJTOExseWdhUlpiZ1o2b3I2WEthd3hFVlF2bkNpYXZW?=
 =?utf-8?B?eHMxK2N0TUZ2N1dEbFVXTVArQXZIVkhmMTA3eEIxSTB3VXJWOEZsSUY3UnBr?=
 =?utf-8?B?NjI2dGtDY1NRREVKZ0VleEhPc25sUGxzSUdzZUdNQmxhcnVBcTVrR1pVVE1D?=
 =?utf-8?B?RCsvOVp3UHFHVUVhNW5yVWNONlMwWVgxZEREc2dyVytlSHNPZ2laMjJ4Qkdj?=
 =?utf-8?B?ZGtqblVTRHllUTRmcDIxazlBTjdDWTJpQk5nS3dBZFJlbld4UkxCZ0FSeWFW?=
 =?utf-8?B?NER3R0srN0dsKyt3L1BuaFFpN0VtaktMbmlSbWVQOTd1VExKSDVXSFQxWnNu?=
 =?utf-8?B?dmxCeW4zZldEZmVGcGpLTTRwQm54VnJ4UkI3QStFSElGVnBobTZlRlFBWHkx?=
 =?utf-8?B?QlJHWWp4L09YcVAxVVF5eld3KzNBRVpFQjdESEwrS0dGck5DemdWQ2FzTzRt?=
 =?utf-8?B?RmthZWhlZEZ2MXRpT1BDNmpPNC9LUmlJWXZvOG1pOEQwMWhzcWpXcGt5MFVN?=
 =?utf-8?B?WjgyYjFJSzZFblE0Mkl4RzZVUTAyam15NHNSNTNzU3ptQWozeXgreWg3ZHA4?=
 =?utf-8?B?SmJHV2hnVW54b04vdjVtMk8xQ3B0SWx4QzJLRWUzZHM0WlRCenE2S3N6dGcy?=
 =?utf-8?B?MUk5ekNhdm5JREszMmRmQjNHSERsQUpkVVZ4NGJEay8zcnNUQWFFL0tYRkpl?=
 =?utf-8?B?V3hpU3Riem50MWV1UE5mTzhFdExYbml1NEpkZ09YYTVVcEZVRXI2b2kwZnRH?=
 =?utf-8?B?VDVPdVp2b21QRkxOOFpqTFI2N1cwVlBOeFhHdkltWis2Uk1Rc0d6anNLYW1E?=
 =?utf-8?B?UjRTUkUvcnVzWUE2bDRCUWh4ZWw3NGVJcGpNWkhWUGhXTGhwUFRnSHQ5WEVF?=
 =?utf-8?B?Y0s0Z1NoWnRQTzh1OU9ZdGtEWHJ4VWhOVXFTYTJmak8ybFdvQ3BmL2wwbVFO?=
 =?utf-8?B?a2lIam5neFZTaEJYVTNjU1hOdzRIVjlieTF3QWs3QStlUWVuN0dBTGZPVU0x?=
 =?utf-8?B?eHFxa1o3UlMzNGtPV0Z6b0ZJbThLZmkwcUljUTlXOW9HZ0UyeUthUHJ5UTJH?=
 =?utf-8?B?OSt2Yk9OdXNQTkoraTY1N1BLaWpKK3ErU3lxNVVzZ3dRdFN0WDNlMU5mc2JB?=
 =?utf-8?B?OVJMY29RVmNmRk9nRlgyZytPWEE3d2l2TTZnTElNd2NrQlB1ZHVoRGdzTE4x?=
 =?utf-8?B?RVJ5b3J5V2NjUEdlbHZuYU5CNjR3YjhTRGpUcUhabkZ6ZXNUN1NEdVd4OHh2?=
 =?utf-8?B?YmgvdEFjZzlKVVFhOXhtT2NqcXYwZDZIYzY4SUswYWFoL1hPWk0xWFE3NmZk?=
 =?utf-8?B?QXRPMEpYUUY5OXpZanNnRVNJWGZLaksrSStzcWdteVJQakhEQVFHOCthdTh4?=
 =?utf-8?B?RkZqVnppcEZNODJPUnAwYzFFYzQ3Ymx2dHA5ZHA4d2ZhVUFDdjdkNjY0Slc0?=
 =?utf-8?B?eEo1UmdVTGgwdURSY0diNkhVaFdCa01WMmp0WWEwWjFCSDdkOVF1UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0078293-1bf2-471a-c770-08de9035d277
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 21:29:57.4157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Z6mItZ9o6Nketb7mPQXxpHUC8aJcna+f7FNnGGE+NgQlKZqJvAyx6dT2vOJiwugLrd/ZoeRDMH3tudekdkzkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4384

On 4/1/26 2:20 PM, Danilo Krummrich wrote:
> On Wed Apr 1, 2026 at 10:22 PM CEST, John Hubbard wrote:
>> On 4/1/26 2:46 AM, Alice Ryhl wrote:
>>> On Tue, Mar 31, 2026 at 03:43:18PM -0700, John Hubbard wrote:
...
>>> The name `DeviceSize` seems overly specific to the use-case you had. It
>>
>> Yes, actually this name has been worrying me from the start. Because
>> it is not necessary to tie it, conceptually, to devices at all.
>>
>>> also makes it sound like something you would implement *for* the device
>>> type rather than for the integer type. Why not name it something more
>>> generic such as SizeConstants?
>>
>> Yes, thanks, I do think SizeConstants is more accurate.
>>
>> I'm inclined to make that change, unless someone else tells me not
>> to...let's see.
> 
> I think I brought up the name DeviceSize when I proposed this.

I let this patchset linger so long in my backlog that I forgot the
trait's naming provenance. :)

> 
> The reason is that when I proposed this I was thinking of it as a marker trait
> for "complex" types around u32, u64, etc. that we can use in DRM APIs (or any
> other device centric API) though generics.
> 
> For instance, instead of GpuVm<T>::vm_start() -> u64, it could be
> GpuVm<T, V: DeviceSize>::vm_start() -> V.
> 
> Another example would be buddy::Block<V: DeviceSize>::offset() -> V instead of
> buddy::Block::offset() -> u64.
> 
> This way you can interact with the API with the actual device native size.

Yes. But it's an uneasy fit, somehow. I can (again) see the idea, but
it's also true that SizeConstants is something that is generally
desirable elsewhere, too.

> 
> That said, I'm perfectly fine renaming this to something else; the "device

Excellent!

> semantics" comes from the API using the type, not the type itself.

That's exactly where I landed, too. And of course, when naming APIs,
it's best to pick names that describe what the API provides, rather
than to (often imperfectly) predict what current and future callers
may do. 


thanks,
-- 
John Hubbard

