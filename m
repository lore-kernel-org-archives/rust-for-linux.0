Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011053.outbound.protection.outlook.com [40.93.194.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4816A3FD123;
	Tue, 28 Apr 2026 13:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777383521; cv=fail; b=uU7Z3N8B9AtnTTtsjsc8dmojtMPTUbB7aDfjcqEhJDLGB1t4sxrD/I8qvSbHdhIrcDV1PCzhHa8qVg9ARYWHryGjHbIPookbZCwOqCKXhPJpPYmgOY0iRISr/OaeULo15Yrf12kaIN1mbuvME4Z7EgjeAg6L6vYPjEK6nVAgnaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777383521; c=relaxed/simple;
	bh=uv+VvjDsSyvIjQKpCS1yVoET8x4ebs0FJ2iGw5/WmHA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=jX+aXM/x31bezqKZsWtuUVpsjopvqgJpNODDhCRjJxZtoUBr23x/28uVpIEMqg8yPrhGEwJp8vQSsuxooGoISiTeUIyz9UQQ5u5DrZs2MTCH02dxIwDU2LS83wVuTKufKurMzzlnJEKKMHJjJucjTZ8OB4eRZtUe/vbkCqFc6IY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HRXeywpa; arc=fail smtp.client-ip=40.93.194.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HRXeywpa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mjYs+6B0EpsEbHtE7h1Z+FGWIODkNQUKA155xFhsuHDDhtVJj8M3ZPvIaERdnY0MUBz/IUo6V0KcbtJfDuUiF3L6fMKGnnklumgKp15xV/o5eGlt3w/NUJ6BgpYk5oe1Kt+MIh+MUTjZUDBekkVO3Fm8Qa66ABthm02SlC5is32CZd//GVOlqoeAlRazkuD1X7eC9DES6eUqiMYjkpkjeVlhB43W7f9yv8RL4Rihpewlfxydan//ibn23LQgrxVA7Fw4qMqkUaVBhnGO7PFqVRY6wXvDqDwZ998scPJxB9Xa9MMZI9F08/G59NZNjJNKa7ayplTheJyjT8/LWzNu6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uv+VvjDsSyvIjQKpCS1yVoET8x4ebs0FJ2iGw5/WmHA=;
 b=gb6uxIx8lXJorHa4GIxaf64FuGFsMZPVJ8SxKsuGEs4TpqQl/3cjwaa57TCoVBRLg2GdTnZmGDOvqwbKx8Xxv6VDFbg5dTF+OC0a7YEsmSDDWIlh1jA1vxyeUO1bEu5h9WEC56VfqedELpaIIr42CIvUtC+n96YasxI+IvLyRBm4ycg5V90CeB63h+BgiZka2QiVA1Z0d1W1IoKwPH+c0qtBq8lgDXLtIt+4UuPu1+WAhXTBulBqNkvXTJAW2gRBq49HUA5zs3RxQ0oHfd5dgZynKR4f4Gdx/VAvA6jgLj2SdYBQiN5mgc9Uns24trS/ps9PZBI04scFFxrajk9ioQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uv+VvjDsSyvIjQKpCS1yVoET8x4ebs0FJ2iGw5/WmHA=;
 b=HRXeywpabozgIyRBCYsAtFc2RdPTUexrIfS8BisvlDb8zRinfmR1xPzcwASA6ZTS3vTsnmWd20W+/jCA0T+4R3eUoi9cxrXawQ+JnhutgiaH+uKAn7FM+22sNwP1/qyeRLON+8rgRhHekAtB5Qrg6vJgzpV1Do5YR2WumC67YCOTyyMxGlUup2b5mlIElLT+GDogtuKm9OIMpacVqBqzSLEadUY1Ma30c+HEv+v71HrGh5ikKKAJXesP9UoD06i8NgVhu2muIiSnGOBYAbs3GDGMJsgMYW2yKvQ5juaiqESKYQQ8UngYbSg+HVt9gcxPqR0IthHP3BMXGmsi8F8i4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB8500.namprd12.prod.outlook.com (2603:10b6:8:190::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Tue, 28 Apr
 2026 13:38:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.013; Tue, 28 Apr 2026
 13:38:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 22:38:27 +0900
Message-Id: <DI4TVB9AHR7V.SEPGAOR4NW9X@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Lorenzo Stoakes"
 <ljs@kernel.org>, "Vlastimil Babka" <vbabka@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, "Uladzislau Rezki" <urezki@gmail.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: alloc: fix assert in `Vec::reserve` doc test
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Hsiu Che Yu" <yu.whisper.personal@gmail.com>
References: <20260427-doctest-kvec-reserve-v1-1-0623abcd9c2e@gmail.com>
In-Reply-To: <20260427-doctest-kvec-reserve-v1-1-0623abcd9c2e@gmail.com>
X-ClientProxiedBy: TY4P286CA0115.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e1c0930-4204-429b-9aeb-08dea52b7009
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lnwMr2/2MVkdLVktRrgFkTUSj4FpfGXNNADcr9SbArDoU56y+uYawEet9naU0L0OtRHkjV9sXdlULcKN0VI5svTWfYMZqsXkX9FDoKKN8g/82jJ95xLif+EZ0jlsTZMBmwhrTgECAXaMD5EdvaIu6kLJl+YgdU+Q90VwwewHEcBoP4JJsbRolAfL8EhoZN8foxsXNzTfUKWNA9btvy9JgxaNXqDqYEb43aHT7+UccGkGBPMWPfgorF9wrfj9GaH6YaaZr175c4NgX8tVvNnt4srYz3cQwtESC7tfrdj3fQVFNDRjl433aDhTDQKxMRwAFAWEQLX0ySQQ3qhzsHvxKFyiw8pZkncxoFY8A/8y8CGW/E4DF0MheeTXYBxTqMh/NAvcLMaWC4dJFvKIzCdfsfqjk+OYXWivzJ/x1MU6oTa1cR3bjWgiCSOVArEtjW8US3gHEGbS4hoQjELciztTpillGePLlUK03Vjr+q9aBtllQrP562fNBAKjUXPVs0GVPBraMSdtX/gXJ8yP9Y3jT7D4bU7ArdftPy1+xpeEq0ntIAov+BWmzTzpbvAdM6pP2g5AyZoExKcSgO0UescgxRKI6qA6RIq6bh0f/ErFclJAe2JiK3dB7F7FjfmDFfrUayGvNAoIscG4QOSNhWunEngvqSY002Lqk7oPoP/4As1XpqTdbEqIqUeJMABBELoFLirFggUbJ1uOfH14aXmzodonnCIoolmVXdRXn2uIs6o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFpTbEdnazZzaHBONDM4Y0pHMW9DOC8yemlCKzlNK28zMVc0QUlwZnNZQmcr?=
 =?utf-8?B?MzlHZU1EeGxWYnpIMUVybUFMZUp5S2RyWUE3QzJEQkt6Vk5tT3EzVjArSzRU?=
 =?utf-8?B?eHV2aW5JUURlU3N5bWFRMVd3VE90UWFEVW5ibTZ2TDZxTGM5a2dLU21VeENx?=
 =?utf-8?B?SXNIdlRCT0oxSXVEbHZYOFQxOUNUclIwSHU4YVRQbFhRQmRLd0V4YXJhK3JY?=
 =?utf-8?B?cDFVdk4zenBRd3Y4VEhuenNRYzNqS3psTkJmK3BsK3hUMHVOVzQvUVpjNXR0?=
 =?utf-8?B?bXIrYkFjMktBME1hYTdMNzNIM3ZFeVpGaEJVK3VrdlhsQitWNVNSb0Y3MnVT?=
 =?utf-8?B?S0N3SUpqTGV4N29uUlFWQTIzYU81bE82U2wyMTYvVk03NzBmT1ErcnI4TlBo?=
 =?utf-8?B?cDlhd1NhN1UzYXhaNzhaVnRJallGcU00Z1FlcmlyVWxCNENpM0U5cEhXUFRq?=
 =?utf-8?B?V1Z1WUJWUWhmdjVjODM3TkxFTndEb010ZENEOVo1eWlKQmdSc0h1OWQ3Z0Va?=
 =?utf-8?B?enFRTDhxWTNFNmQyeFJXRS92ZGpIS1NwaFAwMUdnSHd6Q1orYVJwWGFQektx?=
 =?utf-8?B?UUVjLzdmYmxvMW1Qb1hya0lSTDYxbnVFTHhNQmF2UkdJT1RXU2I1NnNtYTBI?=
 =?utf-8?B?UmlZR3VDWFZ1RVBjZktVdTlDbldxdzVVR3NBSTZzTGlzZ3NiTmhHd1JyY1JC?=
 =?utf-8?B?TGV4dWczSkcva1AxRVc5ZGVnOGUyVzJIZTF3TkdYWTl3VklkdWljdXkxTWp6?=
 =?utf-8?B?VzlBOUROeXhHUzZQd0lKenk1TlVyOU9ZQ2w5Z2dVR3VXOGU1aWJVd2V0b3Vo?=
 =?utf-8?B?enBCcnl5UkFNMmdreld5cmRQZWc1MmkzbGZ2ZGdqSkVWb1ZpWW1WSG5sYmk0?=
 =?utf-8?B?UUZtSm5HdnI3dnpxdFcvaEt3VS9weVloZDZKd1ltSlVNT0RIYjl2WnV3dVBu?=
 =?utf-8?B?QXhIZzQvY2wzcXU3d3hqNGZPNVV6U0Zwb1BRT2pMY3VVSUthQ3hJb05uczEr?=
 =?utf-8?B?cmRLMEl1QSt2VnM5OWErWC8vTThibXFEUml4bUU4ckhMUisrLzBkTm55UEtu?=
 =?utf-8?B?dmtOYnU2NW5UR1NiUkJrMnI2bWIydWxtQm5iWmRVUEFTTlZORllnTWVqNFpj?=
 =?utf-8?B?SjNLT3A0ZEc2M3N0bE1Uc0FpVExka01RSVNHSGVqV2tTOGxUMGVDRDZwa0hz?=
 =?utf-8?B?MnlzdWNxdWh0V1dXdmxmV0FuSGt2TEFSV2lFL0VPNHRvbVMySkVEMEkrWisx?=
 =?utf-8?B?U1RENXp0WTBpdkhTYXR0TEpnWmhSYmxGTEV4bE84dXFTampnTUMxeFNZQjl0?=
 =?utf-8?B?T0QzYVdnSE5UNjl4NEk5WmM2L2RMUTdBcC9SdlBkRUc0S1RkVXNWalFFT0hj?=
 =?utf-8?B?N0dTWHJFYjlvblZHekdXU3dNU2prUDdwaFo0WnJQcHZuck9qMnhUZUZYMm9N?=
 =?utf-8?B?VHRZMzZrOWNHOTV5NlpPeUVEeUIxSmNNdGg2SldMNjNYTDMrK1J4WWxHNkE5?=
 =?utf-8?B?MjAveW52bE83NW9ranJLS0RIZnFCVmlPVjc3TGNOMzRZbzdPLzNCd2R5TlRU?=
 =?utf-8?B?ZUkrdGloYXI0S2N6VTA3TktwQzJ3ZHZFSWllNDQyTHZkSmtpVndSbGxBV2FQ?=
 =?utf-8?B?Y3cvNnBWK2JwSnozZGxUNGJYb2xuUm5pYTNiWWZpQlNUVTYxV1c4K3ZEaE54?=
 =?utf-8?B?ZTZHeDY1VHpiMVI1TDY0L0pTZjY1TEFpYndRVjFCMXVEaEJqbFB2WmtKZkNu?=
 =?utf-8?B?aGMrOHhsNWpsemllUmpneUY4UDVCMmR1Q0x0elcyQmNyak9pSktkZ2hTNnQ1?=
 =?utf-8?B?dUd2QzM4cERNazRQai84ZktNQkxrdlBvajltTW1wWmk0Vk5UQWsxT1d4TEV2?=
 =?utf-8?B?aEMzWFlVTmZwSFBSZUdRdGVlcHBlUytBd2p6YThYWnh1VEFPSVovZFo5NmVm?=
 =?utf-8?B?TVp5V1hSS0pSZWc3eGdzeWRaZUtLckVHM04reE1xRTVvMlBHNHZJY1dpRFlh?=
 =?utf-8?B?R1YrZ01QdWVRVG9VVy93YjFQKzU0L2JTTmd5MTZ0K0gyVGdQdkU3T1hUMElp?=
 =?utf-8?B?bHhDWFJwSDBtZHluY1UycmtTOGwrdGJvdy93VUZya1Fad2FtMGEvRjhuSHF3?=
 =?utf-8?B?cCtsRTRpSHE4T3ZHOHlWUk41Q01yREJPNnZlQnExQ1V4Vkt2WEIvQzAxRkFw?=
 =?utf-8?B?SDZnQVdEVFJ3WUpmcWkyblR2TytCM2JtTmRKN0lUbEcxOVVjc2pzTDdiZTJ0?=
 =?utf-8?B?OGhqQTJCclY0cjgxM1I2TGd5cG8zQWlkVG04cWNkK2xidkc1QUIza21QUXpF?=
 =?utf-8?B?MGhnVk5QMEJyK1o2TEl6RUdSQnRFWmFyWXd2a0VBK25IcU9yOExLM2hza3ky?=
 =?utf-8?Q?+p1WywvBaqFdQxxS7G0Jq02AATERoYcbkJuaxYLKPkONo?=
X-MS-Exchange-AntiSpam-MessageData-1: GXMfuZB3mjhqlA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e1c0930-4204-429b-9aeb-08dea52b7009
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 13:38:31.6733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0fj9wjWSScyRZBg4ApyB4+kEf8SWYQLX/u12Eg+VtKOQce9O4s9SVKQKuWFLmxK3v2T31cbzxphWJ6QewIXYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8500

On Mon Apr 27, 2026 at 11:15 PM JST, Hsiu Che Yu wrote:
> The assert in the doctest used `>=3D 10`, which only checks that the
> capacity can hold `additional` elements, ignoring the existing length
> of `v`. The correct check should ensure there is room for `additional`
> *extra* elements on top of what is already in the vector.
>
> Fix the assert to use `>=3D v.len() + 10` so the example accurately
> reflects the actual semantics of the function.
>
> Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Closes: https://lore.kernel.org/rust-for-linux/CANiq72nkXWhjK9iFRrhGtkMZG=
svNE_zVsu4JnxaFRfxWL7RRdg@mail.gmail.com/
> Fixes: 2aac4cd7dae3d ("rust: alloc: implement kernel `Vec` type")
> Signed-off-by: Hsiu Che Yu <yu.whisper.personal@gmail.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

