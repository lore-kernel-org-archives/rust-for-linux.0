Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020073.outbound.protection.outlook.com [52.101.195.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570423F0751;
	Fri, 27 Feb 2026 12:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772195034; cv=fail; b=EfOas7ZVW2bjDVGHWRP9SxOpjSkiKmOtAfvIh7B6AX3GRwdGIG/jsU7K0stwrRmAJrxXCCGNTyGQMslimkn4Rz21psUVauB2hkfWhvKrVYEiqqnvUOJujQVl9E8TmEAsmfYz164kDe3D7Vbz5y72E/CvwQds9uhnL+6CgwXH4GY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772195034; c=relaxed/simple;
	bh=w45TJ6svs9cu+FStGX7PRSKcweBcV/nMHv6TGP5W1r8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Xjdb0ILBjafbylyeb2/5j2hH9jJs53toQpM0cNA/naEYKydQ4VFEdHPyhLC/IvhdarAYiK56P/PCTqb8L0LuNSgyG4o7HeLPRPfiuWaNW315zr7cDAiUKLYTG+POc8673BSh8eqRPRZWvjHKvugtOnAOeSi7Nrp1NFsi5JTkfEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=E22qvtaC; arc=fail smtp.client-ip=52.101.195.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="E22qvtaC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x1unsCETYcbwhL9I4qYjbJTVeJg3cMzWp85TPipk2zbQJwzo4/J6/QJH2PuYNdNAuxUVKXz/HPVqhjxH/HNRJCbcvqNFgHOiVNrTDRYARUSQ+bC5RzrEEYmmYQmuVm/qsKrw7buZQjMDutwTz8CLiHoK85PqPS3X/osP+xZngMDSRxDH8BloIaolPk6jtQFcHtV6urj/zRRQQ5XsAUUBvGUaQVe5g5bO0tIk/V2cPCU+77+YuGVCWhuMBtr3angY5FsQiDjI1RjHUIFAC/VNGPZwCcPW5ZxSp3m2T9n+o+d6pNhlJFQ1TU+T87iro26PDv3HvyIHo3ylJ17m+kEHMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4d7/WdmYdtyDF0rqXsZyuh5NeJPne5bPiiMmaI9fg8=;
 b=vcquFuu2hpgolrwu96EArmBoEfaeduBeZRsLH6ryvOyti95pVI2FwZ/b08k8oOrQS5zs6990+nHb2fO6ejP7MauPzBZlitIiZxbp0YRgeBkjki+Hqbe9p/EZR58NtpcYChtdNJwKJWWb1JRTfRYMeH/IG1OvGHpFupxk7EY1c4DNEASvts36+CM4rPEt1/HxvNHWu1x1dBjBBnqvWLkDB5ow4uwhx3UJyIm+f6jq2Iv+4p1ppBwQUxqr6abE29x3jb6bbQMiHcgmlaIdI88GdSVYyhhpUkuzUZFbAGP4WeHp53tjLR+/X9CV/Nt6lAt7a7KtT5bReDofrbmCSX/oaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4d7/WdmYdtyDF0rqXsZyuh5NeJPne5bPiiMmaI9fg8=;
 b=E22qvtaC/oRjtc7+tlmbwblsEnbWH3/FUOcAK3kZJ5ZkiJtkoeaMXwvtKyuxojiEsRhv5d2LJkedT71uOU5UDXAW8sRD/OcONF7gMeUerUg9U2QeaocEL9UQnkMeCpj+CvtdIdR9DbRLZHOxPxfKzoXl0F8vC76X0nqZ4KNBkxk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB3141.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:b6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 12:23:48 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 12:23:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 12:23:47 +0000
Message-Id: <DGPQPGIEQSQG.DGS3PGJGX9C5@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] rust: sync: implement == operator for ARef
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Carlos Llamas" <cmllamas@google.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260227-close-fd-check-current-v2-0-b3347edbb310@google.com>
 <20260227-close-fd-check-current-v2-1-b3347edbb310@google.com>
