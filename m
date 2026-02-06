Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021105.outbound.protection.outlook.com [52.101.95.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC8F238C29;
	Fri,  6 Feb 2026 16:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770394807; cv=fail; b=uY8WQFP/H6MZL0Ut8kkS+UHY9TZDyqmtdskMaPG3v77KV65zUL43uJe/87qDsj+Pmr1DeGXB1MovSIkF6UjrC7X/oQs8qlGsumV6pXA0muflkZckspz4F8KIpLAXZFLAlVBUhUleBqWE0+2Th6Lu61BjnbtTgMx+6+OySBPLqbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770394807; c=relaxed/simple;
	bh=ZoCZckfovVCjgsDldQ6Poto4Ml+QeYjdCS1PjCKgYfY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=RKwLq77tmTEpuDlrsKeDC0bz7h3WPAevjC95dmtdDCExNW8rDYXide06GXG5DrA+nMZRhhWskWTMIUDBDQ3Yfu5daUv8M8V1dfLNgl3Xr+Yu0dgcTYJfNZ++hPdtxkplC7Oft5GowZeWo3RIUQBP1ZNUttTHXdhZwXCmt4YfSrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=LyNy5dOP; arc=fail smtp.client-ip=52.101.95.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="LyNy5dOP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nSIlZkEOoRvjMyEN/8Y2Ike2SJMb7+avOX8qFd0G72pdB4lwsivh1xEDZlgLyDcw3BouEjjv3txZzjYkPVVUeqm/qZQjR8p6J45VWDRSYrArNMz8nBWN0GiYQlWWzvmrprpBP2KlvTeqEM5IF4lOPgJ77hz6Lu5zSk+EZGn+gb8ufcXrbu/aekRWvDICAHNQgMcUvejd4+nSZgbG3QfU2JZRyYSJ9Jc4tNCd9QLDrebsOWeZ6smSJUebNP8kVBQkT6jUPpZ74ZWAYrNLqtiujNvSPpvP1V9sMHWb6UXyIu1xl+M8osV0+wIhzy7goZ0yRyIgTMBi1QIkaptBToQxMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XvknYizM3HZTZI9ZyYf7kYduMHmPtk+tIM4ArPKXFc=;
 b=cwitzQ8gOuArJBLqzSjiqOUyghiKSmPk3CENWlpxBTvzClRsZmynhMLDFfvs1mfOlP0EB6S8IU8sycAFbyE/0EEAHIiLF76CjAxsfIMoEcNAkyk+pdhlZ3YPgsLEuUKVnLKMll+G1Z9MCUtsDi1lnh+1gL5on+OFRAQOPuj1tKbHlI80WO4UyTELFET0jmOZxH74tuCOgnH9ijjwzbzZx2U8hAlUBGWgyChgx//oVIjd2QwPrltc86iSTowVpMSk97pCN+/E9zFX8ac14sIhtmfVmt+XIpR1wPHhdWi4iL8ICWX8s56ZcrTcQDmY3eYMY5w6mf+wqtlLDfXnCuhsbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XvknYizM3HZTZI9ZyYf7kYduMHmPtk+tIM4ArPKXFc=;
 b=LyNy5dOPklHkz2JPtyCFS4Ih2mYlSSYTxFO/QdainxLwYpyo7B+SfbQ9T7m33KUSSJfhulDhGqp79LzVWIbFmr7/nrjr8HaDI/D8nranjFObE4lLhkS0+vx5mkl7XkOvu67A3X4MASDRr+SUH1o41QbkQPJaHDhuz1DS8XIkyKc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB3412.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:ea::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 16:20:03 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Fri, 6 Feb 2026
 16:20:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 16:20:03 +0000
Message-Id: <DG80KWRTCM3Z.3PYV9P6Y5414F@garyguo.net>
Cc: <heesu0025.kim@lge.com>, <ht.hong@lge.com>, <jungsu.hwang@lge.com>,
 <kernel-team@android.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <sanghun.lee@lge.com>,
 <seulgi.lee@lge.com>, <sunghoon.kim@lge.com>
Subject: Re: [PATCH v4 3/3] rust_binder: fix PID namespace collision for
 freeze operation
From: "Gary Guo" <gary@garyguo.net>
To: <jongan.kim@lge.com>, <aliceryhl@google.com>, <a.hindborg@kernel.org>,
 <arve@android.com>, <bjorn3_gh@protonmail.com>, <boqun.feng@gmail.com>,
 <brauner@kernel.org>, <cmllamas@google.com>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <gary@garyguo.net>,
 <gregkh@linuxfoundation.org>, <tamird@gmail.com>, <tkjos@android.com>,
 <tmgross@umich.edu>, <viresh.kumar@linaro.org>, <vitaly.wool@konsulko.se>,
 <yury.norov@gmail.com>, <ojeda@kernel.org>, <lossin@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260206085336.32819-1-jongan.kim@lge.com>
 <20260206085336.32819-4-jongan.kim@lge.com>
In-Reply-To: <20260206085336.32819-4-jongan.kim@lge.com>
X-ClientProxiedBy: LO4P265CA0267.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB3412:EE_
X-MS-Office365-Filtering-Correlation-Id: 05d5b282-6889-4e32-f5ad-08de659b9596
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OW1DaGRtTFBtR1dtYThRWFpiRUxUb0hhYStFWEZYNlVKb0E0S2ZmUDBnNjdS?=
 =?utf-8?B?VDVySTNzRmZMWHFZWWRNL1pqNG5LUTNSK3ppRExDSy92M2V3QUNQcnRWbllS?=
 =?utf-8?B?WVdXRHdGU2N6THk5SG8wM3lDKzcvWFlteXFCbFR3VjkyTGM3aW1vRmd4TzRw?=
 =?utf-8?B?WmdZMFdxSFJJeEN4c1JmU0hPTXpJL0gvaXVsNHNNc0ROL2ROTVF4SkVCeHNW?=
 =?utf-8?B?YUZXbHZaRFlVRHk3enpudFdjbjFsTkppSDE3YmNNeE9IM1RQdVVoRGFxUUFa?=
 =?utf-8?B?RzVRU3QzMDdQZ0RJREtyb3RSTkhZUHMzdWF1eUpUek9HSDlITWNJeWFrdER1?=
 =?utf-8?B?UEc1bEx6RjB2S3QxM0xyVFhBZ3hFOEUrVXUwRFpHcmxoS1RxMlZHOVdIeG45?=
 =?utf-8?B?dUpxWVRiTE56SEVSMHQ1Skp0dzRDN2RBSWJXdU9sMUtueHhzbE55Q1pjay9F?=
 =?utf-8?B?djJJQVQycklFbFBBbDlyTDN6dlhEcHplMVpTM1Z0KzVlSVJtSGN4SjFuM2Ew?=
 =?utf-8?B?emxsL3htZ20wZHBXSm1SR3h2MVVpeDRzaE9nTXM0dUFmaUdUaHRId2pDanZw?=
 =?utf-8?B?LzRrK2tqYUFMMnlHemRJRjNRdHlERm91cEc1VmE0cFgxREZZcytRYzdsWTJu?=
 =?utf-8?B?VWxTQW5vY255RnI3ajU1cEJzeFpuMmNyRFFXSWhWYnk5UkpzR05TT3N4bGsy?=
 =?utf-8?B?aDdUSVNVSFdMS2U0MjdpT1oxYjJQU0RGQTBSSGdMa3pHY3BVdmRsbHMzWVhk?=
 =?utf-8?B?Y1RyWXJkb2t1SEROaS9tUUEvQ09BYURCNHZaU1QrMjZHWTBOaXlWU3FtaEtG?=
 =?utf-8?B?bWptWGc3SDBTaDBwaGh1Z1NjSENJdFlzM2VsbGFRQStudjZkSUZVVWE0ditG?=
 =?utf-8?B?WjF4MXUybkphQTJ6VUZFcmZYOWJJc3JBVk5XUFdhZUgvbkZmMjdTWkdJVTg2?=
 =?utf-8?B?YXpRbHM4bVY3RkpzRWQzNnovN1o5UnkxR0RqczQ2N1FxYm1hTkREOGxXVERX?=
 =?utf-8?B?OEd1QWFWM243T01TOGhQQzlTU1ZXMDg0bWt5WmZmZGhsWE5BQ2Z6dzQ5dlY4?=
 =?utf-8?B?SGFTdERjWlpvN3BDd1htM1B0V2Zqc2EwU2RwcE1ncUJ6dTJIb1hoSkdVL3Ix?=
 =?utf-8?B?WTh4T2tZYU1nbTdmVjR5OHBRMXNGSXpPZVM1Q0xwdFpBa1pwb05TOWxSMFBN?=
 =?utf-8?B?bmxXUjlJeU9XWVBSbVZCN2RZUVhhTWRyWUExaFV1RUlRUm9TWlVUaTYzSENT?=
 =?utf-8?B?M0VQRjhscXdzcmhaVFEvZ1Nlb1hQR0E3bTNhSkY1UHFFWEkreWR2WnR3MDZw?=
 =?utf-8?B?L1UwWXpBZDc0WTRxK3lMRVJEeXZNNlY5ZXF6S0dIZDNxM3plbFFESzVMVEJH?=
 =?utf-8?B?djhnVWJMRnF5UkhrZFMvMThrWWdZTFpJdFpPZ0pnQTEzNFpQMnJuV2NEUGEw?=
 =?utf-8?B?ZlRWMzBWZnNrQ1lydzlkK2dqOWFiSU56WitGc1QyUmFPVnUrdS9sYUQ2N1Fl?=
 =?utf-8?B?N29jTkFjQVZJaTByZGJaZUxwenFBVWc5bHpDUkRwRnR2ekRyMUFWenl0UHJm?=
 =?utf-8?B?c3czYkRZcVYxeDBaVENGNkNzbU5QaElEZkhSRmVPMUR5czhscS9FTE96Z3A5?=
 =?utf-8?B?ZURjdDdDdjZjUFRGdXhDaUUyN0ZpMkVjZ0xXR3FMVnpBL253V2MwRFhsbWFq?=
 =?utf-8?B?VkFMdkV5R2Z6Wi9pYnhLNWRNRmJUV2toL2NpRlpQVnpVMmRCVHc0L1Rjem8z?=
 =?utf-8?B?QWliTGk3QWp2a3JyVlA3dCtxY21rR3hwbXloZlRCeENQRkVHd0crUmxiWVBX?=
 =?utf-8?B?enptK2JSWHZQZjZ5c3daQkdLWGhqMUZabFBhS0dTdXN1dkRwVE5sRDB1UE9N?=
 =?utf-8?B?bVVWcDNJbkJsQWFLYmJIUkRRdkl3L0F1U0ZDTzN0UUNFZTZOazljRXdKaHJF?=
 =?utf-8?B?bmF1RWFyU2lZYnZsY21ibncyLzhJd3o5M1lxSlZGM2tkcHZjN3o3MGE5QlhO?=
 =?utf-8?B?R2M1NGhHZ0tKak5ubzZXSGRrSWdrekJZSW5hc05QNUlic1U5dVFRTTdVbkdj?=
 =?utf-8?B?cHBtdlByNG8xYUQzYUhYaHpLM2Z0WUhWNDRjbm1YNzg1TkJlNDczLzBvUGJS?=
 =?utf-8?B?RXFtUjgyQVVneGttc25IejQxR3V5dUM0TEF0b1lNMUtjQ1h3ZHYvT1N5Ukx0?=
 =?utf-8?Q?Ps79e2+6xfzpvXrJkyig/tU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjZWOEVaeXRETlBjNklNLzMyaXFHUHBCL20vdTlRekZIQ3lrM3BGYWZ3REw0?=
 =?utf-8?B?ZzkveFZMKzdNNHNCL05WM3RFSEV2Tk9rTE80RGRSVCtZeitsTUt4K1EyZEZY?=
 =?utf-8?B?RGtmQmRkOGZPT0I2bFRFdnF2YlVHRVBFR0s3d2R3MXcwMEt1d1VVZTlmMVpt?=
 =?utf-8?B?cGYrMzFsOUhOUXRFeGw2NDFoa3ZBOFUxSGhFQUxYYWhhaTdHM29xZE5Pamdk?=
 =?utf-8?B?a3FEWE55enJ1QklUdllQL3RBNkpQMDBZS2o0SVZ1OVVaK1JLM0hhRE5KQUox?=
 =?utf-8?B?TGJZQ3RFL0d2Ly93b1huTlplZUVUN1VQejJIVnZoMERYcnVIS0Rqd3JITzJn?=
 =?utf-8?B?S1hBQ0dPUEhHY0ZRQklDUVRNUHRVRmQvNE0wbWV4U2crVklYRnh1RnRUZ0Nu?=
 =?utf-8?B?eThJSk82K0F3YVQ3WFFOK0Qxd2pVYkJsZm9YLzVINm5BZFA5Mzh1WDBuQ0hy?=
 =?utf-8?B?S1gzOS9XNE0yTWU0a3B6QWJ6NHErTjd0Vk5WbzZGMzdRWVpMclZUeUdzemlR?=
 =?utf-8?B?N3hUZ0xibmNsSEFEN3psNTFZRFZUb3AzQjA4SGpmeHZtTDNBVmloRkRZTW94?=
 =?utf-8?B?aitJN0dTdVl0bkRtQVkrc2sycU1NSlB5eWYxTG9GUEt1T0ZSajdSWW5iLzhy?=
 =?utf-8?B?K2RUSml0N0lDY2hINFdkc2xxMU52ZDQ4WTl1Q3Z6S25zKzJTeUYzb2dGSTkz?=
 =?utf-8?B?Q3doZWRNdkprZmpZdklJelBJZy9yOG5MWnhLVG5XMWVNR2Z6Y3NTTFhvK0Qx?=
 =?utf-8?B?Z3h3Qm53bG9uS3JTNVA5S1VxVUR3enAxQ1lYWVExbzRkaEl0eTl4U1lxZ2dZ?=
 =?utf-8?B?bmI5OVZzTlFjYmF5MTVHeExKTGswTTh1WHFZQUlPYjVVM01ObVFKTzVCTXlG?=
 =?utf-8?B?bFRVQXhZYmJ4dXhCeG9oLy9tdlJHY3UxYUY3cC8wWXd5TndPamN3aktJb1ht?=
 =?utf-8?B?Uko1RHQrd3U5TmhlOCs0eUpQNlp0RkVHN1pZTVJibXllR1JCOERjME9xSmYy?=
 =?utf-8?B?RG5JeW5UTk15KzlPQ0haOFVHbUNGbmZpbVo5YVcyRGppSmwvUFVVOU9zaE1H?=
 =?utf-8?B?Rmh5S2VWd28xd1NtT0MxR252aExQbzI4NEtUWTVVb0dUa2VTY2Fid1plenlJ?=
 =?utf-8?B?dVV1Z0p2YzBUNmJxNitNR29JMS9FTVZGYzBzNU5jbzFMa1R6L09ZdlhTc3lx?=
 =?utf-8?B?WE9tZEZoUHBadTJhL3ZRMGI4ajNxTUNDVEc5dm9GWFphdzJIMVBXVDdIOGxu?=
 =?utf-8?B?dEtBT2J3TkxpN2V1WWJVbm1ZTmdPcmk3VVlHTURsc3g2MGErclprc1E4Z1Bt?=
 =?utf-8?B?OW1yRWNuYm0yNFFra1ZrVEFTMkhEcDZxdThkcFFXTXUvSVg3UkR4a0M1VTZJ?=
 =?utf-8?B?WVlBYlM1eFFlK3pxZkdOVXdQdkRnYWpkcTBMelZCcVJ6emlSQzVXU3RqL25i?=
 =?utf-8?B?WGNGL3VoSzdFbXV1MnZWcnEvb3VhaWhVeEp1eEs0QW83OVowT3VEUHZaVmIw?=
 =?utf-8?B?YnRiYmNjSmh5ektqQVpVTmphL25CWXZ2TzV0K3lkQlUxd2lXTnR1bmtKNGZw?=
 =?utf-8?B?Vm9pRHdGQUw2M0dSdkFXVmJzZDIwM242Y0Z3TjlzNXo0ejVTNkFDS3g5NUJn?=
 =?utf-8?B?anhOdDl6UmNJeGVpVWpCS3Zna0h1WXZPdWQ4MStrWXFZNktIYUx6MEJjbi9V?=
 =?utf-8?B?MmdMd3hMaWJNK3FLVEJaaVAwL0t6eWVISzBMbnQ3dk5UQWx4dXpjZXBhZ2c5?=
 =?utf-8?B?L0hERXkyT0RuSzFMZFMwb3ZEdTNDSW1pdDNrQlJncTZ3REFpdFNaeVI1RGVx?=
 =?utf-8?B?Z2l4OTdPS215cXNScDAraHZrSzVmVFo3RHhvQVV6dkM1RDRId3V3TG1ZbU1t?=
 =?utf-8?B?bk93YkdPc1Z5eEd5Zzh6dXdIRDc0RnQzWWErTk50SzE4UWNDYk5kc0lSSWxQ?=
 =?utf-8?B?cjVobWdTMUJWQ280eXh2R0E0cFF3ekpFbi9uZDJwVzFNeCtJRXZNTmtJQ2VV?=
 =?utf-8?B?bDUxc05lZFBuQ09XemRtVFhWbk5sU0dBTE5Udmg0N0FUTXZIeWEwZER0QWtY?=
 =?utf-8?B?WEJuZEZJdE5NdFFXbVVxQjArL0dWQ3RXdkZEU2tNTTNRUkFFeWU5UjNpQ2ox?=
 =?utf-8?B?MUlFaHkyT2lOUnQwVldVNThPTHBOMVQ5SWQzcVRaamxFTE15Q1Yza1F3YnB6?=
 =?utf-8?B?Ylh1S1R2ZnlqamFDUG5mZFZTVi95MndwTTVmTWJocVdob3dPNThKY1BQKzBU?=
 =?utf-8?B?MjhvVnQ1SThKZzh0RVVLQ1JZMmNCN0laYkxkVzhjMnVhN2o5dWFGYUpQM3FL?=
 =?utf-8?B?YU8vTHFvWGFWYmR6T1plc1doMlArTXAxTVAyQXZoODg0cjV2SDVhZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d5b282-6889-4e32-f5ad-08de659b9596
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:20:03.8169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zio1NCnrJD02eaZem58vF14nTiWLoWQ4eFdf8GlobUQqk/zmyCFaxKEhOiqyRwHBZ2Yq4TiUkJRh6SZB7maadw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3412

On Fri Feb 6, 2026 at 8:53 AM GMT, jongan.kim wrote:
> From: HeeSu Kim <heesu0025.kim@lge.com>
>
> Port PID namespace conversion logic from C binder to the Rust
> implementation.
>
> Without namespace conversion, freeze operations from non-init namespaces
> can match wrong processes due to PID collision. This adds proper
> conversion to ensure freeze operations target the correct process.
>
> This patch fixes the issue by:
> - Add get_task_from_vpid() to translate VPID to Task reference
> - Add Context::get_procs_with_task() for Task-based process lookup
>   using &mut KVec parameter to avoid intermediate allocations
> - Update get_frozen_status() and ioctl_freeze() to use Task comparison
>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Link: https://lore.kernel.org/rust-for-linux/DG5CFX3ML5YL.2FE913F20LNPT@g=
aryguo.net/
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://lore.kernel.org/lkml/aXs5Y3xAFKyZr6nd@google.com/
> Signed-off-by: Heesu Kim <heesu0025.kim@lge.com>
> ---
> v3 -> v4
> - change subject name more clearly
> - Use Task pointer comparison instead of PID number comparison
> - Remove PidNamespace dependency entirely
> - Use &mut KVec parameter to avoid intermediate allocation
> - Merge context.rs and process.rs changes into single patch
> =20
> v2 -> v3:
> - Use task::Pid typedef instead of u32/i32
> - Use PidNamespace::init_ns() instead of init_pid_ns()
> - Compare PidNamespace directly with =3D=3D instead of raw pointers
> - Use Pid::find_vpid() and pid.pid_task() (dropped _with_guard suffix)
> - Fix rustfmt import ordering (rcu before Arc)
> - Rename TaskPid alias to PidT for clearer pid_t type indication
> - Use task.group_leader().pid() instead of tgid_nr_ns() for consistency w=
ith C
>
>  drivers/android/binder/context.rs | 16 +++++++++++++++-
>  drivers/android/binder/process.rs | 25 +++++++++++++++++++------
>  2 files changed, 34 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/android/binder/context.rs b/drivers/android/binder/c=
ontext.rs
> index 3d135ec03ca7..1fc779e4d9ce 100644
> --- a/drivers/android/binder/context.rs
> +++ b/drivers/android/binder/context.rs
> @@ -9,7 +9,7 @@
>      security,
>      str::{CStr, CString},
>      sync::{Arc, Mutex},
> -    task::Kuid,
> +    task::{Kuid, Task},
>  };
> =20
>  use crate::{error::BinderError, node::NodeRef, process::Process};
> @@ -177,4 +177,18 @@ pub(crate) fn get_procs_with_pid(&self, pid: i32) ->=
 Result<KVec<Arc<Process>>>
