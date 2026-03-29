Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021114.outbound.protection.outlook.com [52.101.95.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84633594F;
	Sun, 29 Mar 2026 18:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774808822; cv=fail; b=N1aoISLn+8uhpb5wRoEx78UZr3GjLAV1nwc03zZ7aAfmYtMEwXjXw/EN9/ELj4qCD8U1tQBbEPKBArP0nQ3Xe+4eSsTfW9x6061Q8uoTNZKpvhThnxb5d7vPoM+F99ftineUJ668gXw4lYGyZLYSBRYAP3nP+hiDEqOD5A6w+AQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774808822; c=relaxed/simple;
	bh=W6xG2Uhk7Fa3D2fbJnC9UVhyZKszFLxceKdvVNOmg9s=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=L6j0lcKLHPU0QBeVYJh4Siy+AptlAoLKyxUkZDvZDEfwF6sgx2h+KVfGfGrl9D4jDH9oT6JzmDeIL7ZSXySd81g/GUXAF29aKm0055V4S2AmaS5nacw4XarAtXe6vRiEL/TFCY2aTIZMbmUcT8J1apZKiMhCaRpvRs0tH/sFrt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=M6AveoTa; arc=fail smtp.client-ip=52.101.95.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="M6AveoTa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ue0cUEqSGIbrEm6cEOGose4/wY8JdWvgEiOuZxw8hkZkjM0Q6z8oVM2mhdKAWr9xT5zdP3KDVGE5izHEtEagrSc5AzjxhRI8i+l4D/eNAEtjSvSUmg76klgAm2MCwwTYR6GHMb54/YJ36q+w8BQxtKwi2xp/U4wmXu3aNGHOoVjoajR7BZUJSqN6TPN5XT8TLtQhBP6sVm7xZkHmmPGURVdbu7omonXmjpZRddnO5F8x/t2uOUvhFC/Y3iqlPJ1ZzxHKu/R8+54yfhctyJ9qu44VDHOmydP6b6RP8lyJNnR4vtmRmWsCBR5rzFwBZvpvBWo6dzYXpLRmidpoYEy+cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LpROU6M76Dm08BIkifw4PgH1ldUk0DGr1WrRYnx5rvI=;
 b=b3OPovNtbRmC8A7Xk5XLnAxKWPzjJczS91zLg9TadpuGRXmnzjbXcisU8JPtPFtaPLsZGKqPjIcQiwVr0UP4XL/pI8/wCc5cVGXL5D++HvxAWd9HqcUK5JMXQN4l7laQZy1gAxZyA4kWoPPxF/2j0Qgzx03gAU4tkMiHjXTBMykWcYNeeMMVAuyGJvMIDNyBViqOfoU1XQXzIiHK6lDXJov/YHPYX9qRrHZI4zjlzWXxnYnq3ufGDb5Zo0P4zZl5jQbFTEQb3ZzxRUQekaBUWhMCYtyowawJj0amFClhJOfp3heVq0AdLARoUVXFEGqyWeDSWehghtJrvy0f1r0FCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpROU6M76Dm08BIkifw4PgH1ldUk0DGr1WrRYnx5rvI=;
 b=M6AveoTahKXPqOgiVeBILgx3AsS35+LJvSYifeWfjytM375yleGhTH+A3ny4CR97H6TGQxRf54rS/EuchSf7iSI/xQxEAUWFwpFDUFZRQBq8wUWrTDIoch5W1gwxpnvbvvgXpyGvJC3+Y2p8lrfdAcx5c8YCdk7zcLhzis3226w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOBP265MB8493.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:46c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Sun, 29 Mar
 2026 18:26:57 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9745.027; Sun, 29 Mar 2026
 18:26:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 29 Mar 2026 19:26:55 +0100
Message-Id: <DHFH7TSMMSLB.355ANAWQS0N7B@garyguo.net>
Cc: <maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
 <chleroy@kernel.org>, <peterz@infradead.org>, <jpoimboe@kernel.org>,
 <jbaron@akamai.com>, <aliceryhl@google.com>, <rostedt@goodmis.org>,
 <ardb@kernel.org>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH V7 1/4] rust: Fix a race condition in Makefile
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Mukesh Kumar
 Chaurasiya (IBM)" <mkchauras@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260329160254.2592207-1-mkchauras@gmail.com>
 <20260329160254.2592207-2-mkchauras@gmail.com>
 <CANiq72nxgwPUv1AJhRQSFNWtV+w_a-VqK3VWtjaKncRJkNNETw@mail.gmail.com>
