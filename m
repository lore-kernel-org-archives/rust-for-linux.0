Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020125.outbound.protection.outlook.com [52.101.195.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B408F3E63BF;
	Wed, 13 May 2026 11:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778670285; cv=fail; b=ouA18FCV21Ki/yVOZy+Etej2Yb4PEbp4+sPHEYt5Ja4j/5FZLnLSRdGeJM4PkaG2kttb1OvF91UJgwBS3kKAG/6zM8feGlsZMUAG2AV/HJgVyhO7T+q5JcvbPNzZM7A/qgXDMjkX5Zu2l/JNiZ2PZD6t9zsqkjR2SPJj96VbddU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778670285; c=relaxed/simple;
	bh=tgTt1rkPupenQOnY+nvW4ad2GQzTTsnIi/ahlBCBexk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=QjPthEaH56R+Ha0IB0mp4lPpC5VLyK9QnosqC+xXCJUEOimcq6/CvS1X7Ps5DQuGZIrNIGAOCxbBns5EhDuoa3b12OBruz2GOOgUyuDwxTjAO7oUwxc9FNQa4MCxnzKfSFt9N6gRtQGJ5rknCMxFWTw3dXt7MVlGOcfuafrObjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=woX35wyf; arc=fail smtp.client-ip=52.101.195.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="woX35wyf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QnaB5+xKv9EHX+hSI0i5QAW93XP9Glo+bBUyiWTP0qBXUeGfr6kJcNRCpzEVurju1rVLzdeJAVnW/MMZjdTLrENlx5jfCZnE4bDRRTFvpdVrgVt2YUvsZUy74OkS94a6q5ezk96DXFKLmkjikT5PfLh5ysm+e3yP2UOic5R9ypHOc0w+FNm+D/0MGEJDsaHTcJzVASWmL+krFvd7lH/FePl0BGuWc7yXOrg1maOKL6xshlyXnjc3gDzZBv2h3lgEALDKrqfxGbwBEk8E97Kf6ROaZdIicwzvMAPZ3PjulaC0e11vSWTgYfX0TFdVehZQyQfuItBQb8Q3FR1OrvetZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LabyO5cM8KPSsVY/+yO+COUaWoV01exXg5GJ3DzZDRA=;
 b=BjilbSFheUAFOf8pU2V7rYrSxkCSTPNmm4oDvYlrIqA6nY57dNLyEOWeEyPAflYjkKKX5cFwO/deFxvX0GJW483sr84Amt1xOrT1ze3wxGd09HneLC0f3qasw8jlpeeg1FIP+htrOiRegHa2RhWW7JEjtEjjFbDxTOMyDTQoR6d32jWQMGAi7QSrXd8VB+mmIwWqSGEBbPUjGumixlm6CA+4J+3FteaSD7RUGHAehUslGXhHWqH+2Tzt7UgFiX7SrFPSdcygGiSUmKoppde7kQO9I6y9jJvfqVJnQQP3YRBeAQ915kUR9FU3S0WcJDdPfXD6dxOPPhGIJo4367Vqcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LabyO5cM8KPSsVY/+yO+COUaWoV01exXg5GJ3DzZDRA=;
 b=woX35wyfC1wwZ9lKW8vTuQSGoChx6ugYmqPEx23e0MxIBR4tdjU2O24d6RH9nxBzUNTAvs6JRcvevvfUuvlf/IczIw5IdUMvwsaDn8LjJp/DhN+jc/rdl5Q7dJnn9xZKskqMO0O2IwZqSTzFtd8OYM63JwZv0iiwp+4TP6U3dXg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2565.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:88::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 11:04:30 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 11:04:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 May 2026 12:04:29 +0100
Message-Id: <DIHHZLJR583G.2PP9PSQG3HTSR@garyguo.net>
Cc: <ojeda@kernel.org>, <boqun@kernel.org>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <corbet@lwn.net>, <skhan@linuxfoundation.org>, <alexs@kernel.org>,
 <si.yanteng@linux.dev>, <dzm91@hust.edu.cn>
Subject: Re: [PATCH] docs: update rust-analyzer command
From: "Gary Guo" <gary@garyguo.net>
To: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260513092017.265269-1-work@onurozkan.dev>
In-Reply-To: <20260513092017.265269-1-work@onurozkan.dev>
X-ClientProxiedBy: LO0P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2565:EE_
X-MS-Office365-Filtering-Correlation-Id: 8977b24b-954f-43b1-1ce8-08deb0df681e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	y0kLgQSXzBRTpZeBktDiavz+CvAGrGjTMHGVwcdcmUXvxHSz3tGYPjXC1onw0nrWjX9XPE1EJZVHxPfPa4af2FmfBw+jtWx/NjWFi1J+JztqbrRP+MeRtEt3Ag8+uMa+vo5/e2UJXhpc+ERZO4j1CQlcj6kprYCKxL3JBDwoh4ueBDlqMcykn515RFcT2piCmSxvg1xJ9+OD01NMATMEv1cyvWDxuVGH8VRljh0srj6KGhKrcxUZVAzqkavyDoTWAHd8kTguRoO3hbLg8rg+pN0ou7NlJKvnX9Ahr20p1pjQX21qysf4ID1o2A2TfuFG+Suycx78ZUnwQtdnYpdCBsG0hQELpjSHnUWUwWBU+GRDOuYePi2fFEitBdcaKCUqIHROqbXseDhPF0ppxCAcIIMpY8QYjhs2abRVZK6T36ZVgt5jSXu8xjtpVysO2qsWnHlf/Gn6UTnsouXX8BccccnOIeX/5Ayj/D9VNTZCC2XPgp3Vnl5TvqWLGu9dZKMuDdgbuLfIAzywOGges9KLwRZe26eUTQit4qTGFRaOSHgg6n+5G94t7ANZ/fVH/aqSrLqGOcK2KEryKUwPfUpUFf8Ows77hMkda63ocM+nqB3ogd9cE2JoTfS6s4uJWWP9X+I3Sb8mB9Yd4AsmJRVsvw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlJtMlR1R2phSStpdHNSUytCQlBqWithM0E4YVJTZTZTYkNWTk1Ddzc0bTR1?=
 =?utf-8?B?dTJIa1VtN0tUaXhkK1dmRVRnSjNGazVWeUViUTBtTmFDOE5sbG1CcGJxR3Y0?=
 =?utf-8?B?QkEzVWpBd292T3ozUTNnbit1SzMwWjBjbUtEL2FzcjZ0eG8xSm1NOEE1Z1Vz?=
 =?utf-8?B?M1c0d2xVMGZsTXhNNGN0SVBNdG1OV2R0OGNnTnlVeS90QkMwaHBqbDlNTEZh?=
 =?utf-8?B?WnRTRG9oZEN6czhCTUNwZkdXeUpKUG9VVjY3S0dIQ24vb3lyVEkydFJIVWpa?=
 =?utf-8?B?MThHR0RpTWx2UmlzQUM2WnM0aHJXRXNnbFVIUDdaN1hRU0d3amJ1aFg4OUtl?=
 =?utf-8?B?R2kwMkpHRUpKSEtLTklTNzJoZXRoaHgwcjNHZnBPc2s1TmNmY0lnaHQzbW1x?=
 =?utf-8?B?M0ZVaW9oOERqWjBlWGNsTXEwNzlGSmZXcHVRajYyTGZnRnliMkFtL2ZZZHYy?=
 =?utf-8?B?YnZXZEJTQ2Yxajd2TzRDV3ZIUzhZekdDM0ZBenMyVGZZQmVvelF5Q0F3V1Qz?=
 =?utf-8?B?YXh2ZTd6L1liWThEZ0t6Q1dpZ1h0bmw2Znp2dWk1U3d4MDBwL1ZaNk9rMEpM?=
 =?utf-8?B?S2RpdGpyM3dDem03ZmlyVWhaUkwwUlR2NUN4WnlPcTYxcG5uTEhCTEtyWjU5?=
 =?utf-8?B?REt0cWljbWRobTVHUzdnWVBrWEVGSkc4TzdtNFlmWDhZeWVyWFJ1WGd4dnd4?=
 =?utf-8?B?Y25wV0VqVjEwTCtWM3VyVEdkRlhLR3VzeUlwcXo0K0RDUFgwODErazZzdEs1?=
 =?utf-8?B?QUFqZ3hpOVZ5cTZNVXM2aVJZVFQxcldQUWlNNnduM005ZFNaSlZ2MmZMOUtL?=
 =?utf-8?B?eTJPRW5WUlN0OHRPMFRmVitwdm1QdXN1S0RtR3BtZjBlZmxQN2RXdmREQlJ1?=
 =?utf-8?B?YjhoYUR4c3hkaUJVVjB0dDZ0S1FoY3dxMEU3a0g0ZWFvbEMxOXUvS1FFVHdv?=
 =?utf-8?B?SjhraG03RVEySS93K3YwNk9lKzhyMklVbklGOFhRekNiZGdkZFNTMHBSV1d2?=
 =?utf-8?B?TWxUQXEweU0zUU1MdC9SOW1JUE9WZytSY3VCS05sR0RDVFZOMDJsN1RjZ2RY?=
 =?utf-8?B?cHMwSm5rQXIwNDgvSC9PVGRPUW9OWlJhblUvaVhpTi9jaEVCOHpVVU1KYUl6?=
 =?utf-8?B?azU3Y0hnLzFFZTB6R3MraHRHUmR1ZWhZNGEwemtSVDAwRitrTTczRmx0WWJz?=
 =?utf-8?B?TlE1SzgxdFFwNk9WNUo4d0wwNkhjUnlpMWhWWVpBSnIwejd0bitGR2VWUG1y?=
 =?utf-8?B?bVQ2bWVPK1BCRmNmb3UwV0grQmZUYXhjMVpScDA1UW5LWVcvYUZCRmZVdU5h?=
 =?utf-8?B?VVMvZEtkMFZacHQxQUQxTHRzajArWkNvNGp0N2phbnFzTEF6RmNVNzVsZlhj?=
 =?utf-8?B?WC9UNXp0YW04Ny9tZUZjUXgzRzhyZ3pBbnhvNkVvTkUxSjc2R0FoZklMUHo2?=
 =?utf-8?B?MWhxMC9peUxSRlZtSjJRQ0ZqcWdsUiticGlURHdrTnpZZUpFeWdUdW9pS1RJ?=
 =?utf-8?B?bms4S3dmUDlteG5DbzJ4VUhWeEdwYjFJME0wQSsvbEdFVzBWRE1FdFlnR0lq?=
 =?utf-8?B?b0VlZ1lzTjBUOU1tTC8xSXhvWFluY3l6ZVJUZzNQTFB1cjhUNnZxMzMvK2hp?=
 =?utf-8?B?azFUaStwZ0pKbUxnUGFHR0VHUkJjeU9PRittQkdURndPcGVORjE4Y3ZSRENj?=
 =?utf-8?B?V0FydnkzUi9uakQ0RmlLMExiSXhRSVJmNVQralhocjBrYkN1cnR1TlRhbTFk?=
 =?utf-8?B?Q25yYS9CQ2F1T3FnQ1JRZUVHT2tDU0lmVmlYQXpMdGlvUVpacDc2d0ZxOUFE?=
 =?utf-8?B?MC9lUDhGN1F5VHZGM2doQm0xOTM1VlVFOGZFc1pRUkUrQzFmeWxCWTJrN0tu?=
 =?utf-8?B?VGxXWVQreDdyUXFmcWJseWs4bllhRndHeGV1NUh4Zm40eVNhV1VJdURydGl1?=
 =?utf-8?B?bGx1N3V5cXJMNVU2R0M2TUM0V1BKdThLVGdtTWR0cmVid2YrdWZpZlFKN1VS?=
 =?utf-8?B?UFc1cCtyZVcxazVYOFEzUHorZDlQVlZ4SlRnd3JZT243dm1TM2EzZktTMU9o?=
 =?utf-8?B?Tnc3ZFhaYmt2d0hmd241b3hOYzBPbWllS1JsUCtXaWRxbi9abGxJNWtQWHFS?=
 =?utf-8?B?WHZnVlpON1BwejRqTS8wLy9MVmJPMTNGTUYrcG1LL3AwSjhDL2hjTFRmSzJl?=
 =?utf-8?B?M3RWOHRqQitWV3ROMHZTWGViRTRzbDN5bkJ5NVBTVEJUT21rZkNhRzhNQ0NT?=
 =?utf-8?B?R1RpeDJ3TTdRQzlKL05BTWVRU2Jkcjl1dHVNQXRSdHVjaFhsZTI5cy9pOFlo?=
 =?utf-8?B?QVpjeG41Nk5WRS9Sa3pXaURDT2tvQ2hLVDh2RVR6Rll0RE10eWFwZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8977b24b-954f-43b1-1ce8-08deb0df681e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 11:04:30.5600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AfvhSVJHvTOOUGoyV5Q+bDnEZnTFi173oFJO210QOFIGJNfe/n8L2jlnFaMAFoHUJn9qaiufxjQHx2eUJ7oOAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2565

On Wed May 13, 2026 at 10:19 AM BST, Onur =C3=96zkan wrote:
> On a fresh checkout, generating rust-project.json alone is not enough
> for rust-analyzer to work reliably. The issue only becomes apparent
> later when the LSP fails on a proc macro or binding types/functions.
>
> Recommend running prepare together with the rust-analyzer target so the
> generated files expected by rust-analyzer are available from the start.

This should be fixed by marking `prepare` as a dependency of `rust-analyzer=
`
instead.

Best,
Gary

>
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/597064-rust-an=
alyzer
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  Documentation/rust/quick-start.rst                    | 2 +-
>  Documentation/translations/zh_CN/rust/quick-start.rst | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quic=
k-start.rst
> index a6ec3fa94d33..df5b54b51deb 100644
> --- a/Documentation/rust/quick-start.rst
> +++ b/Documentation/rust/quick-start.rst
> @@ -314,7 +314,7 @@ definition, and other features.
>  ``rust-analyzer`` needs a configuration file, ``rust-project.json``, whi=
ch
>  can be generated by the ``rust-analyzer`` Make target::
> =20
> -	make LLVM=3D1 rust-analyzer
> +	make LLVM=3D1 prepare rust-analyzer
> =20
> =20
>  Configuration
> diff --git a/Documentation/translations/zh_CN/rust/quick-start.rst b/Docu=
mentation/translations/zh_CN/rust/quick-start.rst
> index 5f0ece6411f5..3f7efd3a63ad 100644
> --- a/Documentation/translations/zh_CN/rust/quick-start.rst
> +++ b/Documentation/translations/zh_CN/rust/quick-start.rst
> @@ -291,7 +291,7 @@ rust-analyzer
>  ``rust-analyzer`` =E9=9C=80=E8=A6=81=E4=B8=80=E4=B8=AA=E9=85=8D=E7=BD=AE=
=E6=96=87=E4=BB=B6=EF=BC=8C ``rust-project.json``, =E5=AE=83=E5=8F=AF=E4=BB=
=A5=E7=94=B1 ``rust-analyzer``
>  Make =E7=9B=AE=E6=A0=87=E7=94=9F=E6=88=90::
> =20
> -       make LLVM=3D1 rust-analyzer
> +       make LLVM=3D1 prepare rust-analyzer
> =20
> =20
>  =E9=85=8D=E7=BD=AE