In-Reply-To: <20260227-close-fd-check-current-v2-1-b3347edbb310@google.com>
X-ClientProxiedBy: LO4P123CA0544.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB3141:EE_
X-MS-Office365-Filtering-Correlation-Id: 0843d474-5a00-4ecd-03bc-08de75fb0f08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|10070799003|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	X2+pUJFTb4PXWA8QbtrPACvLUHtFnhIBtkgD1Q+ZFOPPhdZlkZWGApA2aTsx/RtSk9T7l5+0dt8o7rlh0EMamy+rk8pNbZNKw+eU584RnodMTpbWYxKb7G0o8th1fq8L+apoTL+5fv59YP5lTCg5/UoFgFACOKDdgQBoTD7eo9GgQOVqZ4ZgY1NvhGW3Hj6lEz9ncKhB/b9evKiaGrkeiMZHAo0ikhg5pC8nkqSkW9p/Dfz7f524zjzKmOuICDGuqSRU/Adyvsjz8Ro4nrQVBCmg9KWhgwW33DqUhcHDwh6rkbXBCY8C+U6k2HsEfjRUuo1xAor1Xv6rrqpzbiThqtbXfHzH/ia7hU6isyVM3XKr7Thdr4v0mP4JFgbuFPpXUZclhQHGzop/zYoA/IhO7uOZbFsi77dR8cQOPER7kCgIMHarKIPKmBnnqXlyMiJ2B3OnVjB7WMCYdeUL7chdPV3HHGDzmE+9Gt6zijwmfUeIfxP4qWX5ibqSOOpFptZm/m2eCGVI5VeqrzHOub+ufdrsQ2VAsVDyqCK7F44QnyTL2SfHd9quwNrfAzpAcVr9fXjKNrRWoCEePg3uHZyI38vLbEJAKHcXa5/rWjqRltQOBNJ8IL91cFOWWCqlRJzAGAzoWUtYwGNvZ1XKGMEym9Bem21RgEiV4Jkl/d+hjpgNBVUxWWALm4HezcmIiu710qHIyjlVKc4BWJICdCpMVmRGAFPTrdFvp35k89cVFzgfLf7eo6orwwTPjElRj8WsCFSbbVwNHFvATpljL8sGTQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajBDOStxTVlsZGQwMElXeER2dGlvbWZxeTlsMmZ5dXNwWmZtS0w3cDZOSjFT?=
 =?utf-8?B?b0o5ZkFZQ2JlQnByc3I3VjVsbzF0TndWSHBmT3FEZHJaOWdvQ3NFZTJTZFdD?=
 =?utf-8?B?Y1N2elQ5VVBwNXBUUnU0MjFVWUgrYjBwMkhyM3lTT3hPcHJ1ejRCWWs3NFhW?=
 =?utf-8?B?ZUo2MUVJaTl5aE1PM3dWQXRqOWNZTlBrZTJKSEpzTWVJQTNyS1lvb01hSGR3?=
 =?utf-8?B?WmowK2FZZmdBc1VCM2dhRHRlcThRaXFJMlNNSkF2czd5dXlqc09rVWlLK3Uz?=
 =?utf-8?B?ZFNTMm5Ed3c5ZnFRWVc3Vm92RUhWWUpaRFF3U2pKMDZRZURZUDU1ZUs4ZmhD?=
 =?utf-8?B?VGtJOU9vRzJBb28zcEpZaFRwVzlMbzNJRW5GYkpnN01qZDFXYVZNeDFFMFhO?=
 =?utf-8?B?OThkSkQ2OC9xRVdJV0RLQ3ZVYmlNOU5yZ0tOZlp6RFovSWU3Mk9hTEpsTEVI?=
 =?utf-8?B?YU9MZk8zRjNrT2xudi9zUHRBQkJhaDk0ZTh6VHUrbXRqaW42a3NqV1FBVkdC?=
 =?utf-8?B?OFZjQ1BKOG1BTEhsa0ViUVZrUXp1R09YcFJGUEYzVldLUHN1eldHTGpZVWR0?=
 =?utf-8?B?d0NjQUNYS1JhQU5VZHUwQ2MzQlhYbGFNY2ttTlBaZEc5MFRlZ0xSaDFlYkpw?=
 =?utf-8?B?eE9HV2pRWUN3dGpTSWNldllpUDJOeW9SeFIyVGhReTRzMWo2QTQyVmx5NjRY?=
 =?utf-8?B?OTN5Yi9zRGRrMkRhZlIvSWtGeFM0THF3Z0g5R0ViZ0JZR2o0ZktzMzh3blhF?=
 =?utf-8?B?eGthcy96cVQzckxMNU1ZUWRkdExSdkF2dEQ2YlEvQzEzRk9Dc0x6TmFRWXk0?=
 =?utf-8?B?NXBSUnF3VUVrVGhIakJVclBrTUo1UlhlOEo0dmRMQU5iQTcrcTFuL0NzQTkz?=
 =?utf-8?B?TktUd0VSU01wVHZES3hqV1lRSzhnQzd5b2hkbjFnR2dpeWVWZzlkMkFPTFpM?=
 =?utf-8?B?RDFJeDJzTnVseUFMUWE3US91VmlQWFpOTGdnOG9OUGlXWW90cEZWVVVDb0d6?=
 =?utf-8?B?MEZtWkVSRkgyeExkY1B3MkcyNytBbFdYTGdUS1o4SHN6dU9peUtpZ0ZXTkR0?=
 =?utf-8?B?TGlhVG1kcFVnSElwbWllZDk0WkhVRkVQckRqUFUvd1o4aS9pVDhCYXVUOFlY?=
 =?utf-8?B?Y0NKWGtmbUVwRTBmQWE1b3NEOTN5bEcvZGdMeHZNZFhTaEgxR1k3SXlBZDZB?=
 =?utf-8?B?Y0F3QVVqWkF4M1N0RFkyaHRtZHAyVVFHeS9TYlJwdUM3cWI4dW84eEdSNld2?=
 =?utf-8?B?T2pOSTI2YXg2ZExWZ0psY2x5WkJ5a1VJRlFqNjZvcWhIaXZPMlJKbjBQaVY0?=
 =?utf-8?B?ZVd4WnZETkY3dGd2c0wycDJZUEZmTnFScjdHWCtENEVyKzNML0xTRWRlbXR4?=
 =?utf-8?B?anV5aUVCZGhzZHM5WWlsVnFkN3pyMGphbG1yY2FkRmtwa3JDVkRQeUJmeHpo?=
 =?utf-8?B?T29mS2xiVm1KTEVmYnFXclIyek1WdDZXK3JKdE9lRWFra3VCL25QL1o1cXRy?=
 =?utf-8?B?K0sxWTg5UmdBQkc4Sitnclp0bkd1aFJNNS8zSjJHeURhdll2VjJVYkFvSlZ4?=
 =?utf-8?B?UE1FKzVxTEFLeW1UM1NwL216ZEZUVmRCZS9DT00xaCtpQlZTZWRCZS9ZQU1i?=
 =?utf-8?B?dUl5dzBaNFhNL1ZJQStOYU80S0hUTGk5em9OMjFHZUxzM05ubW1na3MyVitP?=
 =?utf-8?B?RlFuVy9TODBmQ3kxUDdvWGUrcGtrUG5waG5uTThaUmNiTU5Ucjd4cGxYcGZa?=
 =?utf-8?B?dmpFdW4xdVltTmNmOVFBQU9sSFQvUU5NVU5vK1ZEM0tqaHBKall2Mjl1QU9Z?=
 =?utf-8?B?eURhUjBQWFF1YzVXRkFneElqN1hmaVFFVHRKWlRTRVpNN1NjaTgzdCtrc01Z?=
 =?utf-8?B?NXArYUZMSlZEdTR4YjZWQ3pTcFJDMnNjOVhsTnBHZU1ZNVdkN2g3YTZYQ0li?=
 =?utf-8?B?VFlidUUwL1o4WUxZN0UxRXQwQ1VJcExtM1JwdnhWQWtCYW5WSEdTajhKMHNl?=
 =?utf-8?B?Mjd6MlVQV2xsUS8xMkFmTGdzSEhaT2tUTHJIRFRrTXA4TnBNejJwTWVFNzRP?=
 =?utf-8?B?NUIvc2Vmdi9LdHFpYWdZellBQ3ZoZEY4aTBFZFJmRG04UUdheVVRaGpUWEY3?=
 =?utf-8?B?aitqUWFVTm5PcU0vZ01pMFFLRFIzQUJEN050dFg1QzA3cEJ2UjIxb3ljSTVE?=
 =?utf-8?B?MVFlZHJWTzA0V0M3Rkxha3JhRUxJbjF6ejFJSkNZOWFoYUJwQ3hTQ3JrZThk?=
 =?utf-8?B?cHA0WUhLQzFqTk9jR2x4N2JVWXFqS1hqSTNOQjd6MURveUsrYTlESFpSVkFx?=
 =?utf-8?B?cXZLVHFyMlBzaGpPNWoxSElKNVhNd1pTK2FUNzNvaGVOMlJ0S2FqZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0843d474-5a00-4ecd-03bc-08de75fb0f08
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 12:23:48.3509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQmkjxIhYa0do0xpEPv0FSSTA3HqAU2DFQzOjVBLK95e/MQdtYne2jHXJ8EERxZDBZzxGgji+3RYlFu0HAXghQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3141

On Fri Feb 27, 2026 at 9:34 AM GMT, Alice Ryhl wrote:
> Rust Binder wants to perform a comparison between ARef<Task> and &Task,
> so define the =3D=3D operator for ARef<_> when compared with another ARef=
<_>
> or just a reference. The operator is implemented in terms of the same
> operator applied to the inner type.
>=20
> Note that PartialEq<U> cannot be implemented because it would overlap
> with the impl for ARef<U>.
>=20
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/sync/aref.rs | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)

