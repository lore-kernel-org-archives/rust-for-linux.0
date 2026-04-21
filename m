Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010022.outbound.protection.outlook.com [40.93.198.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392CE1A6824
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 01:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776734569; cv=fail; b=EKQoFmRTvuBo45CUwKLpj50Uokvr8XxmvSF399/UNvLYVwVDuOX8/f4o5BNz317pgCGh+HdHIJhbFwf/bO9ZqRgMDAb2bhPYPwFUhJTAltJeRT3vgt5cWenyElR4ebevae25VBP6H4/c1R2DJ9nudxm+KcPuw4wjT0ygZHQc6N4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776734569; c=relaxed/simple;
	bh=UANyGoOXpQd3Zd+6Bjaw0LkTxKgAKIw7rj0xu9jwfcw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=B2H8HoF7AcMCIU90ZC//y0diSUczAzAUYFquWrmfyz3dnr41Tdlk37amybSFJfZyWvSgcc+MRNH19oXH4/xNRDSTcppHHAh9gzG963bmvfOVFBJMlBn4KGyYP1ZLU1ETPJEhJPrd687k0rrD4q/GYzsG9/SSC+HNf1qowm/o13Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Zxs+6qiq; arc=fail smtp.client-ip=40.93.198.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zxs+6qiq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzBOIjGV+/HGlg8PdVW2ZVrlwsxa0QSqhRjnEqEyt1nV4o0ZuaFUjDOUcg8A8zjdFNX5HbtRbyKG2uVDdAaC6TZS3WWTI4WaMWhE1qUyXMx07xEaS4XvM4A3c9ADkL4/S5FfZX07pOtVjjvO8VH8WQ9f5VseyNSAXehjs/yn9ep/m9tKZq6LnLjuK7ICChKzFliafY93Ut/Z6ZLI0HN4PSmQGSIGA4qjWiSRuuxaqaZSswaYT8VYQpklLFeFo2jyJ+MCFDAlbyYAMfJUoiNryvKha94c2Irz2+9XBYSQ4uGlzU65hyXaP5i+L80uTNTecgaw7ssiS8U9FNkLDeq7xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocaSdXaWBX2PxnfqFGlgQRqn+lSLK0KyEeUx1JU9O8o=;
 b=Gk1VnDtdYoWuhFm93N31Xo46necTaHSeXosejrTnnMdoEsAbNtK1grY81d0TbelqOPIglKBP/5avlDDVCzffiFRmwdRDSN1s9FFHYhckormwBYKs+lrPMls7zDF+xK0J+J8YM4Ru6Soy2RMuNSbtH+sz+HCMfbKMVf01j7lFNHWoKLLm8vNuP/U/ap8rekfBXjTyhDrCaa3WTgqNa1zdtT5yzYQxCK/+wWpphsRqrh3Hq22zRl+bavgEG+LyuX1IsfqUImlsU1aqbrF2bYHvM+UNKVbKQU9lsYKnqW9mnEKY4Qelq6YomE4xij15wU4AFipEDtJ5E5RYafCFhMEXdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocaSdXaWBX2PxnfqFGlgQRqn+lSLK0KyEeUx1JU9O8o=;
 b=Zxs+6qiq5TolRhKRseeZMn274UNGFAeXf0gBIBZfOcE8ZDhDkiHCZFCxV/OGa6QS8vmPyEqkIZwp9Engs4dVs7MbDrhLwjDIB9HD/qHCw+lmP7DWDEWflQHAzC79gH+yG/Lr+j+8EfBJAa9hikzA825xwoUrpzXfv43jh7pIVJCGFO+zlkB2oh3NZ/YZLmvU7Cd6NRHYOTqaf1aRguoOZsohJi1ovdJrq6s25LObM/uaTd6wAOPcCjzvYeG0VOj8iO83K9pVjgux6Db8aiXbn6TcZLFSZyeEAA/5Aw8cgmvAZsde+pqzXVQXD1k7I34QORJbaYHn5XeR7YQ/xgVjKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by MN0PR12MB6317.namprd12.prod.outlook.com (2603:10b6:208:3c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Tue, 21 Apr
 2026 01:22:44 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf%3]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 01:22:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Apr 2026 10:22:34 +0900
Message-Id: <DHYFU2313OZG.3RBEJ64S9R2OC@nvidia.com>
Cc: "gary@garyguo.net" <gary@garyguo.net>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 4/6] gpu: nova-core: add FbHal::frts_size() for GA100
 support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260417191359.1307434-1-ttabi@nvidia.com>
 <20260417191359.1307434-5-ttabi@nvidia.com>
 <DHXE2MBVLV2S.3AUM31VR2XC0D@garyguo.net>
 <DHXLC2ZLHLWG.1Z3SQHOEYMYH3@nvidia.com>
 <DHXWPED46OYC.U21Z21V0PM3C@garyguo.net>
 <DHXZULC2O3CE.2PNA9P12ZPC2B@nvidia.com>
 <a2bb46f8cb312643ea5997ab4b58042850554a0c.camel@nvidia.com>
 <DHY9K4KOTNP3.1DU2132JVNLJU@garyguo.net>
 <a6bdeca9dd144a50cb59169f20833c1dc70ea700.camel@nvidia.com>