In-Reply-To: <CANiq72nxgwPUv1AJhRQSFNWtV+w_a-VqK3VWtjaKncRJkNNETw@mail.gmail.com>
X-ClientProxiedBy: ZR0P278CA0103.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOBP265MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c5a4f49-43cd-4aef-e70b-08de8dc0c29a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Eo5oMPl7PCB9vz2eH144JqMdwhybu+HHUqyImoww0vHP0gBfcsipukN6tFVuYjJB0cowoYrWEG56NhZ2RO9I4gfGb+NA/5VafLLR951mOEmWihXvaXks8cFAyS6l8M4WMbaqUCqrbHf85xCCD/C6wMjGTykYWOJzCjZp92squnnVrXTFu0L3kXmk2HAmT3F7APVK/jpO7ARKiyOyk2j9opPhpjAvTVR2WnHQokBoKhyhDFryQGrsyI9x5rEGbzhAAe0vAZ44ZiKfx4IGAyaThwqom621obF+UL65End6atM6cJnVwYLsfWoRc2KgddaYgi89cA96XKDqnIHkNCQmnitVPdSXb6Md4j3aRS2ZEFDd0YT8r5fBfYWxt5sHXDOxcfbU6GroMtbZAPqC0ctW7WR7yQdXSKtVKplkADkJo83FuNFesRFBE0HocdlqHZOOUE1HkMcCHMpy1IDg/NI6FODjps4IIz9Ie95N4Jd5Usw7MzMqHPhplEWPgwRFm5X6ywighh1eWUspPbZDGcAKuM1uLWiJ0+H/s1tgQAoEgJjA4HrH9HGnL5B5DqXgD2DFILOxLmtHdTgpxJPLzrm0ok6nIHQmmy+JPeG8dC4drJnJl6M3jt1h0dk+4IBHBjS6c29IbbMXhZymObd7WbEz92wiG1FseR/xu2P4mayfmnmm2OBeK7XsxFER8Xbfrtn0gl3kKPGeZWhPgZUsVEQwD68MIttY+pOPVhkVI5WHinA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVJVMG5tQmpqZC9vczZuZ2VaN3h5NUtMY0JqNXJuYnIwMVVTL0ZTQzcrbzVw?=
 =?utf-8?B?SWZpSkJmYngxVU43WTZpOHBZSDdLeWdFRURZN0J4NXE2c29SUFdlSE9LVjlt?=
 =?utf-8?B?OCtJc0ptaXlQYWFLaU1XcjltV2ZTOFFTSlZPZ1NnL00yOUhxZHpCSUtLNW5x?=
 =?utf-8?B?ME9DMVZLWVc4b0xsdHNQMTNqRXJvV0RJeXh2aEYrbUFuMkJkWXJ2VVJuQ0k5?=
 =?utf-8?B?eVJWQmpLbVAxL0F3V3R1YlBpL0hOWnQyT2p5UTN1ei9WVFNsOHRBcGNlUlR5?=
 =?utf-8?B?U0FKNS9KOFpKS3BDQ05aUmp2SzVZNHptQXNQTFJmTk50eXh5ZkhhR0FoZGNV?=
 =?utf-8?B?NDdJRGM0Snc3dW8vbllRQjhHRGsvYTZ4ZmdTMjgxaFNVM0dQeEpJeDF6OW9I?=
 =?utf-8?B?YnRGa2VxcFdRL0xMKy8wWnNJUkZWOHY2c3hwYW1ibnhJYnB3TzlQZUhZVUpC?=
 =?utf-8?B?d215M0tGSHdPZ1dPY3k2ZXpCUTdXMEp6SzNMaTUydVhFVW5yWnh2alRiVTBl?=
 =?utf-8?B?R09RQWdWOXEyMkhrQmg3OCtWRmhTczJ0eGlZOW5lb1djdGxYUUx1T3dlTytH?=
 =?utf-8?B?Tm5seDhuRW5MTXZkOXlmSlFKbS9LVUZoSUk5bEZ2OUhxUnR3cS9MZGNsVmRQ?=
 =?utf-8?B?OXRIR3ZLbVlxWlZNcllWT21ISExCZm9UWVk5UVZsNDAza2RCK2RLbDFJZTBI?=
 =?utf-8?B?M0dNK2MvNzUwUnVKd2p0cTJmaHNqVnlZZUtLMndrb1lURU55eGg0M1dqMmpJ?=
 =?utf-8?B?d21OYVFpUU85ZXRnL3owVkZ0YXkraXlBNTIzTTUyZitJTTZJRzVKMWpHajNI?=
 =?utf-8?B?Q2VMZS9wVzZzdVhnbTdmNnR5M1hZU2FwZ3FvT0dLMGtBQUFKcU9JNFZxUHZJ?=
 =?utf-8?B?TUFnU2hBcFNDZVZQMGxGT0NiekpFeFo5V0t1QmU4Wlg5QzJUN1J1OUZicCty?=
 =?utf-8?B?MC9RczNlcG9hbG5VNmJlUHhmWUxSRC81ckFSQ0pXTGJuQUhsMHkwbGlYeUJW?=
 =?utf-8?B?aktSWGdwU1Q2a1JWaDNFZ1NCOEtEMStQZUZhRDk1SkJ4ZXV5R1Y0aVpqdG5n?=
 =?utf-8?B?T2F3SjVvRlJpYWRIVGlGdWpxUW9RK2puNHJzMEw1RWVrNXpsaS9OaHc5Um1E?=
 =?utf-8?B?OUhoYUliYURGSkxDdnhKcjd1NDc4WTRQWlFCdDhjWU04RE9tWTQ2UStFcUI0?=
 =?utf-8?B?azlLZlZrUHpXaVhPNU5MVVlBNmM4MDhKT3BGdFRINmM1K0tLMmVmK0lRdWp5?=
 =?utf-8?B?dnRXMytzVllBL3AvdHVUME5HTGhoYXRXeFlhRnF5cWpPODNlTUtUWElGV2xs?=
 =?utf-8?B?SG1BUTc2YVdoZmlEUElNSWVaWm0zeFVoMFlMeXFxelBsekZOckhsaUpqWGlZ?=
 =?utf-8?B?ZmRFZ2FuWExFcjNDT1Bva0MwU0pMeUplTVgrNXVGaGZUTXViRDJHK2k3ZjhI?=
 =?utf-8?B?ak5iNVcwSmtwMW5ZdHhDUWFEbytrbit0dS9KNXZUbVM4ZHU5MFE1RCtEZGVa?=
 =?utf-8?B?NDlSTkxDbXFUY1RZVjllS2hPSSs2Vyt5ZzkzU21OanBJQlNqUExWSStiQ2xZ?=
 =?utf-8?B?Y1VDcnZQQWx6OHZyNGIyLzdCakF3WmdFZjRpdlBjbDIxdk9pdUxnbkozMTZD?=
 =?utf-8?B?cnVqL2p1M29ESmxoTG1Scnpic3luMlNCa21vWE82Qzd4WTlrMCtjUVVmOFJP?=
 =?utf-8?B?S0dPRjR6V3BScXdsekh6MlZYMjVSZ3FtampnNHc1UmhVYko3Vld5VUtEajND?=
 =?utf-8?B?akxJZXhvdlNxYTBwK3AvU1BaQ1ErOTkrbEJ2ZkhsSEpPb0NzYS9ESkJFZ05O?=
 =?utf-8?B?OUpzYkpTUjhhT0N2eGdLR3NiOTF6Q0RiRmpPL1VBRWFGUDkvVkhWSHNUMU9k?=
 =?utf-8?B?Z08xd2E5UGZtRE9OKzdScXpBOVhrOEZaRTNiR1c0SVZIeWxVMndMZHZPR1Z2?=
 =?utf-8?B?K0JtNDZyWUF2QlYxQUJEV0pxV282NjZyTkRsdGM5VDh6dXEva2s3UDdraWxG?=
 =?utf-8?B?UTBKcVBwU08rSUVVYjJCTEhtSmxlYkMzNTkwZks1Vkt1RGczWjc2QzlQcmNI?=
 =?utf-8?B?TkhHa0JmWlliUGoyS25NQ25HVisyU1p6Tm5YeUMvUXFIQXozTlFXUXhqeVNj?=
 =?utf-8?B?NHc2V3BWTGdORTA2R21KOUFIaEg3OTZTalpwQkdLTkRWZlVUUWRlN3k5UThH?=
 =?utf-8?B?TFdWWjcwR2RJTmZxQmNVcnVOMXZqcG9xaFNJcHp4alR4YnNySlVHYWZDYWpJ?=
 =?utf-8?B?UjMyVG9abTdqRHhzbGhvWDJHaVRUTFBaV2E0OE1CdzBTZHpxcHJRN2ZkYS9Z?=
 =?utf-8?B?eG9HMWN6clU3U1RRdCtKemlwWmJ4VC9RRC9EaFZYU3dtSDdFY0VoQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c5a4f49-43cd-4aef-e70b-08de8dc0c29a
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2026 18:26:57.2720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fzvTrvKmpoXH5A3tOKbPLj8fSLtmD+CeeVnoG0oCK+wmEcAYgpLbwv0A3JwXxMlRpe8cFvzi9K/3wZrSfumfSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB8493

