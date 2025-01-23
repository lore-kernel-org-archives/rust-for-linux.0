Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010027.outbound.protection.outlook.com [52.101.69.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F8DC2FD
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Jan 2025 05:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737611388; cv=fail; b=So9G8i8hnPzGq5DrpJp718ZjbgafCJK2fLR3CA3m4rDAgIjV7fQdbdx7vLoZVnnEVNv++jmTZXxP/Y32c9FmRPqWL7YZZ/Yy0cQr+lR3EpH1qpDSSYmb/qyLAPRXWICXSh1lDDXGp+eV7f/n4XWDyTO0EFaY3Kp8+czLaIc/xTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737611388; c=relaxed/simple;
	bh=kc6D9Y9uv8XbarMWact2g5hEEuUy/0cxE0S4NekKdb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=L0pFYNMygX8Ho4OueFA83mUlbFSb9/QMFX9DBitW19+/x+ZL4bgxMt3V/1VX1edqpF9nJTfuMR9DLSC/W2L8ClMzry1Uf9XpB3TtvrGxQvBDIMm24dlnHyP8EGO7QaZeHHTQnE8NvQj+l4D7Lw9PCyGFQBFKPxgfzWfG1zeV/ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=HJW/V7nm; arc=fail smtp.client-ip=52.101.69.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="HJW/V7nm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/F9QtUFSzBgErxqtp0v6PMoNbcFXo5uZIn5P3JfTN+AKZ04pcwVVcBeYpv9fV2SZubGIDAp39/tcMEWw+Tdbq2N9T2UCdd+i5k65q+yryoUq6Hvfb9rY3p/1rWVyVx3a+KwSSIH0mfnUe7cBuuVKfNgBYQKGiBOPrg9L+cHsmUFwM+oOnxfQS6WRP2MuC8BJbQOnJxW7WBAIpPzUwkiji+U3vs2aXfu91hX3jG8EwJey4RC5SLsZrchEJFvOgVKzmOcTzaoum1s2k4kpqLbVTtY0XXBAJEfKE0tPwsacmB4KE+9cr+U/+vEiECikxdAslwcSUf0kPK0u7s4xH2xhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNAeAcWY5ArgYanTdXMbepDECmBAb/zPLfYMpI03lbI=;
 b=tbQs8iGQFf3HNMcYCeu3gxcTrOP+YwblSg++XqIIQ6GjVonoslflzlYKVyXn4mojmT2pcRNJJ3WJiM/EM6z7rZp6sdOPej2/BlEskC8rQPO+xgfg3vOQuVnr3DYGfcFY57YghZF/lF0bpOBZajmiVR4+mva/F21YGwh/0ka/0VAcgY9SqbCdxPaJu2hxDMJLwR1xzVlg/9Oo5K2hHJ4uFuAcNmmrbz8NaEKhuBh/r9hw1LYzcd5OAEFPdtybtdE4gy/sHmsAZ1ixyeI1jBaJ0k03rtHV9rPX8fEfFF78iB4+2y9jiHujl5m78mNZFIBl1jKNQ5ehem8Kz4H0fCzE8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=kloenk.dev smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNAeAcWY5ArgYanTdXMbepDECmBAb/zPLfYMpI03lbI=;
 b=HJW/V7nm691WWSM0W1LNafOPWrhiy4uRwE6h2TaiTcHm8d/eZ1fbPdy1dNLnnnZX3d8GbOQieC+wof8XEVE7KdKFmo3btsvHFko8+IQ77tVUSc7Oy8Ir3mMgfm2Tvpvxipxid2205Fc4GP9QtQwXzyVK/eqKjNJY65aAAyRpOrLgXRpp7xPcywx7WhzhVG+qn0O2dyn/ACMGyFLC2qaR9+3riKbelommnikQbXYw+JN4wtSymDajVtMqcxD/H8ERFMEkmFhs2ELn/f3LQ3eIaB69CoDRRd/TuIMzQaXJPcx0nPhZA5d+M0Hg1oLqsyFuXYQnQKCieu9IPfYzRhvhBg==
Received: from CWLP123CA0241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19e::8)
 by VI1PR10MB7755.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1cd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.13; Thu, 23 Jan
 2025 05:49:39 +0000