In-Reply-To: <a6bdeca9dd144a50cb59169f20833c1dc70ea700.camel@nvidia.com>
X-ClientProxiedBy: OS0P286CA0048.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9e::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|MN0PR12MB6317:EE_
X-MS-Office365-Filtering-Correlation-Id: 6720212d-fa4b-4255-17cc-08de9f447c86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|18096099003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	3mya0IU5jyb3UGJIa2sk1oHXJOFdEwqD4EszJdLE6YtoPaBwdQePEzCPrE3eVt1ayvN7M/qA9EAKgH+PLqlVC3o8aZHFiR+S2ckNTZkeHlBC/UPgkknIJz1zLg4MFSUnTU290q2nkjIA6oq8ByyzXqCedQugLzO9OtvicV82xr1MxjFAGNllWP/aGdVVQvjxVXEym3JkwZEX5Lg+2c2rdB177SzGiuMJ0fLovxbB6acQUmM4g8oR4HNS3AedEByfSZEVBfCB1MNIRIb2TEualgMZPbiC3SFM/Xzh3iwvJfUhjXSiWSG1wynR1YdHGJJfwie0Mm/Nuk5uTooyXutfebWLQKnaKQxOG/QC/oeJT+5f6w71uyy69P4Onv1bwRM1HoNpM3onVCh6D4SkJm3ZpHjFgT4Q6l3edtXZpRxIT9E0e+OuBVqZWEXjjvmYI2xuHghP4acaAA0IMbFwy8JLSDywMUIiQaOoAzvwOxJUXyTY83LqCUnhBOV7WfLk9D2+YtolS6U+YJaJbGRMSnlNSqGuCTT7DkAwH+ZvI+ts+X9PdQU93n6uTj1zHAM3wtsHHgE+QVbhQaZpmTuqI0coi6eVt8523Qxlth9e6PvdjUE3Iz8YnHOb3EehD/sXMfSibniHD4hi21E6ykGTx9AmmV469Xo82RCsfx9GBYwfb0PI5TC7ngdq11Iv2ycmtZ2xO+IGhRbKTFKiFSTKEYkQxDsq6PV7a0kD//j30b5zfbQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(18096099003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVlzMmxjRWNCUE9UWC9kQmk3cGtVSENWSDVDcmtvR25YNlVhZ2pOUHZFazhC?=
 =?utf-8?B?cm02WjVsempKN2tXaUZmOGtndExIRTdNckxWVTE4cERoWFNid0RBMEorZk5Y?=
 =?utf-8?B?WlNobU5SSDNBSTR1UmdJbnVoWCtlV1ZWb2d4MXdlZTIzaXFkVS9NaXBBNVB0?=
 =?utf-8?B?M3RwN3RjS0xYQWtSSmp4RXV1MmlqMEVCa2FPa0xpRkVIdTFIOTd5S1dNUUJN?=
 =?utf-8?B?SGRLaXh5Q3ZWWTNKMG9tZFhNT2U4N0pqWVJjQzRuUkt5UFRZdlpjS0VLZDgr?=
 =?utf-8?B?ODdFbStMMG9YbFR3N2dXb3hlRlFpWnNoTEdBWnZMY2E3cjhPZ0Nxc0dlUyty?=
 =?utf-8?B?Zld1ckxaaGlzN2lOMjNVbkFXaEZ3aFZDYVNCa0JHS1VUcGsxZUNNNGsydTJX?=
 =?utf-8?B?Si9yRWVBaTB2bS9CdjlYWDVsWHlrbG5jNnB6L3NDYjRsVkNSUmFRSUZ4Vkpt?=
 =?utf-8?B?NW9Vb3dBQ2lWelY3Wm5lUEpVdmtUNWZFRDRhMDZUNHBQY3ZZUDNFWnFDa0t3?=
 =?utf-8?B?ekw5K0lrTnpZQkZQMHlrYTZyUk1XZVcxYkl5dGlYUjdXd1czemdZdEcwVjlw?=
 =?utf-8?B?d1UvL2tVS20vZjErVkJ3UUh0a1o0eU5BSUpNd292cGVIaUVhM09xZnYxTHR5?=
 =?utf-8?B?YjVVeUxRclk0d1hjUjM3dklhRFR4Qmh1QURuMGFtaDllU0NNdGsyVm1Md1VR?=
 =?utf-8?B?TmpZZTV1WTFSemJ6THlQdFlGZEVyNFVZTkc4aFJiTHpCc3RIUWdsRW9oa09a?=
 =?utf-8?B?TE1wQzJ6Z3A2V0xIYWZPZlNWTWFqRDZIRmxzbk5UNit0aTNKM2M2YlRRR09L?=
 =?utf-8?B?QUQ3dEV2em1HRjF6azRDS01MRmdNOXV4R0NLbUJ6dHFydnBORzM5aE02RlBG?=
 =?utf-8?B?amVCeXFManNGR0V1VXYwYjkyWDlKd1dLVWNYQndMOW5rUElnSEgzL0x1aTdC?=
 =?utf-8?B?dDlZbkQ2cGxiVXlQaTNlS3hDcFgzUEUxMThtdnBrQ1UrWTl1Z1VUWm1QR3RM?=
 =?utf-8?B?RFhJRmdPNzRwT0hBRnA2TEY3VnNNVlJreFZQWmYxbXZYSWNQWHhibHRUNS9q?=
 =?utf-8?B?WkZKdmJ5QnV6cVZSdi9WU29vWnU0bGZqOTNuUVZlTmV0VHpwRkwzSXJEMkNB?=
 =?utf-8?B?aEVUd2ZWa040byt4RlVva2hKMmNVM3NibmVqNXlMZGR0VU0rcDcrbFVzWkZu?=
 =?utf-8?B?QmRJSXVpQXR5QitQaXFsMW9TU2hGMDBNdG0zaEsyWmFzMzBKRVkxUWw2MWhv?=
 =?utf-8?B?Sm9XQktsYjQvSVNUa0JmeHNtQ2dxRk8rZk82WHZ5Zno1U05OazFlMFRtcUov?=
 =?utf-8?B?Z1lsVUorUFNrK3FpYnhVM0VNNmY4UzFqMFp0SFRVTzZOKys4dzkwQWpLd2Fz?=
 =?utf-8?B?SWtvYWJQSEVyWStJY0o2d2hqaDVjdXJ4NE5mWXNid05aMGMwSHY5TTdUL1Jh?=
 =?utf-8?B?ZTA3cjhDMEptbXpackpVaC9Qb1lNaUhFYm5LTGMwcnZxYzF0a2cyeXJ4YTU0?=
 =?utf-8?B?czZWUEVRckdHRk8vWkE1MDZHTUlHMWxhM3lRMHluS3BwUXR2cnJEWEhCU090?=
 =?utf-8?B?a3dSMWh1K2JVbkQ3VlhKS2gxSW9ZTkxBa2hsSEZYOG1CUHZ3RGtFNGYweEV2?=
 =?utf-8?B?RFJJU25vU0NGakRLbTF6OVQ4dStZbjNtMDNoRTJ3UWQ3Z3pMNEhEZWlRM2py?=
 =?utf-8?B?ZmdkMTg5YTJuN21CYUVGK0tsZmdtVkpBYTVoRWZZR1UzcDBNWWlSM0Q2SVNM?=
 =?utf-8?B?T2htTno5amdSNFpmclRDVXlxZ2JBK1NKbG8yKzdEbmlQZHJod3U3U1pVSldI?=
 =?utf-8?B?enhINTdxenF1cGN6VWtZcVcvbzdxNWJucUhUZUxlMG9IalE4Q2pqRkVoWlNE?=
 =?utf-8?B?UzUzOGlCZFN1VGNUL04ycWg0SmppK1JROXl2TkZ0MXJycDR0Y01hZlJPZnAw?=
 =?utf-8?B?NXg2Qko3YzJZQ1oya01kOERqdFZuUm9oOEJ6SHZkWWFDU3N6YVdGVUZaM0tK?=
 =?utf-8?B?WUcwQjk2YlNveVpMSGNlOUU0T1ZkOHBGT2hHMlFRY0luYnNkNzQzRG9qSzFB?=
 =?utf-8?B?TDBpNFdxdVFwTTVqUk53TGxoMWl3cUJUekxyWS91RGtUUHNKWW0wQnlRa0Zt?=
 =?utf-8?B?bHNaM0NjTjFPOUR1V3RuY2J6ODRNZk1uVHBnTXpiQjNJMFlnYkVmM3hYenFU?=
 =?utf-8?B?MGpPM3JmNEl2Q0t4UU9WWEJXbXhDZEpjSHZHUWVzMXFWcDByU1lMb2Q0R1Y1?=
 =?utf-8?B?cUtneEtNbjA4eFVPUWxURGhsWGpCd25KWXFHOCtLNloyWDlhRkhXQjdnY3JM?=
 =?utf-8?B?TGlrS3EyU1BLejhtR0JxWXdpR083L3dpVzh4STBoTXFYZnBqV0FFTEdCTjV1?=
 =?utf-8?Q?KSOZqOtGInVEQ5Zz9q55VP8pAtO3YNgtwdaTRP0WEZPwk?=
