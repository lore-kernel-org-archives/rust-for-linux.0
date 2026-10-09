Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013067.outbound.protection.outlook.com [40.93.196.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886324582F7;
	Fri,  9 Oct 2026 13:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552285; cv=fail; b=cKoq1jnpViX7gr/NGdqJHAK68G7QY49s7V7nZlDgAygCY23XGKT6JqLbhuugzhchAvgnH/WOOXfSGtIApwgndJk9byJ1r0qxuMBdJIWbWQZuyki7usX0UctC05dMLsmSnB5GtnaGF2vzaL547D2nSaX4G1Bx607OlWHaHGcXQDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552285; c=relaxed/simple;
	bh=O1Al4/rEqe8KS/sEnmVAdk2gJPHwVm0bfFGVCQc2H9k=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=DFUBKUY+nbh0OuZEqpT80OOZoePGwp4ifDY2RYvDkuFuHuHCOfbau2dPBMo9c4ZfwypGXHAF9WLXCvZsHOVilMjyCtOCokbGh/+tCamFIurPu0rB1Cn0RmtNhGq2ygLHBj9xoLPPac3qskPtCvYoGdDGS883sFYW5oN20AKtTNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pcnZIrQL; arc=fail smtp.client-ip=40.93.196.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pcnZIrQL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cLL+2PYGiQ2YyOY7j4hxtD8LFGJS+aVJjpWAttWlSNFXwQxSxkVyJTC5IQSR3Qkmmucq7iVWVliiPwz8M3qBkR64dOaQhzvpjrjJ8SPOUv0tZmS7gcn4V7wcQUJj+2EAUoiv5AmQuKRhvWP9v8Zt3cQknP/XRj4F7x1WjwtDzUrfDLnFMKaU4+LaecHNJ6goLlYvS6Qp5o140rmEvFoJ/gwRluukYQ4OQ9z29r8f7RpJmZEveRCEBqc6od9VHu6gaOhDzkemgj1yWsq0C1oChZ8ieyTSBiPCjJ4dTipuCCcQ/Xq5DbWpvXsLk1YZX7aCavv0HdUFzt4h3x1yb1Ujdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbwWfzYE8dMCDAf2g72MEbe1pPg4pYZtXxn8rKAtoUg=;
 b=o0rAiCGLy/+4ajKMnNvhRTJW9paPqppXK8FaK3bDmir8u+6SOP22ieeJfN5okeB7cssWULAv4m9XWvyoqyiqgfcK5d9evvkeS2yWJmBhY/137cBZBc1MgT41SdYDFWe0XAzqZqMxDmGoL1WAsCxbdomQCLmD6ebvc8hLGu6ccpcLBdUzmDX1iSXq2PXnstVdabvwHzodGLfis3Zcw5Mm+NtaqqZMMVB10wMBeZyyXjiQ0n9T8l98wqpr2oE1Q4L+ZXf0lBTMZZw74gNELahRuWvtX4hBJN01lg6P4lZiHfo4Wd+KGGCd6Gn3BjSRO3CYYEZG9TALHw9wls1iXXd4GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbwWfzYE8dMCDAf2g72MEbe1pPg4pYZtXxn8rKAtoUg=;
 b=pcnZIrQLn6FpugHpN+WtUKGRmjIXXXNbJWOubJJ22l2H9MbFigWNdR8Y/Gjs3HdqyLK6KuAz6hsiQ+pK+t9YouPsJB81VTzxYgPDI/bzp8zEb1p9JO+kx6WHaWmRvgQvB/CLY4JewjxmgOdj0oXjpdNOyp7Hunp8Ymr/J3Uzkhl6aqlCetInNxdGz+Yh2S3YgeOpkG0dvJkuZi1BVwF9xF0rL7y8nvgTl6kuUn5u+3IH8TlZ8OHHHwr4WS01biXWgM+SGc2FL78BdoRZSkqLv1JCJZqgnHK4GUH0lf80swkz9QEVGmGMz8403UNixUasPH9HP55DbBsA22kb61S1tw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DM6PR12MB4042.namprd12.prod.outlook.com (2603:10b6:5:215::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Fri, 9 Oct
 2026 13:24:39 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0472.016; Fri, 9 Oct 2026
 13:24:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Oct 2026 22:24:31 +0900
Message-Id: <DM0C9ZEJA9EF.12IOGM4R4QG3E@nvidia.com>
Cc: "Thorsten Blum" <blum@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: uaccess: avoid unsafe unwrap_unchecked() in
 strcpy_into_buf()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <20261008061326.177841-2-blum@kernel.org>
 <DLZHGS3GBIT9.16N0JVOTMONZO@nvidia.com> <asflx_blsGkQ7Obn@kernel.org>
 <DLZPAM0YRU3L.2TDZ2GLI7AS6S@garyguo.net>
In-Reply-To: <DLZPAM0YRU3L.2TDZ2GLI7AS6S@garyguo.net>
X-ClientProxiedBy: TY4P301CA0052.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::15) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DM6PR12MB4042:EE_
X-MS-Office365-Filtering-Correlation-Id: f26bf428-2bf2-4a0e-92e4-08df2608abbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|10070799003|1800799024|7416014|366016|6133799003|10067099003|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	LzzG/CZ/tfB8DQInqPpXPlVMowh7Uf+oGJVrLI7SPluvREDbj9M2xbyLKPf7AKly1YHfHEBJSmoThSNGP7f6fLr6Xzedwuxkp44yHCJl+D6rRBqh586m65qQBt7M1eb+a0zgwjq4b/tTovJ3iblylSQgu7Pv8wgDrD3X0jCwXwRQY8RBdz6qSP0jnGesc9pl6cqvh7OvnLKsJc97oQJUZ4uB0FLSly5zPCyhD8HK0rDDq6ggcbizd4ZGqbrZgDP6erZIALobYaNzZS3C3d+Ws+QSbI3j2Zi8Lmz6UcSwBoFvG3ZLhR28F58REI2DduPT66FQEF2PV3233Sy0qEGB+jS9rdihIYcwzZsE1xSoFg7L3xNeyCX6p7w+qkO6ZBkAyGsULqtB/IXagq+h75r7mW91uMP1Q38I7m1I19RdS4zcm7sDGglkHGrh//6n+fNP4DdP0inO29YOXE4+laLh55MAWfw5A6naCPOPX1puw9flnRtdV6p1zfYmEN4YzWp4fBLQSCuOH1qMWOCymfSToze91S/otoM6VOwE7aFEgXE1s/mzUs94CLskMeIn4xj+NOeclL2jYGe9DqHzW0qKzPmun28YtQkC0yjuohEru+kKCKsh0/VZvtNaGmR3oAXhN+dK8DN0PwpOL20Ye18DVl6R7L3dMzFGmxX1UJwY130=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(10070799003)(1800799024)(7416014)(366016)(6133799003)(10067099003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZW5qZXVPZjlucEcwUVJ4UVF2cjB2K1N5WnJFQnNDdjZoSDRtNFZMemxiQUFP?=
 =?utf-8?B?NlBQTGxKblpIMFhTY1dSVWlKNzZPVHo1NkJWeDV1SGlkSXdmOTVDQ0pnSWov?=
 =?utf-8?B?TGNkVXFiN1BhNGNJcGhSaUtEL2VEQ25UQm1RaExCdnl6YTFIMktOeW5zMHhk?=
 =?utf-8?B?Wll5b2ZieVpBZG01WWYrbTBxTkJhYnZFV1h2MndsZ3ZiTy9PZldnbkZ4VjRQ?=
 =?utf-8?B?WGQwQytSSWdNNjd6dTRqNE5pRmp3YXFGMDlPeFlxVEV6NzJBUkJxTEZ0aXli?=
 =?utf-8?B?OXlPOTFxNHh6YlZSd3liWEwzWnRBemJXSHU3ajhXWWtLcy90dlJtQno5SjE1?=
 =?utf-8?B?TWNpMFNqNXNnVmdxVzFITi9ZaWFRd08wWHlSUFZONXVuS0phaStOUGM1RE55?=
 =?utf-8?B?S0pDWFNacWY2ckZzUnU3OXYycFprWlFoVE4yV2haWnhJb2hnVDVpc0ltRE82?=
 =?utf-8?B?YWo3Y1Q1Q1l5dTIrQ1J4d0tpQUlQelQ0RU11SEhxVmRtMk9PWEZ3eGtzRUdL?=
 =?utf-8?B?b3YzNmFld1ZraUYyS2txazJTZTNjeWh5U3hKZWloUDl4eFdKeTdPc0dGWDYz?=
 =?utf-8?B?amNSNTlTRmV5OEF6U1dsZzNpS1hWbEVSNjdnaFBSSmVLQmhkNWZDaGRaZ0F3?=
 =?utf-8?B?a1R6NUZkY2pWMjN4QVZPc3NSMjhYOXNMSitvVnQ0QkpQMWt0OXo2SU9JNXFJ?=
 =?utf-8?B?Ry9BOHA3UTRsaEVqTHN3TlMxM0ZrUWJrbkF5NjR3VEpvT3NUS0JMQ2tDVlFX?=
 =?utf-8?B?Z3dQV2hSL3ptSkRrUHRwQkFLSHh2SC91MHVCTDhoUW9WOUZDTGp2OVhBMGpL?=
 =?utf-8?B?Zlp3YkgyL3NsbkhHZlNybDZXRFlqSURsT29pZ3J6SThrVTJ6Q2pWbEN4Smdk?=
 =?utf-8?B?S1UvOTZkLzR6eWtZYktudTJRSEhjeHVmb2hjcXIzTHQ2aVlLSHhiU0toR2Yx?=
 =?utf-8?B?czVYNmpEdFY1d3M2MXFmNm15bEJsdlZZZ3pOalBHdVYvRmc4WXZxajl4RGkx?=
 =?utf-8?B?cmQyVlVwRG9BelF3R2RxMmw0dmVPMUdtQjBDaXlXK1pta09nNVZHOTRGb21H?=
 =?utf-8?B?amFEamIydlE2SURkSVpOQVlYTi9jM2FQNWhIQ29XMEozL3lJMlV2VTlTcXVO?=
 =?utf-8?B?SXV6cnVXTDlNY01SbFh0RENzK0gyRURrUkw5bldudjM3WUNGRlBmZDRTQVpQ?=
 =?utf-8?B?QUpReFhwZkd5b0JFQlZZeXRkK0M1YmJpS3FKaXJPT0tHaTIydmU4YldvQnNL?=
 =?utf-8?B?Vm9jWkJvNVgyUU1NaEduVVJ0bHAwQTFscFJ0ZnVwbWY2V0Q0bkw3QmNOK2Iw?=
 =?utf-8?B?cWJsQ1pxeWFBZWVwNVllTlBKTmd5SFVIQVdLZjNJVlRENEExRnAxMTdybnlm?=
 =?utf-8?B?elVBQUVqcGJ3RllyWHN3YTFIZXVGWVhCVjY1N3dtTjF5QVZWMzJqKzBnK083?=
 =?utf-8?B?NkFuc2x3d1dCYi9DcldzbnpFM2p6WGJZQnZtT2txdXVLVFpYaWtHVENXcVhH?=
 =?utf-8?B?dDRiZGVCQnUyTy92N2RqVWZnaWhLc3hTRWtMR2FWY1VIREtLOGlZRHVtS1pQ?=
 =?utf-8?B?OFpkYTI1YWFwSUl0U2NZdGJ1RzUwRGM2NlAvbWF3cjJKbklDdGhCcVJOVVor?=
 =?utf-8?B?RS9xT1dTK2ZZekYrb0Q0QlJWaFlRc2xwVTRBVXplYXhxbkxOMnNXdmxsSlA1?=
 =?utf-8?B?b3g1V1Y5T004UCtHNHN6TlNtdU5NRVZUSDRxdWNjNStwRys5aXp6RDhYU3h4?=
 =?utf-8?B?RFVMd3cvVzBuQ1ZudlpVZDN6RVcraVE4cXZCTXVxN3piRFdUWTFWcWswU3RP?=
 =?utf-8?B?aGJoRmJCRWNVazN3WUdxQWNDT2p0Tm9wSkNHQWUvcjFaRmwxNHo4Q1RkUWUx?=
 =?utf-8?B?L0pYZGxjOWZmWSt5NGlxT2lyYS9qNVl6RXVlbFNVUU9jeEZmNnZ6QzdybG41?=
 =?utf-8?B?NUNGb1liRlc3S3BHMnAzYllVb051d3RObXFLcm9UdVF2ZEg2a2R4S0VoMWNk?=
 =?utf-8?B?eGVpRnBvZWhqTHBUOTc4TDR3bVk5a2NaZlJDbXl1U0lobG0xb293djkzSWRk?=
 =?utf-8?B?bUdpWWJqcWNUQU52cEg5bURHeHp6Q2dlNlh2a29nVlAxdGx3b0xnMUhtMlhr?=
 =?utf-8?B?cEZ3NDlZdXNNQnNtYWpSVTNCS2VTK2I2clVrNjB5VzlqTU03RXBnc2RFNnJs?=
 =?utf-8?B?NlRIRktVTm9VT05HVGJLOWRVZUNtMWZpNmFjOWgyN1VDNzh6SE1xWENQOFRk?=
 =?utf-8?B?Uzd6OS80SUhiZzhXYXdIdmZkVmZUZk41ek4zSFdZYVk1eEkyaFYwdzUxcVNj?=
 =?utf-8?B?N3I2NENEVG56a3Zqa1lSb3VLM0ducXBLRmJSdVdWZWhqbkEzK0czNWJCS20y?=
 =?utf-8?Q?7GKItAse9EjQHV8Ii4z03Uh8/t3ASmWYVtTNsI48s06VY?=
X-MS-Exchange-AntiSpam-MessageData-1: Ydl6sO6RxkcK6w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f26bf428-2bf2-4a0e-92e4-08df2608abbc
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 13:24:39.4306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DcjUQzcYIhQCHsMOknqHXsRhCvMxp08Kdl3I78LXz3rHKeLAHdBAvcangRUSYN9E3JMk1zZXEeNOQWoxtYCN/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4042

On Fri Oct 9, 2026 at 4:23 AM JST, Gary Guo wrote:
> On Thu Oct 8, 2026 at 7:49 PM BST, Thorsten Blum wrote:
>> On Thu, Oct 08, 2026 at 10:15:49PM +0900, Alexandre Courbot wrote:
>>> On Thu Oct 8, 2026 at 3:13 PM JST, Thorsten Blum wrote:
>>> > Since strcpy_into_buf() already rejects empty buffers, use ok_or()
>>> > instead of unwrap_unchecked() when NUL-terminating the buffer.
>>> >
>>> > Signed-off-by: Thorsten Blum <blum@kernel.org>
>>> > ---
>>> >  rust/kernel/uaccess.rs | 4 +---
>>> >  1 file changed, 1 insertion(+), 3 deletions(-)
>>> >
>>> > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
>>> > index 5f6c4d7a1a51..2a0af795e75d 100644
>>> > --- a/rust/kernel/uaccess.rs
>>> > +++ b/rust/kernel/uaccess.rs
>>> > @@ -422,9 +422,7 @@ pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut=
 [u8]) -> Result<&'buf CStr> {