Received: from AM1PEPF000252DF.eurprd07.prod.outlook.com
 (2603:10a6:400:19e:cafe::9b) by CWLP123CA0241.outlook.office365.com
 (2603:10a6:400:19e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.17 via Frontend Transport; Thu,
 23 Jan 2025 05:49:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AM1PEPF000252DF.mail.protection.outlook.com (10.167.16.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Thu, 23 Jan 2025 05:49:39 +0000
Received: from FE-EXCAS2000.de.bosch.com (10.139.217.199) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Thu, 23 Jan
 2025 06:49:38 +0100
Received: from [10.34.219.93] (10.139.217.196) by FE-EXCAS2000.de.bosch.com
 (10.139.217.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.43; Thu, 23 Jan
 2025 06:49:38 +0100
Message-ID: <26d57f25-d2ff-4967-abf3-3d329c04d3ef@de.bosch.com>
Date: Thu, 23 Jan 2025 06:49:26 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4] rust: error: Extend the Result documentation
To: Fiona Behrens <me@kloenk.dev>
CC: <rust-for-linux@vger.kernel.org>, <ojeda@kernel.org>, <daniel@sedlak.dev>,
	<aliceryhl@google.com>
References: <20250122054719.595878-1-dirk.behme@de.bosch.com>
 <DFB88CA7-B9B9-4007-BFFB-02E624BA7ED3@kloenk.dev>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <DFB88CA7-B9B9-4007-BFFB-02E624BA7ED3@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DF:EE_|VI1PR10MB7755:EE_
X-MS-Office365-Filtering-Correlation-Id: c8f468d7-c676-444c-e598-08dd3b71b9e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWhGdUZaYkNHVkZVL3ZmWXk0TXpEZGF6UHpnOTBTbzhMVi9tTG5zaW14Um9s?=
 =?utf-8?B?bUVWZmY4d2lLeXpKRWpodEFuWmxUYllMUXBZUXBpVWRyaEpDa0llSWpVaGk5?=
 =?utf-8?B?c3RNKzEzOUV1SDIvS2tvbVllOXV0VUlRSHQ3aTBLb21WUGJ0c3ZPd0RXR2VW?=
 =?utf-8?B?VGdPbGZXd3BzN2F2OFB0S1E3Q0lCTjB4Slk0NXVVa2RHbjBMci9UU2M5bUtS?=
 =?utf-8?B?c1YxSkV1RUFSZ2taMms2dmhhN3VGK0JDcFBBVldNUys1UlFCNnNicjREazQ5?=
 =?utf-8?B?TnVDUFpXTHEyNkVORDlUZmlsV1pkU3l6MEFMM3U1elNlcllFRmNsajJOOTFa?=
 =?utf-8?B?Z1pDeGhZcHFCdStpbEY3VGVVOFJTdm5nK3owZTFZYjd5QlFlMERaOEFvd0Ri?=
 =?utf-8?B?dlFkd3UvVnZqMGs5N0Y3eUFCVFdBR01WOC83MW5DUUthaGQxZnl6NnYyUUtH?=
 =?utf-8?B?bm5aUGY2Y2JGUlF1SVQyL01Qa253aTA4WFJNdm9ObnNacjV4MFdlU0t6elJh?=
 =?utf-8?B?aDBLaTVta2YvUGt2Rm1hME5jQm1uZTZ4Mldzb3JsMXBXVFMxM3VadEppT1d4?=
 =?utf-8?B?dEh0SUNaRGNmb2UyUmMyTXpzSXFpQjM2d0ZSSzRROXJKd3BRVThqL1RyWCtB?=
 =?utf-8?B?RFFIdHhSbkFNbFFZK1Yvd1V5bEt4VG91c3ZsY2VTeWlhTm9zVUtZR3l1UFky?=
 =?utf-8?B?UGxNcmNjT0pQQSs2NWMzbTR3SXphYm11bkRsTHhaVFZHZ3c5TEk3TnhKaVBW?=
 =?utf-8?B?V1JkTE9DOW9tVGEvUjZmTWJWY0lOaWR6cmp5ZDZnQTJ1YUVEdllpVGFIWnhw?=
 =?utf-8?B?NjVQd3R6MVdpcy8zbFFlS1lpaEhjM2lUMmErVWFYRC9UVnFLTEZ4UzBrck1t?=
 =?utf-8?B?Q050YUpaU3B1Q3h3M2tGYzRTTUhvTHRUelgyMFZPeGJ2WnFMb2Mwa3d0Y1Yz?=
 =?utf-8?B?NzdMd3F1N2lFUVdmclRxUGhRM3d5MHprVVpOZks1ajNxNzhlYnk1dlkrcUZ6?=
 =?utf-8?B?NDVoWmF4MmlIUHo2bnByQjA0VnQvbGJZUzk4N0NjQVIvTTF0SzVoV3R2dUxW?=
 =?utf-8?B?MnJsa3lmODRDZm45cWlBajAwa1RRek12dW9VSVR0U1B6QjZ6eFA3NHVSQ2ky?=
 =?utf-8?B?OWR3aG81RVFyb3Nram9GS0tFbXZraTR2WE5XbWNjYWJyZHRvZ0FFNk1tWHlY?=
 =?utf-8?B?THdSVC9DRG5yYWRoN29IL0I3QXRqUERNTUV0aUpIK2dwTVZXb0NKdGtWa2FF?=
 =?utf-8?B?U2NHUHRxdFB2dnE3ak9OVUhxMllzejZrOXJOQ2dOcVVqSTZGQ3F5NGxyWDVj?=
 =?utf-8?B?ajI5aTlGSWlraUs5M3hiWHlrdTROM1hQWkJ4ZmRFeWU3ZzBYK1FLQk5JeGl3?=
 =?utf-8?B?eU1Fam9Dd2Rnam1LbXc0MnZFUEFTbGhDOGYrNnhqMldMWEFYMFhLWHFhUEor?=
 =?utf-8?B?a0VRczNrZkF3ZHN6SXhnTEtpTCtxUzZkcmNUdThFb3h6L09RSHFjK1lwa0ZC?=
 =?utf-8?B?ekFheElzQjROYmJSRldmVFh6SnVjSVhoZWxuTEQwVTBYcWMvV2JZalFnRXl5?=
 =?utf-8?B?VTNvN3h4cTR0YkFhd0lnQVNRSk1JRE05cml4dUtTS2t3eSs5a2tDUWFIbTJ1?=
 =?utf-8?B?OVJwb0ZleHhxRXdvdEJEQzlkODJIZHNVQXUxZ3c4ZFh4Q1RVd2dnYzg2VFJu?=
 =?utf-8?B?UWlWTFJaY3NtN0lmN3haUGhiWDdXb2lyV2w1SFRWRStmMVpqbGVQQzcrNkdH?=
 =?utf-8?B?S21pV0taRzV3cGxLOFM1NDZYZWJ6MEdnR3lZUzl6K3AzWFlLcWtUSkYvNkJ2?=
 =?utf-8?B?ZXQ2VVA1MTA5Sm11SmhWQ3gyYVpObFptdE56ZXRwVTVjU3JyYk1RTUtZU3hn?=
 =?utf-8?B?NlFTaDdUUDNkbzZnbkVuZWZsQkY1YXVIOTgyL3pnam9JVU9aTTNoZ0pLdGdJ?=
 =?utf-8?B?Smo1aE9CTURmQ0F5ejU2TVJRTENjVkNqOWNjRlQ3VHV1N0pyWkZIcWVnb3hh?=
 =?utf-8?Q?ld1Zfz10gznqwfKKrHB+2MtfEdjpc0=3D?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 05:49:39.1786
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f468d7-c676-444c-e598-08dd3b71b9e1
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB7755

Hi Fiona,

On 22/01/2025 10:57, Fiona Behrens wrote:
> On 22 Jan 2025, at 6:47, Dirk Behme wrote:
> 
>> Extend the Result documentation by some guidelines and examples how
>> to handle Result error cases gracefully. And how to not handle them.
>>
>> While at it fix one missing `Result` link in the existing documentation.
>>
>> Link: https://lore.kernel.org/rust-for-linux/CANiq72keOdXy0LFKk9SzYWwSjiD710v=hQO4xi+5E4xNALa6cA@mail.gmail.com/
>> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
>> ---
>>
>> Changes in v4:
>>  * Drop the expect() example and put the slightly rephrased
>>    unwrap()/expect() description below the ?-operator example
>>    (Alice & Miguel)
>>
>> Changes in v3:
>>  * Slight rephrase regarding panic() vs BUG(), whitespace and
>>    newline fixes, use srctree/ syntax, add Rust reference link
>>    for Result(), evaluate the result of the examples etc. (Miguel)
>>
>> Changes in v2:
>>  * Improve the linkage (Daniel & Alice)
>>  * Reformat the examples, add if let, drop "automatically",
>>    call the example(), improve the formatting, etc (Miguel)
>>
>>  rust/kernel/error.rs | 113 ++++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 112 insertions(+), 1 deletion(-)
>>
>> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
>> index 0b01975c2286c..b4e59feb17a7f 100644
>> --- a/rust/kernel/error.rs
>> +++ b/rust/kernel/error.rs
>> @@ -254,8 +254,119 @@ fn from(e: core::convert::Infallible) -> Error {
>>  /// [`Error`] as its error type.
>>  ///
>>  /// Note that even if a function does not return anything when it succeeds,
>> -/// it should still be modeled as returning a `Result` rather than
>> +/// it should still be modeled as returning a [`Result`] rather than
>>  /// just an [`Error`].
>> +///
>> +/// Calling a function that returns [`Result`] needs the caller to handle
>> +/// the returned [`Result`].
>> +///
>> +/// This can be done "manually" by using [`match`]. Using [`match`] to decode
>> +/// the [`Result`] is similar to C where all the return value decoding and the
>> +/// error handling is done explicitly by writing handling code for each
>> +/// error to cover. Using [`match`] the error and success handling can be
>> +/// implemented in all detail as required. For example (inspired by
>> +/// [samples/rust/rust_minimal.rs]):
>> +///
>> +/// ```
>> +/// fn example() -> Result {
>> +///     let mut numbers = KVec::new();
>> +///
>> +///     match numbers.push(72, GFP_KERNEL) {
>> +///         Err(e) => {
>> +///             pr_err!("Error pushing 72: {e:?}");
>> +///             return Err(e.into());
>> +///         }
>> +///         // Do nothing, continue.
>> +///         Ok(()) => (),
>> +///     }
>> +///
>> +///     match numbers.push(108, GFP_KERNEL) {
>> +///         Err(e) => {
>> +///             pr_err!("Error pushing 108: {e:?}");
>> +///             return Err(e.into());
>> +///         }
>> +///         // Do nothing, continue.
>> +///         Ok(()) => (),
>> +///     }
>> +///
>> +///     match numbers.push(200, GFP_KERNEL) {
>> +///         Err(e) => {
>> +///             pr_err!("Error pushing 200: {e:?}");
>> +///             return Err(e.into());
>> +///         }
>> +///         // Do nothing, continue.
>> +///         Ok(()) => (),
>> +///     }
>> +///
>> +///     Ok(())
>> +/// }
>> +/// # example()?;
>> +/// # Ok::<(), Error>(())
>> +/// ```
>> +///
>> +/// An alternative to be more concise is the [`if let`] syntax:
>> +///
>> +/// ```
>> +/// fn example() -> Result {
>> +///     let mut numbers = KVec::new();
>> +///
>> +///     if let Err(e) = numbers.push(72, GFP_KERNEL) {
>> +///         pr_err!("Error pushing 72: {e:?}");
>> +///         return Err(e.into());
>> +///     }
>> +///
>> +///     if let Err(e) = numbers.push(108, GFP_KERNEL) {
>> +///         pr_err!("Error pushing 108: {e:?}");
>> +///         return Err(e.into());
>> +///     }
>> +///
>> +///     if let Err(e) = numbers.push(200, GFP_KERNEL) {
>> +///         pr_err!("Error pushing 200: {e:?}");
>> +///         return Err(e.into());
>> +///     }
>> +///
>> +///     Ok(())
>> +/// }
>> +/// # example()?;
>> +/// # Ok::<(), Error>(())
>> +/// ```
>> +///
>> +/// Instead of these verbose [`match`]/[`if let`] the [`?`]-operator can
>> +/// be used to handle the [`Result`]. Using the [`?`]-operator is often
>> +/// the best choice to handle [`Result`] in a non-verbose way as done in
>> +/// [samples/rust/rust_minimal.rs]:
> 
> All examples above feature a pr_err and then return the error. Then the `?`-operator is just called less verbose.
> Maybe it makes sense to also state that it then does not print anything and possible also show that it could be
> logged at this place with `inspect_err`.
> Though I remember that usage of inspect_err got discussed at kangrejos (rfl-conference) but don’t fully remember the outcome,
> think it was something like use it sparingly.
Yes, we talked about that. If I remember correctly the conclusion was
somehow that the caller is responsible to report correctly about
possible errors he gets back. Like in C. And yes, I think the
samples/rust/rust_minimal.rs used here is exactly an example where this
is *not* the case. This is what I called "silent" errors.

The idea of this patch is "don't use unwrap/expect as it might panic".
And yes, we need some explanation for using the `?`-operator correctly.
Esp. to avoid these "silent" errors.

But would it be ok for you to do this in two steps? I.e. having this "no
unwrap/expect" patch. And then in a second step a "use `?` correctly"
explanation?

Best regards,

Dirk