X-MS-Exchange-AntiSpam-MessageData-1: 7Wr81n8J8A+qyg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6720212d-fa4b-4255-17cc-08de9f447c86
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 01:22:43.8919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1+D1FxSGl0C3NNATDLMesIT/O77dZpDEiCTAe/auH+0jKpdVUjpCxKlFTYZWHFbiJsSE/Hsh8/KL0f9Gxyv0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6317

On Tue Apr 21, 2026 at 6:15 AM JST, Timur Tabi wrote:
> On Mon, 2026-04-20 at 21:27 +0100, Gary Guo wrote:
>>=20
>> Ah, I see, so this is what the "supports_display" refers to in the commi=
t
>> message?
>
> Kinda.  It refers to this FbHal function:
>
>     /// Returns `true` is display is supported.
>     fn supports_display(&self, bar: &Bar0) -> bool;
>
> It reads an arch-specific register to determine whether display is "suppo=
rted".  There is no
> register that tells us "needs FRTS", and so that's why frts_size() exists=
.
>
>> > So I guess what I'm really trying to say is that I've done a lot of re=
search into how this code
>> > works, and it's written the way I wrote it for a reason.
>> >=20
>> > As for using a Trait to define a default value that is just overridden=
 by GA100, that would be
>> > okay,
>> > but it wouldn't be any clearer or more accurate.
>> >=20
>> > I personally don't like `super::tu102::frts_size_tu102()` and I think =
both tu102::frts_size()
>> > and
>> > ga102::frts_size() should just return u64::SZ_1M, but I don't care eno=
ugh to make a stink about
>> > it.
>>=20
>> Thanks, that's a very good explanation how the reason the code is writte=
n as is.
>> With the information above, I'm happy with current approach.
>>=20
>> Acked-by: Gary Guo <gary@garyguo.net>
>
> Thanks.
>
>> I think it's important to note that not all of us have knowledge (or eve=
n
>> access) to some of the context that you have, so something that may seem=
 obvious
