Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012066.outbound.protection.outlook.com [52.101.53.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F993264C3;
	Wed,  1 Apr 2026 20:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775075643; cv=fail; b=H0Eb6g+SMX7fUZ6xK60wAEEj6ojgjylcubDQ4RN1GlDMg98lXKU6Q9lUXQfOOQxahAIEujKBYrlGlWiwFOPTCFmrhWe1jfQOqpNRD0Ux9pAduKGC8xBvcpqNM21DmTJ1hJYBqOtPWKIW7S+OscQY/AkE3vy9orZiX2iEIU/lFDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775075643; c=relaxed/simple;
	bh=sPvjf7EWj6SJF7Y7/RU7njnPvMONMdikLgeNP48C70A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=m6RoI+f/mLUjEmmWf2hFe0IfeVaacqA5Qp0bWjak8980NsxDfmqr24aAFX3cAlnq+1OSkVuXsYPQleqTe3oe++/UW8qGzw+jw2LGAvaBroGFd2yvg4Dt1rf7GVO6eJ3FjM7aPz0GESvAMqccxAOWQjA3WqxPGfI/ZWv4QVaYtfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GyJizAJb; arc=fail smtp.client-ip=52.101.53.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GyJizAJb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCwYqCEH2tVyydZ689cVoJc9gAbrf8Ad9I1vb8a5zBVEQXDGJqRJK4C8WJ4xyzTBVktHkc55vGlmt3RoSILkzIBzgYL68qmi0IIGZ+7pckC8YXqXvxg/nOxVe7XIzP/87lh3diY3tHtrOx2kx3cGfjuMouZyFkPsKrBzORk7wi+Dsvtnwx1aUpJwHiuOaNVgbVUQMV2T0uw53qIIRhAb+2cElzvTk0sQIQPPjJ3KmzXxSUxaLV5kSNHySgEcEmkTC+Z935zpX9BZVMhhj20nHfqQnZAjWghrmrUO3ly5+0NgCxlxeMJa9+5w2E7l7c0UscRPHf0GuMj/yv6z7CFKUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nk+FTK0801ystAJwDgnKvq9uWub2Ykoml/tSZ6rLdyc=;
 b=mV5fTw7bDQPiAcjx1g9dUFIkkPPDEa8rUROEp8csDY68Y2/thA5LK25kAOOTAhSiajqiH2VRdd00JgGvw8FD3MvSkn/ZT6jP0k8xY10rsuNd+zZrhbsKfsDAQRvH1X4cJUY/eOZlPIMBRu9POaP8pnDD+IHRv6w6BLAYpj/iCQoNJ9w5okyY7ulSpcpzB8byT5MkabB1+j1kGouVEicZ0g6/LkZf9dyxAJOuuHt5UG1/vlcv95TgTcRqq9RDbwFi0/AUZlf1PYOXw1dLvsUGcEjz3fStqn8G5cC2XL8B0xt8sDxULOTw2oYjYJB6ezPyqsxAH8idvhI+az1xijtoaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nk+FTK0801ystAJwDgnKvq9uWub2Ykoml/tSZ6rLdyc=;
 b=GyJizAJbvQgS3bFHI+2Bs1kzWDvpd2juRNOfSodY6Bo5VJmzFIOu37Ng1m8iYItpoiAhcvDAQwdq8pWKfMnZM8Y0uXZbOLdgUn9kawkFh1UVY+oCGbPHKDnrY66cRPSUyTbwg9JvtmoSITKN3SAW1/L2oLJJRfMWKDng2I6IVP+S/9yGw9Xs+/gWw3Hh0jSsWsuVB1aTy+Ut+0aX/e/c5Kvy5vvPO56qRHb970WaHC1CIg6Oezox6m+PjtXnPdtxvY//GjH4uAAny++cSYgTKx835y5oGvpBMGTK3+3rrLCXu/Gjaq1H1lg6kx92JhNTDnSMxgk3/S2xPl5XWqJB5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH3PR12MB8909.namprd12.prod.outlook.com (2603:10b6:610:179::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 1 Apr
 2026 20:33:55 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 20:33:55 +0000
Message-ID: <b18b99df-8b25-40f7-ba0c-9f8f0da36fa8@nvidia.com>
Date: Wed, 1 Apr 2026 13:33:52 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] rust: sizes: add DeviceSize trait for device
 address space constants
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260331224319.107082-1-jhubbard@nvidia.com>
 <20260331224319.107082-2-jhubbard@nvidia.com>
 <CANiq72mv7ZUest-yPV61Y+L-RtnYTWSKNMUfT7EGFiDG5jimKA@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CANiq72mv7ZUest-yPV61Y+L-RtnYTWSKNMUfT7EGFiDG5jimKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0106.namprd03.prod.outlook.com
 (2603:10b6:a03:333::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH3PR12MB8909:EE_
X-MS-Office365-Filtering-Correlation-Id: 5deae1ff-030c-4a36-4121-08de902dfe70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	VOmFnicRvVtCdodiN/M/NcDip7e8o9i7mI/Cz4L/8dc9rjTID3eBRHOeLMnTip1x65dTX79piqsOWBnGqVZdI6ILJMkxF35J62rZw4pvxnVpmQekIu9vt6M9FKWrXH1+8XIYWvGiwjsEnv8OV1OFJ22XuEBQdYCJx6LaQY71yZc1D7iF4fAiCqF/9c/FyaLm+/l7gasso6syCOjkIi+29NheNXCrcuTvUFFibi9xER8ZxMTrgORnkouKrqnp12cDudvWtE5Xzm8ddFzEdmqgTCjUMZtuE6b13r6TFzuuNjP+m3fgNFNBCzA+43xKgnaCporRNKK041gPmW7dVKHuJLCy514wuOWMIUj9jKlHEZPVd6RdassmUHYhcnKIZgkyN3h2oR5cXWq42tUzujCR+dNOnhBjU284yaD2e97BhQCNEN/Obj8RXisGyZYR6ARh4+7Z/q8hNIZRlE3Nh0HysrBzF/m7ehxpybpeckeA4Uy8j4/KZQUTadqc+5SifajNF0SqGa8MCMZ9i0B6QwYrkrxyWjzezc7QBoYa+p+W5LXZXHV3vMeGwyMZr7wu0HuxT6Jl1VsnIupcppLCSVE3Acc2FxKtoAIPkpwet/EXo6dLUjiD50NSY7rtb0jZIHMZ0dy9N32x0Qz1z4SnbPSRQqCxSm24rE7y7EHgzmJ7brjmufNGYLo+WaZ/ELyDzfBPawJvLbchcVrd2kw0S46OxnkuKANR5zvso7sNaQGZ1Kc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0Q3UklPZTgwMkVEUzVTWUJFaWQxSWpvRmo5NUpXbkZNMWVxQkJCN2k4cENL?=
 =?utf-8?B?YnVodmVXamozZms0eHdmRm9wTS9MRzhZaENmZERQT0w2T1VxVERkVWZRQkN4?=
 =?utf-8?B?bVM1dWNXRFZFS0d4OWpESUI4ejRnMExweFI4NXJ2MC9LK083b0hsYmlpVzNM?=
 =?utf-8?B?RVc4djFTR2x4UXZHbFVoTFFBdXZGM2J4aGN3OTZoc1dkSDRFRGdrblJEcWpn?=
 =?utf-8?B?OGJrNXMwUzZ2YUE2UnFPSDdUSGV2ZWE1T2pRUWRSWFNhQ3hCUFhGWGpEUlRt?=
 =?utf-8?B?bEZNMjhnTFN0SXNEc1BraHc4cGJMVUVWVDF2MmlhN2tWbk9kK3BPU01rNjlu?=
 =?utf-8?B?TGhSUEw1UmN6dm80R1E0bytYUGhJSkxRL0M4QmwyVUYzOWlMM0FGK3FBZExs?=
 =?utf-8?B?cDBCRVRTQllsbHB2b01zcGtZOVhOb1VNS3p0NXM2SW5SUC94Yy9nN2w3bXlj?=
 =?utf-8?B?eVUyWjVwaWlNa0JpRDcxeW5GY0lJajk5ang5RFprMVpaS2NBeXJDODRsRE00?=
 =?utf-8?B?YWtZd2VWb0tHZjJNZnZhUDY3NExvMm5uRFdDaDJIbTc2TVp0cUduYnZieU1j?=
 =?utf-8?B?U2dldEhsMGd4ejRrUWxyZm1zdE0xYTJPeFVHc1RrNm93UDgxdEpKelFWdUMw?=
 =?utf-8?B?UFZONkdESmFuc3V2RlFwQ3hHREZuTWxhUDBHdm04VmxDc3NROXJnNi9CZzFT?=
 =?utf-8?B?NnhjZnhnOVVnZG1ZTjd5cXlhL09VZjRwSzNsSU9PREtCSXJGMExSZmMxZkt3?=
 =?utf-8?B?dlJQeFFqRG12TmRJRFREL3lBZ2x1cDR1RTF1dlMxRk1pLzFSZXQ1azZ4VWk3?=
 =?utf-8?B?MG5QNGhQZllGY0FTY1VjLzlPTWxPZ3laNnpGbFpDbG9GZ2dlSEdNVVlYQTBO?=
 =?utf-8?B?a2FKVkU0SnpRUkJ5eDhHOWxDSXA0TW9mV1JxNUdOWjQyZFc1Q1g1NHY4QmhO?=
 =?utf-8?B?MFhLcVFWbjRLdU5ueDdXRkU1RXNBbHNLM2t6ajJMbisramZwai9POVkvaGVB?=
 =?utf-8?B?RzJvd2JQMFNrcklWUEVKQVlqNXlxZ1hiVGNSaDlEN1lsTnlyaTgzZnpXWFVQ?=
 =?utf-8?B?Y2VaOXIwejRjcUNyUkltZVlHL2V3Z1ZiK0ExM0ZFVHlRTDhoYU8yYXpkT1hm?=
 =?utf-8?B?TWl6dFZYZGZpNTAxSkJTNEg5YnlEZk8xSUtjN0g3Snp0dE12a3YwMzVQVHJR?=
 =?utf-8?B?WHkvWE5KRWVFaEhlMEM5NzBQdmthUlVRdmp2akE2OUNja1NMdUYxM05UOXNO?=
 =?utf-8?B?TUFUY0hTQTY4dkZZSVY3enZoNzdTdU42aXBsQ0hOSEU1UFhXeTVtdmd4Q05x?=
 =?utf-8?B?V1dVTDF0dGFrRGhtVWxwU1krOFUzb2pwZE9mZHd6RE0yUVFIUFFsSGZTMzE5?=
 =?utf-8?B?YytlN0dQNVIwRFphTStubGZaQzJQTTF3U1FsRUxaVnh4QlpPcDljNTFPVmZG?=
 =?utf-8?B?UXdPWFRjckswYW1CRW5SVzlnTXdlYVBxOWQwUmxFT1RaeWtMSklyVkN5UFV5?=
 =?utf-8?B?cmR4am9jTkdGT0tRamJBMG43R3kyc1YyV1c1WVFOMW4vRCtoSG1FMGx0WU0z?=
 =?utf-8?B?ZnoreTlCa05LeTk3SENqMWRWeE5FQ3ltWStPZGd5YzJ1TGRqSlI3cE9JUnVE?=
 =?utf-8?B?M0lxWFkxZ1NRTzJLbHJYVFV1TndZdDJTWktBSDI5ZlNrRkJUdFVpTml4emxJ?=
 =?utf-8?B?VTBwNlVGTU1kWkFhMHptQ29zT3lKN0N1aHg3cFJRWUZ3OUdocS9ZdUNiczFN?=
 =?utf-8?B?c1gxRTRLNzRaOHBQODVHd2tSSUI1RDJ4SThzTFN6a2Q3aWpDRmlzRkpra29n?=
 =?utf-8?B?SUc1RmlEczR4QkpmanRMYStiVjJlVjV4ZmMrTXQyZFlGTUpGdEp6emM5WW1t?=
 =?utf-8?B?Unk1cUdjRm0wbDVIbDJ0Rm5JckZocnhITnNmeGptOEhyODFuOWJlQ1M1UDNr?=
 =?utf-8?B?M3BOOWoxeGtycXF6RDEzdWRhRGRtS04zQllsMkdsNjR6UThiTnlLaThETTds?=
 =?utf-8?B?a25BRzZuTE5HMW4rMFlaTFJ6R0NLYnFnNVB5QWRIR3kzMVFPYzdQclFsdVZh?=
 =?utf-8?B?RnhvQW9DVXRDaHBSYWtXeTNZRXdvcC9yczdjOHRlTGI1SGtHbXN2cjl0S1dq?=
 =?utf-8?B?WmVBY3NjQVduNnp0YUMwNStkNkNlU1VuV2pGVGE0UytkaUNRKzR3cERJSVkw?=
 =?utf-8?B?U2JyUDJISXFjNDBUblZCOHA4UExkdGVmTGw3eTd1UExNZGpMdDdYOGhuS0VY?=
 =?utf-8?B?aExsZGtqWUUrOG5KY2sxak1TN1U3ZWVMdjVUSVhVcEtzeVFYRDRaSDFWLzB0?=
 =?utf-8?B?YXJlTXR2UjNJeEFUeWdFdXNkeWNodVVRZ0lGVW9GbnBJSjJsMElXdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5deae1ff-030c-4a36-4121-08de902dfe70
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 20:33:55.1583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: johX2zPiMz0EKE0PqTPiUwxkkJWWUdmHfF7StHLqw+oHautB+DLUrjss5bjA9k6TfydcPRNtyDTa6HfW9sUbxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8909

On 4/1/26 3:16 AM, Miguel Ojeda wrote:
> On Wed, Apr 1, 2026 at 12:43 AM John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> +//! // usize constant (CPU-side)
> 
> Some nits below -- possibly for apply time.

I've fixed all of them in a pending v4, which I think I'll need
to post in order to rename the trait, as per the other thread with
Alice.

Sorry that these slipped in, there are three separate systems
that should have caught them, each of which requires a bit of
maintenance:

* My brain: still hasn't emotionally absorbed these rules yet,
especially the backtick thing. Work in progress... :)

