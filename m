Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020116.outbound.protection.outlook.com [52.101.195.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146ED246781;
	Fri,  9 Jan 2026 16:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767977882; cv=fail; b=GVVfUDClAWICsw35XGfiSedUor8RUl2lskCxurCP8Cn9n8Ig/OHbj7vyugMzFI5bhuSnhF98SFeK72IWIXIJdymfmV7/PsrPQ+92h3KV95CA18RVO5kwA+VSuysETNlkATIVndZtdmibbwpv9seA7GuME0YJMq3EEyrfzalUPe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767977882; c=relaxed/simple;
	bh=MFHRStkkdJI6y58QW0CIEfoLqI5nd1rdEZnsaxTNG5E=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=TpsGzmxpP3XYQWWFqX7i4701lSOOfgiJJ2HqKLrO488TFUKdM6swbGxbbPUE2gsJm8mOCOWQH4jS+zmXgob98PrGHq/cZmVYbBiT0KV0FnYQtZGdJbbOVD5Qg+mAysa4TW4J1G+MUMU/Z8FPVc7FW5TvWFrjxAREy7U9DSPe4ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=rvqRr/fI; arc=fail smtp.client-ip=52.101.195.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="rvqRr/fI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cpJ0XwRX4VlBa0GFazHxHH1s+zOyjhMutysnM4M6x/iGm87XL9LZjHpr1Dpv+jhaShew9qYBjZgcmzNy+wuBIzb1zBeeFXcYl/+69ZJKGWe5tacOmaUmlPwQ+wkIYpDwwb3OJxlT50HdYnvxIxIs+L7/6LTLl3UsA7y2Mu7AVcVnKrGXnZWANQz6hRcypH43UB8CeYh8ScNfOBOli1fmnnCzef45vWpCZj48SnhDBsP3KDHD07Obi7xvfiPJyUNC6qDOso4ibCiIgDoUQOJSPVqjM6by6kVC1IF92Rnrs9SZPT1B62RUt0oee6i2nxzswyAVRA05C3FIM+su9Wjpng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MFHRStkkdJI6y58QW0CIEfoLqI5nd1rdEZnsaxTNG5E=;
 b=aTap3xQt5dqfxC4bSfqlS/E2nuZt4P1yKfXm1VAbn0dsMT+VrllDYI+rdMmv1Kgstswof9uhhDcTHK7cAvwi8nDNConBDtS26gpvUs1zx6cIu7mHBCe7mGr4b1Xv0Ts5aIAC/6MR5UekmOh8+KCoa/wQkhdtTpOulI3Shb7DlGeVJx0UyHfmvfkEcSY4qDm6wuCYYdS5ShKLgNbRqdY6G1/CZipgPWsziMVpppAKjY4w4DHqvz/BzpFhbhNctSkrWYmc+sIx8VzSq1BY4jNukJZu3sdSdnUXXBupkrMXFzCJ1UEnsK35+0A69rqSbIK/Jc4SvTqSFeZMCLgIXju7qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFHRStkkdJI6y58QW0CIEfoLqI5nd1rdEZnsaxTNG5E=;
 b=rvqRr/fI+nDWJN95pVS4eebmCPJ86XiDCpgZlCahCne6urztducscD3p9MguoMP3APtXqiyQ6wf8dF9eeyRW9ji1HM1jEnqpBD3R4co/hTi1wB6QO3HEgOeQGwJEpiLUkEcnDs8Il2ewTQTiPfAr4SwOXOx7G15U5FvEYhf4pTA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB8605.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4a9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 16:57:58 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 16:57:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 16:57:57 +0000
Message-Id: <DFK7UOBJOVVJ.16QPQCTSGFJHI@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Gomez" <da.gomez@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 06/10] rust: xarray: simplify `Guard::load`
From: "Gary Guo" <gary@garyguo.net>
To: "Tamir Duberstein" <tamird@gmail.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-6-9e5ffd5e3cf0@kernel.org>
 <CAJ-ks9=VO1nypKFtOaGWxOUqzzJ7-Wb5qLd9pzQuFCSfk8PkZA@mail.gmail.com>
 <87bjj5gr7h.fsf@t14s.mail-host-address-is-not-set>
 <CAJ-ks9m6Pv85Y-Dfxgf7HxpKdrXsgY4jdpkFX+oYfrLevvd3hg@mail.gmail.com>
 <87wm1sfnra.fsf@t14s.mail-host-address-is-not-set>
 <CAJ-ks9mJJ+Rsmwa3zYq=1kLCox0tKvbKu6FBOJH4S3ed0hdjwA@mail.gmail.com>
In-Reply-To: <CAJ-ks9mJJ+Rsmwa3zYq=1kLCox0tKvbKu6FBOJH4S3ed0hdjwA@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0483.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: 538f996f-04d3-4f83-c932-08de4fa03daa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QnNjd3JHUzl4enRtT3Q3SnZMRXNMZUd4dTZ5THZ0QzNaM25JY21sTXpubm95?=
 =?utf-8?B?Y1QzTmFRUFpxaWl5czlxbWd6M05SWXJtSnhOVFFEWUM4ZXJSNW1FRjJhclpP?=
 =?utf-8?B?a1JSaHV4UElROXBqU3N0Qk0wU1p6YlJNWUQ5UEZFUGJCU3VHT055a28xanNn?=
 =?utf-8?B?MDNYRjR0NUdwZ0lwaitrT2wwSGJFem9Zd28ydlVUaHp6SngraHpFMVJFem02?=
 =?utf-8?B?Z0VGWGdCekpUWTl1bkhlT291Y3RmOGVhTjVkcTFmLzJOZTJPbkdack9hRyth?=
 =?utf-8?B?NENmSUVCbFNYR21KZmZ6d0FjTUJ1M0xVb3ZLV0JFVmpqT3RSb0o2eGw1YkVi?=
 =?utf-8?B?MjU0Y2pDK1NFUDUvU2ZzNzBtYTlzMVI4NWk1azlkV1MrY2tJNXgzRFBoa0ha?=
 =?utf-8?B?MEt2UEFKbG1tU2JVS0pJRm1CbTVSQU0vOWVnOU01RVBmamRscWZ6aEJpZmZi?=
 =?utf-8?B?R2hWcy9OZ05VRGlTakZ1YUREalRtei82SHJCQlNORHBOcUNQSFJZMWd0UWRm?=
 =?utf-8?B?M1k3STZFOWZudkJMMzVIdEhJbUdXQk16V2p2WU81dTJDVlA2MzQrRUNUWmtW?=
 =?utf-8?B?c1BPN2hhaTNIY3hnckpTOEtaSG02VWdZZ0pHQUdlSzBmSGt2RHNiUGs1VFBo?=
 =?utf-8?B?SW9sOGJaZDI0d2xyUWVYYlg3cHNSSUZ1TEttMVZCRkFrbzYwY2JQUmxnQTlJ?=
 =?utf-8?B?Vms4KzFjYjFyTHRhTGpJeThieXZwdkNOQmNEYlZzeW9paUFERXBuNEFibDha?=
 =?utf-8?B?VU1aVkdUVCtIeHlUa2dtRXRBd0ZRaUw3YjcxQzJLR0FOWFViVXhrKzlvVnhJ?=
 =?utf-8?B?V0YyQU84SFlNWEZMNkR2SUlhSGs5RVVFZ1NjR0U2cVo5RjhLTDVtUGNoNHJS?=
 =?utf-8?B?dWxWc2wra1VNT1hJbENhS0JTZGJsbnZ0UGhXOGZjTWluODhqV3NoTm4raWR1?=
 =?utf-8?B?MzZRZEpNWGR4a2lLcFdGYUxLTGVxSlpiQ0RYWUpneER6cTgrUGhDbVBmUU4v?=
 =?utf-8?B?WnI5MDVtcy9NUGFoa0JUdE5SbkRydFpRSFQ5RWRCNy9XKzQ0MFp6dnFGY2F0?=
 =?utf-8?B?QkNhZzFiVXFxK2l5NSsrSHh4M1FFTVg2WnNlK2x3SVljaXhCQTIyM1J3Wkxj?=
 =?utf-8?B?eXJEUUovTVlyeXlON0FzTm1RZmZIT2ptVHM4NkpML3V5Zys2QTk1SWZRT0Ny?=
 =?utf-8?B?dHNwK09vc2JVb1VSdE1zRXRkSmgxVkxzMUdaRmJ6eWNtUTYweEE1UFFpRFhO?=
 =?utf-8?B?cVpDN1UxVVBaMktod1lHYjVnTndQSjMvczhSZjlPMU93Y2Q3MVRCOTlkeHVo?=
 =?utf-8?B?Z1Z4c3hDME9tZXpLWndCdWxBdU5NV3I3bFU1NFJtZXl1U2ErNFU5WGZzdVNh?=
 =?utf-8?B?Y1p3TzJGOXlHdzloVGphNXQ1cDRBZm9xUk9OK1R2U3FkT25KVGVxRld0a2pE?=
 =?utf-8?B?OU11VzZLSEF0OFNKMjF4YWxuRHJNVVVXQ3duaXRrbkJKVXlxbUhCUHVmYjRy?=
 =?utf-8?B?RCtBWjI2UlkzcTgxTWx0bWwrKzFzc2hZTXFPVEdoNit3M25JUXFOMmlYOTI5?=
 =?utf-8?B?NzkwT3VQb0d4ditBWDFvVGdNTm5SNThXZTlKSjBYc1hZL2JQSnR6dExxOE1y?=
 =?utf-8?B?U3plUjVPVk95MDM0QjFyQ0pXd1JzSXBaVUwrYUplbHMybU91OXk5bDFMb2ps?=
 =?utf-8?B?U1pjV2JDR0s0SS9GZm1xeTNqSEVzb2VtMTBXS25zVjBpdmJSbldxWGZnL0hF?=
 =?utf-8?B?TnR1eStXTExycjhmc293eVBjSmFJL1pNWkNnZnFCTFhLaHFpbVkwYWpSMnBl?=
 =?utf-8?B?SXZ2UlZkZS8rUXhCWjE0TXZKU3UyS28wbnd3QmtxQjFaMUQxM0dGWURLNzVz?=
 =?utf-8?B?TWpzdGxTZ0FGS1RoYUZwRUV3ekZ5RjU4YVRwZ0F3N21yNytySGJBSWMzWDR3?=
 =?utf-8?Q?HtoW2y/O/Bu+6ZlJ/dpXotJjgs/xIzEQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzQ1Q01DWmhyU0NSbXduYStiWFlxZEk5azZhRVU4bldORjBBK3pCbGZybjZl?=
 =?utf-8?B?NGRhRVBUelN3YmMvYnUyaDRROU5OZDdwNVgwNDBMZmFRTUVIYjJTU002OUJa?=
 =?utf-8?B?cHQ1Q2ZXcW5aRkhUYlA4a3J2Q29zNUo4ZVRZaEZVL0RTN0NZbytDQTRhZUh1?=
 =?utf-8?B?VmRZNlBBTU5OSXYyNzNtSjlnbW9ETmU1V0FlSjBTTXVUNjRzQWsyNHFoczNk?=
 =?utf-8?B?QmpWVTk4SWkyRU5pdWtXekdwRWpSVVV0ajQ0TExMbnl6ZmpiOXlsNjF6cC9T?=
 =?utf-8?B?U2hObGxwSEpxcmh4VTJ6aWFjK1Z1b1owOVNYR2dhRXZIbFptRFFkeUI1a0pN?=
 =?utf-8?B?ai83cEZqd1VoYmtRcHdnaGpHTXlkQ1piVm11SnNINGhwdG9MNHcyK2lvbW5v?=
 =?utf-8?B?dDE2MTVFUzdrSVlYYTV2QXNwLzB2SFJKejVma1RoaUExelFmdEI3aERkczhO?=
 =?utf-8?B?b0theWx1UFJIeDRqZERpV3NicGsxZ1A1ZnhDblJKdkkzS2FyNjJJZVV6dVFj?=
 =?utf-8?B?OGtjc3VZd3duQU4xSE8rUnFVbjQ0MXN6RDJNUkdFSmt2d2k3Z1phZGEyam5l?=
 =?utf-8?B?VURaR3lORnZ1b2RkUWlCNnJaYUk5aENUUlF1emNpNkJDSzJKNHJaTjErRFRJ?=
 =?utf-8?B?MVY4dkZIQ2NoQTdod3ZCcmIrMGhGVmJoRG9LWFA4WTMveHZtSDJ2d0t0akl3?=
 =?utf-8?B?OGxJbElRbVlUR0Y4MkRmMG9idzQxNzl3VEZhOElGVm9XNml3QXVRYXZyc1FZ?=
 =?utf-8?B?V2F0SmpPZFU1OC90V0NaQUN5ZkZMRDJUYTVqRnRkTVBtL0FqME5sc0ZnUFJl?=
 =?utf-8?B?TlVhbzFSemtYZkRaNjdRTjZzd2w5S3paNjI0ODlsbExQTlB0ZGtjVWRETmVZ?=
 =?utf-8?B?WTBpM3JQb0tRVjh4Z0huTHg3bkxwZDVXenVWR1pVQWtrTHFpVlNmcVdhNUJW?=
 =?utf-8?B?bUloTDBYdGxhSE1WMW04VHk4ZXVWSXllOExSWlQvRkw1VENxTWhLYlp0S21C?=
 =?utf-8?B?TGx0ejlkelRkVzJKNnlObk5WWWF6Z3hEWE52bFVwQm5xOEhmblBpbHJKek8y?=
 =?utf-8?B?S3lQNnE1bGF1MFpxZzh4WmVtdDlPbkU2VlBMQkM1UDNGQ2NBZFhSY0NEWFJF?=
 =?utf-8?B?N2lUSTRYUCs5TkgrRTA5QUwycUprZHZsVW9IZVlubG43VjFzb2lBRHV5aVpW?=
 =?utf-8?B?eXRJSmFVaGRBQklBRlZvQ1FZa2xSQmtzRmp5QzM3eU41dTZpNWk1V1hVTEZK?=
 =?utf-8?B?b2RQemtpN1BucnVtZkVxbnp5VGpTNWlOeWhmQzF1OHVHblhuTTRBQkEzd01v?=
 =?utf-8?B?WmY2TFZuRTRldERKOFZPWXdURG04bzBodXpFTUxvUWtxZERhUFFISEVjSDNz?=
 =?utf-8?B?dThrQ01IMTF4alFIOUlwUDBuQ0wrUHlZQ1F6TG80cGlYMVlqdXlVb3plT3BU?=
 =?utf-8?B?MjFWcmZxYnBHM3gyRmg5WjBzUVh2SU9UNVJRSDg4Z2RBclpnVG84UUFKWmV2?=
 =?utf-8?B?N20rVEQwM3kwM25kZnlYSkpPa0wvTFNBVDR6bDB3KzlLOHYyY3V3ZHRwaUVI?=
 =?utf-8?B?VkRMcnRaRThOeFI0dlJjOHZWUWFtcXY4NFJUdkdlS1FkY2lOc0Fuc1ZOTGcx?=
 =?utf-8?B?TDJ2K25NSW90Y3Nzbk84aEZsVTNWcGFZTnRhZkNudnlOY0pWY05uMzVTaWhy?=
 =?utf-8?B?dmdmVklyK29BZG92NzlSVFRHZ09pWndFK3hqb1Y0U2R4UE5mL3RZVVNBMVMy?=
 =?utf-8?B?NFFwdnRSZm00SmhCSUgxWlozTUQxaHlpbVMrY0FnZURmZHZMN2FQRDlhSm54?=
 =?utf-8?B?OHN3Z2NnRW1meTVHU2cyb2tkNUxtWWlBRElYK1VqbEs2eW1DS0d4bkJKdFNq?=
 =?utf-8?B?dklDU09aVGh4cWxMOHBLREMwQ3NvZUpVQ3IveUkyR2dQdEZINXpTQTNCOTdK?=
 =?utf-8?B?Y2RtaG9XQ2JibEU1alJhbkVoVWtDdnI5aHB1aFRLSzRGTkpZT2Ewcno5cnM2?=
 =?utf-8?B?dmpJU0JDQnk4dTVKYlUzM2J0eWJpbzhYL0xvZEtHTjFxaE5ISFRMblFLUWY3?=
 =?utf-8?B?UTJ0KzlIeHJaY3dkOWJ4T3lQVUNoWW5LN1VGZTFTSk1aU01rRGd0RjBxYnE5?=
 =?utf-8?B?dXRrNWVNTkdnYXF4Zkhld3dVRGFhWGxvcXUydFd2cm1za3BEZ3hUSHlWRXZV?=
 =?utf-8?B?N1M2TlEwdnBrYWg5K2FiMGlQeUtKcHdnZGtEazlOQUpBSURkQWx5YWYyRDJW?=
 =?utf-8?B?cnEyOVdRSFhHT2IrRlNHRzJxVjJhdjRQdDNyaC94dFZCUi8rV29aUFdNRWFQ?=
 =?utf-8?B?bk84SUJuK2Q1R09WRXpxMEVZTG4yTGZpemN4MHNUZ0kxa3JTbndGUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 538f996f-04d3-4f83-c932-08de4fa03daa
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 16:57:58.1884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: etZMWtmfishnOr6TIwRa2uei/MNAFoe2CRcX4HOw3uhfkwulNbunTL1JbvbM5WJU+FtgDRjPS60rBSuut7dQYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB8605

On Thu Jan 8, 2026 at 11:07 AM GMT, Tamir Duberstein wrote:
> On Thu, Jan 8, 2026 at 4:38=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> Tamir Duberstein <tamird@gmail.com> writes:
>>
>> > On Wed, Jan 7, 2026 at 2:37=E2=80=AFPM Andreas Hindborg <a.hindborg@ke=
rnel.org> wrote:
>> >>
>> >> Tamir Duberstein <tamird@gmail.com> writes:
>> >>
>> >> > On Wed, Dec 3, 2025 at 5:27=E2=80=AFPM Andreas Hindborg <a.hindborg=
@kernel.org> wrote:
>> >> >>
>> >> >> Simplify the implementation by removing the closure-based API from
>> >> >> `Guard::load` in favor of returning `Option<NonNull<c_void>>` dire=
ctly.
>> >> >
>> >> > This is not sound. The returned pointer can now outlive the guard a=
nd
>> >> > mutation through that pointer is trivial.
>> >>
>> >> I don't think this is unsound. If we returned a reference instead, it
>> >> would be, but we are returning a raw pointer. Dereferencing the point=
er
>> >> is unsafe and requires proper safety comments.
>> >
>> > You may be right, strictly speaking, but it is most definitely a
>> > footgun. This is a special pointer that requires more careful handling
>> > than other raw pointers.
>>
>> I would disagree. Dereferencing any raw pointer requires the same
>> checks, and knowing this one is valid and satisfies lifetime
>> requirements is no different than others.
>>
>> It is also a private method that is only used in this particular impl
>> block.
>>
>> At any rate, I'm fine with dropping the change. The reason I did it was
>> because I had to double take when I read the previous code. I think the
>> original code is has some unnecessary complexity with the closure.
>
> Simplification is always welcome. The current shape of this code was
> guided by the desire to avoid the footgun we're discussing here.

Using a closure isn't any better than just returning a raw pointer. If you =
want
a pointer you can just have a identity closure and there's nothing preventi=
ng
you from doing that.

Even with `T::borrow` inside the closure this isn't providing any security =
as
the code would still compile if you change `'_` in the return signature int=
o
`'static`.

The only defence here is really the `unsafe` and safety comment.

I would prefer to not have closure in this case.

Best,
Gary