>> to you could require some additional background or reasons to be added i=
n commit
>> message or comment.
>
> Unfortunately, the process to boot GSP-RM is so convoluted that it's not =
really possible to document
> everything publicly.  A lot of it just porting OpenRM (and to some degree=
 Nouveau) to Rust and
> saying "Well, this is how it is".  In fact, it's much easier to mimic Ope=
nRM than it is to actually
> read the internal documentation to figure out what to do.
>
>> Also, in the commit message you mentioned
>>=20
>> > Introduce FbHal method frts_size() to return the size of the FRTS
>> > window.=C2=A0 GA100 is a special case in that there is no FRTS, and so
>> > the size must be set to 0.
>>=20
>> and this probably should be corrected.
>
> Ugh, I thought I caught all of these.
>
> Alex, if you wouldn't mind, change that last sentence to:
>
> "GA100 is a special case in that although there is an FRTS, its size must=
 arbitrarily be set to 0."

Sure, I've fixed it on my staging branch.

With this last point cleared, you can consider this series merged as I
will push it as soon as drm-rust-next reopens. It also makes the
Blackwell series a bit smoother, so I'm happy we can push it first!

>
>
> If you update to the latest git, you can use the new "git history" comman=
d:
> https://github.blog/open-source/git/highlights-from-git-2-54/

Thanks for the pointer, I do commit log edits *a lot* and this is
definitely going to help!