>          }
>          Ok(backing)
>      }
> +
> +    pub(crate) fn get_procs_with_task(
> +        &self,
> +        target: &Task,
> +        out: &mut KVec<Arc<Process>>,
> +    ) -> Result {
> +        let lock =3D self.manager.lock();
> +        for proc in &lock.all_procs {
> +            if core::ptr::eq(&*proc.task, target) {

I think we should just as a `PartialEq` and `Eq` impl to `Task`.

> +                out.push(Arc::from(proc), GFP_KERNEL)?;
> +            }
> +        }
> +        Ok(())
> +    }
>  }
> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/p=
rocess.rs
> index 132055b4790f..58e816f8873f 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -22,6 +22,7 @@
>      id_pool::IdPool,
>      list::{List, ListArc, ListArcField, ListLinks},
>      mm,
> +    pid::Pid,
>      prelude::*,
>      rbtree::{self, RBTree, RBTreeNode, RBTreeNodeReservation},
>      seq_file::SeqFile,
> @@ -29,9 +30,9 @@
>      sync::poll::PollTable,
>      sync::{
>          lock::{spinlock::SpinLockBackend, Guard},
> -        Arc, ArcBorrow, CondVar, CondVarTimeoutResult, Mutex, SpinLock, =
UniqueArc,
> +        rcu, Arc, ArcBorrow, CondVar, CondVarTimeoutResult, Mutex, SpinL=
ock, UniqueArc,
>      },
> -    task::Task,
> +    task::{Pid as PidT, Task},
>      types::ARef,
>      uaccess::{UserSlice, UserSliceReader},
>      uapi,
> @@ -1498,17 +1499,29 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFr=
eezeInfo) -> Result {
>      }
>  }
> =20
> +/// Get Task reference from VPID with refcount increment.
> +fn get_task_from_vpid(pid: PidT) -> Result<ARef<Task>> {
> +    let rcu_guard =3D rcu::read_lock();
> +    let pid_struct =3D Pid::find_vpid(pid, &rcu_guard).ok_or(ESRCH)?;
> +    let task =3D pid_struct.pid_task(&rcu_guard).ok_or(ESRCH)?;
> +
> +    Ok(ARef::from(task))
> +}
> +
>  fn get_frozen_status(data: UserSlice) -> Result {
>      let (mut reader, mut writer) =3D data.reader_writer();
> =20
>      let mut info =3D reader.read::<BinderFrozenStatusInfo>()?;
> +
> +    let target_task =3D get_task_from_vpid(info.pid as PidT)?;
> +
>      info.sync_recv =3D 0;
>      info.async_recv =3D 0;
>      let mut found =3D false;
> =20
>      for ctx in crate::context::get_all_contexts()? {
>          ctx.for_each_proc(|proc| {
> -            if proc.task.pid() =3D=3D info.pid as _ {
> +            if core::ptr::eq(&*proc.task, &*target_task) {

Same here, could use `=3D=3D` if you have `PartialEq` impl on task.

Best,
Gary

>                  found =3D true;
>                  let inner =3D proc.inner.lock();
>                  let txns_pending =3D inner.txns_pending_locked();
> @@ -1530,15 +1543,15 @@ fn get_frozen_status(data: UserSlice) -> Result {
>  fn ioctl_freeze(reader: &mut UserSliceReader) -> Result {
>      let info =3D reader.read::<BinderFreezeInfo>()?;
> =20
> +    let target_task =3D get_task_from_vpid(info.pid as PidT)?;
> +
>      // Very unlikely for there to be more than 3, since a process normal=
ly uses at most binder and
>      // hwbinder.
>      let mut procs =3D KVec::with_capacity(3, GFP_KERNEL)?;
> =20
>      let ctxs =3D crate::context::get_all_contexts()?;
>      for ctx in ctxs {
> -        for proc in ctx.get_procs_with_pid(info.pid as i32)? {
> -            procs.push(proc, GFP_KERNEL)?;
> -        }
> +        ctx.get_procs_with_task(&target_task, &mut procs)?;
>      }
> =20
>      for proc in procs {