* checkpatch.pl: it's still delighted to bless all of these
patches with a "has no obvious style problems and is ready for
submission, hooray!".

I could update checkpatch, but...I wonder if it's really
the right tool. I forget what we decided lately, but I vaguely
recall wanting the Rust toolchain to help.

* Local AI reviewer tool(s): this at least I can quickly fix: I've
added a few lines to the rules.

thanks,
-- 
John Hubbard
> 
> Markdown and period:
> 
>     //! // `usize` constant (CPU-side).
> 
>> +//! let num_pages_in_1m: usize = SZ_1M / kernel::page::PAGE_SIZE;
> 
> Perhaps import `PAGE_SIZE` since we are doing imports above anyway?
> 
>> +//! // Device-side constant via the trait
> 
> Period at the end.
> 
>> +//! let heap_size: u64 = 14 * u64::SZ_1M;
>> +//! let small: u32 = u32::SZ_4K;
> 
> I guess the resulting types here are to make it clearer; or do we
> expect people to write the sizes for this? i.e. since part of the
> advantage of using the constants is that you get them already typed, I
> wonder if we should write the code as we would normally expect it to
> be written.
> 
> Also, I always consider in examples whether to add `assert_eq!`s, but
> I am ambivalent for this case.
> 
>> +            /// 0x0000_0400
>> +            SZ_1K,
> 
> This is consistent with the other constants, but I wonder if there was
> a reason to not do something like:
> 
>     /// `0x0000_0400`.
> 
> Anyway, all these is minor or can be fixed on apply.
> 
> These constants are meant to be useful soon, so we could do the same
> as with the other patch, i.e. I could pick it already it depending on
> the rest of the discussion (especially if we confirm that the user
> patch is what we want).
> 
> Thanks!
> 
> Cheers,
> Miguel