>>> >              // This means that we filled the buffer exactly. In this=
 case, we add a NUL-terminator
>>> >              // and return it. Unlike the `len < dst.len()` branch, d=
on't modify `len` because it
>>> >              // already represents the length including the NUL-termi=
nator.
>>> > -            //
>>> > -            // SAFETY: Due to the check at the beginning, the buffer=
 is not empty.
>>> > -            unsafe { *buf.last_mut().unwrap_unchecked() =3D 0 };
>>> > +            *buf.last_mut().ok_or(EINVAL)? =3D 0;
>>>=20
>>> I am not sure this gives us much - we are trading an unsafe statement
>>> that is well-controlled (enforced by the first two lines of the method)
>>> for a runtime check. I'd say this is working as intended here.
>>
>> I checked the generated code before and after the patch and it is
>> identical since the compiler is able to remove the additional check.
>> Therefore, this removes an unsafe block without adding runtime cost.
>>
>> It also avoids relying on the buf.is_empty() check to prevent undefined
>> behavior.
>
> Adding an error returning path is worse for something that cannot happen =
is
> worse than invoking unsafe in my opinion.
>
> Why not just unwrap?
>
>     *buf.last_mut().unwrap() =3D 0;

I guess the author of the code decided to avoid `unwrap` for the same
reason they avoided a runtime error: the first two lines of the method
guarantee that the access is valid. Now I wish we could keep the
enforcing statement closer to the unsafe block relying it, but I cannot
find a better way to write that method. `unwrap` would just switch the
`SAFETY` statement for a `PANIC` one.

Honestly I think this code is fine as it is.