On Sun Mar 29, 2026 at 6:25 PM BST, Miguel Ojeda wrote:
> On Sun, Mar 29, 2026 at 6:03=E2=80=AFPM Mukesh Kumar Chaurasiya (IBM)
> <mkchauras@gmail.com> wrote:
>>
>> When compiling with -j1 flag in powerpc, the libproc_macro finds the
>> libcore.rmeta both in toolchain and local rust directory. libproc_macro
>> should use the toolchain provided libcore.rmeta.
>
> By toolchain, do you mean the sysroot one or something else?
>
> We should make it such that `rustc` does not try to use them to begin
> with, e.g. we added `--sysroot=3D/dev/null` to prevent that in the past,
> please see:
>
>   71479eee9da8 ("rust: Suppress searching builtin sysroot")
>
> In other words, we should try to avoid adding dependencies (even if
> order-only) to workaround the issue, but instead we should get rid of
> the root issue.
>
> Otherwise, after a build, if we rebuild only one of them, wouldn't it
> find again both? i.e. this is not really a "race condition".
>
> From the original message, I see this was happening when building the
> host libraries, because the targets happen to match, i.e. you are
> doing a native build on powerpc, right?
>
> Perhaps we could put the host `.rmeta`s separately, or something like tha=
t.

Yeah, we can either remove `-L$(objtree)/$(obj)` and specify `--extern
dep=3Dpath-to-dep`, or we can store host libraries to something like
`$(objtree)/$(obj)/host` and use that instead.

The latter should be an easier fix. Also, I can see that we're already havi=
ng
`-L$(objtree)/$(obj)/test`.

Best,
Gary

