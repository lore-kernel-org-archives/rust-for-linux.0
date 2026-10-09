Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021124.outbound.protection.outlook.com [52.101.100.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2864C3B0AC7
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Oct 2026 12:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791550470; cv=fail; b=hho51o8BKx6kIwVaWHZLyEhE83SwtrHrmtIa50H3ijRZ2K7RcXNivZ7ezZOAQPItMS6TRW/fCrZdP7ye/uXXlCxDUhzc2AAmGGD+q7PEozcPtvFmL065cOqDDh/LDpTulUTSc2RKVy0viZCyqvQwYeqKi3/oGl3CHaGoLmtEwhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791550470; c=relaxed/simple;
	bh=9cm6+apsGGJi8e3mjg0v2F8wcikiKEA6a5FI9J0A6VA=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=krqaI5VSeht4ffg/wvlAWNrHTru2gAuZKgs9YWZlq7cd0sEHJ2iWrruITy/spZdJHvJKdTZOJCl8pwR68AtXIHIpUGrsE8m04fxsy2za8s8f0AlAoIAjR3dneVx7CglM5Rx4eAQeTg2YHo9NFrjwdIRwGVx6Iy5WDL0K32u50Tw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=DerUa4+U; arc=fail smtp.client-ip=52.101.100.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="DerUa4+U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPSpqhSBOcxxBZcLhpulW3rWyIwoAaEnodCiasOaCvwf06Cf7RPjp6tyLYn3198mLfd+WmykFgcyCMTwcs9a2QQi51vLjY26iet+s30aqZ04TsGVMl6U1XlDDhxRg1TSEb6pLTRvf5fItcc6ERoYm3DXEm1OyJjfg3+Prj+GfefYYQSsPIItEYbEbd2tQMrLwgwrC8lQZ/LWyS5QO14/xr2g5079GxFlb61NZdrEFlXMTvSJa3mI7I7s7LK/y3mRYvmzpOVbza9n1TFACIGFZ6BBZB3hDPjg1tQjzDOd4CBBLGlxMAytkcbxA05+zY9sTWIPdnLw5rU066B+QKd3sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIrJY13+M6v3cuFDQG3wN3lw/qUnTpZwHgFg0Nzc+Sc=;
 b=fZqW8yqaLIN/8W/fACkgMKhXTAqxsAjlG9NFkrCVMBz47JUn9jDvT+dx0V6l8sHYBpMXNQHFVKH9Oly1DSpfYG+Yfs7iSy7YxFVJUk1RK5jQV9uI5W2UUQksjA6AgG26KR1PXjtlEiZVt+UshE0ufutyS/Z1IJbT/vXyLLlujweMPwRc+5JireKfHokas08QKJnxf70x/E4bQd/UH5EtlklV+wTTLErRUszPz0hRavnhcoWdy+IvJ0ZL6eb4xpvUFDI0dKn1J+7bU1HjGrTE4T/qvduRSlhjygBW5AMEFX9YbLoRYwYq5mNEbBoz3EVXTFgI17Kp6OdnE+vTwNCpew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIrJY13+M6v3cuFDQG3wN3lw/qUnTpZwHgFg0Nzc+Sc=;
 b=DerUa4+U3rCTaXjvyWiUs4j7U5LW5QfyvPp+S2TgWgZPc2x8+urOkiwCHdU6nP42ot7ZG0Xg69hk5R+uOxfQjBqFusEuGZQUr+ExD447508Oi1V9eHToL67KKe7mppCiXrd5LP2g+ogtO+x92f+Yr90KQgK/ACHYq1luGg6i1K0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO6P265MB6783.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2fa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 12:54:24 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 12:54:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Oct 2026 13:54:23 +0100
Message-Id: <DM0BMX11TPKW.3SXBKY2XRLHQJ@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Priya Bala Govindasamy"
 <pgovind2@uci.edu>, "Breno Leitao" <leitao@debian.org>
Cc: <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <dakr@kernel.org>, <daniel.almeida@collabora.com>, <tamird@kernel.org>,
 <acourbot@nvidia.com>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <ardalan@uci.edu>, <zhiyunq@cs.ucr.edu>,
 <dzueck@uci.edu>, <ojeda@kernel.org>
Subject: Re: [PATCH 0/1] rust: configfs: Fix reference creation from
 uninitialized data in `Attribute::show`
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <cUqSvTsTaMYu_TRrAABCYTNz0HZf5JeFdIq_Vv4e_-GFMgI5NwVfZJDcy8CTgc4fH_1OoiiMg2I2LIzQX1y3Rg==@protonmail.internalid> <cover.1790981219.git.pgovind2@uci.edu> <87v77bcg0m.fsf@kernel.org> <87se2fca48.fsf@kernel.org>
In-Reply-To: <87se2fca48.fsf@kernel.org>
X-ClientProxiedBy: LO0P123CA0010.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::19) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO6P265MB6783:EE_
X-MS-Office365-Filtering-Correlation-Id: c0f7096d-1b40-45e5-0b0e-08df260471df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|366016|18002099003|10067099003|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	DSPLGmlrj1jOjO2KhZtvwCJMdUco9mMpOuX0qjnvVrpqlWwyxORS1XT8szPIxsAV8MRGnL0YdqqoGQnmxK9pJua0hXpdl4bJPGEBFM+JSooAy1X6PChLDsX5sk22HyimyrQxgfS4dkRHojK/1moXv4IX1ae77BAEtd27zni48VRHqNG+W/e6pKQ8vKqDMLluZUe6jr7dLQq01GuQNRImX4kBzAUZQfNMJsXa574DrbS4uw1+DlzhUkeRtr00+GvpDy1z0dISVfxkvVDq8DJ/rew1QV4pV1Q1W2b9dcEDNJsWOfTjMIm5oK5uT5Y+15oROKq7D5yIctSlACVtmCUm/fTmZg6iB/S+4eSaoh9Brw7O2qb8En5deBvJSQai97t/t1aWHXqlp3H2g27em9kMean2KFkO6APgcV5TOuuoWUZghhP2PzjsdMarJJfqqZ6Aud2WGpny/mSxAmSmCi2ay3eb8nuz+daxNLxveY3CBq1Ov4n6ntgIq1MdmoWc7UT4ukBmuarhsMc96ZDagRKK2Nsnq9wfPxD9f91WowwWYC4hGCHJLk++S/CYzcafv4w1hTNmF59U1VTD6JQcigsOcZi4/aPe76hp/QeZ1gVR9lnZk7YfeetVhkaU2Os55nbUyw05Y39Lmbrk0fYAGD4ReRUyZD/K3nrcc06VpDXLs3Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(366016)(18002099003)(10067099003)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWw0YWFnamh6Y3g5dCtSMi85SWh3cUM2cndIZXhwNEp5Ym9oZ3lPU216clBj?=
 =?utf-8?B?VFdFN0pyQkdqOW9CNGJQZHkwVTl6bXoxcTNadDF0bmVWR1VWWUJ6MURQVWFU?=
 =?utf-8?B?WHYwWWJIV1NvR2V6d1M5SFFVM1ZnejJSM2JqUTY2WVlTL1ZVVENyZG56VU41?=
 =?utf-8?B?QnB2UGNCSkxjUXRkQm9ybnY2akVkcXd0cS9MZnAzTnhHUy9Odzh3VEtyRXQ0?=
 =?utf-8?B?ei9HMzFlSVM2VmN4MjFlcXlCOHpjeEdJQXdmTXZEUUNwTlM4Mzd6OHEvWE1F?=
 =?utf-8?B?bUJUMXdqYWtoc0EyRWYwSXo2U0Nnd3hvelgvU29LK3UyQXJyWkViZ3dSSVNp?=
 =?utf-8?B?dXlocWxUMmYxd2FWVzJpeFlMODB4VzZoRCs0UXFuclBjbUt5TjRtL2ZZT2gx?=
 =?utf-8?B?VnUzZVpOeGtsanQ3QStoNGRoSFpQdGFzQTZMS3JCSDVuR3MrOXQwODFsL2dt?=
 =?utf-8?B?MXhaSmZTTzdEaUNTditoMU9iS2dCMmttNmpuK0Qza3NMcEZLNXNaNExPalhI?=
 =?utf-8?B?Y0lwbi82dm5rckNLWktScGxEUzUyeDNGS1Q3WkViY0dURGtxVVorRnFNYzE3?=
 =?utf-8?B?cVlWRDBGb05MRE1mdnlBSm81QVlrMG9SdHhVZUl1K3NUN2lxK3NRMFNDV3k4?=
 =?utf-8?B?UW16UlhSTWFLQ21KbTBySmN4VXhoOS81T3pNTWMyNlhiQkc0cmRZbGQ0ekZv?=
 =?utf-8?B?RDRGOGZsNEhBT2JSaThIaWxmK3RYcWRwSXI5WUFFUTMvc1ZNdnUwNzh0UzRu?=
 =?utf-8?B?b3kxL1Vsamg1ZXhnTy9SVi9hMWRKV0FhS2M2WC9mMTB6Q2VXVWtDNTQxZVRI?=
 =?utf-8?B?R3I3VisvOEdKc1pvOEdzMGhEN244ZUdYa3NvTitYWEhTM2VwcEJFV3VZR01C?=
 =?utf-8?B?M2FQaXlqK1RYWVN4QUFKcm5Ea1JrclFZckpWNXQyWVoycmdac0tWRTN4VEdF?=
 =?utf-8?B?VERPZ2xIdlVTMEZJb2NrSVVJVjV1M2FJdFZGYTA4TlZyNG9rNEdVVE12a25x?=
 =?utf-8?B?TUZETHZIK3NTV2pGTys4a3RqRTRmWTN5c01aYSthWXBtb2pvZnVVaVpmUG9K?=
 =?utf-8?B?RVZsREtRZXhJc3V6YzdEOW51cEl2aW55RFZuaWg3cmhmMEZrYXdRbDFoTy9y?=
 =?utf-8?B?dmQ3MlhESCtlNXYrRGFtNlpHcW1lU1NrbVNINmFkL0IxdHBQM2RLQ04yY3pN?=
 =?utf-8?B?LzdRR2RURis1WTBUMUlhMmNKQUJ0ZlIvZHpKUUMya0JFU1c2YWx4VmY1M1Qz?=
 =?utf-8?B?TGRCbTFzU2N4YUozZklSSXpVbHA3dVF4dTRZaHUyVjdRaGx4Vm5rM2IwNkMr?=
 =?utf-8?B?YnhFZ0I4Ykd4d24wVFR2ZWJ5dTlVY1JNYnVWZ0dPQ0tQZkU0K1ZnVktLS3pY?=
 =?utf-8?B?TU1PZHY2ZnJjQUZmRDZsTFdhc29LNHZONXVTWjZXeC84azJFcXNTS2lnOUY0?=
 =?utf-8?B?c2hQWlIyTUNMYm1PeE9LdlFGL09yVTN0WXpORmJ6R1pkVjF5VWZhdThha3Fp?=
 =?utf-8?B?RVFOUi9kMXlTRThEYWsvbjhqSGhBbWJMOUJuRE1RVUl4eFduRXFXdFMvc0JN?=
 =?utf-8?B?Z2UvNVZXQ3JDalR0cUQybnJrbUloZDU2R00weXBCZXlCUW5RWWQwY3RoTjY0?=
 =?utf-8?B?SHRwZ0YwSVpvbkpCVlRTVmYybnhKMnh2WjhwZ29VVjB1aSt2SkIvSXdNRm9j?=
 =?utf-8?B?QjJjS0ZteHN2WUdrTDNSd2I3cjAzWm9vYnY1SGZaVlR6b0wwQ04xVUJ2ZFF4?=
 =?utf-8?B?eVZpcC9mWWZVLzlGRnBIZ2xyZDZYNERDbXg5Y24yNFZEbUtqQ29pUzY5L1Nl?=
 =?utf-8?B?TDNFbmVBUzduTkFJV3BwNjdWdmhVQlBrcDkrQ1d3YTBNOWFFd0h1VzhlMlAw?=
 =?utf-8?B?TkV6dk8wOGdBTWI0ZGgzUWplL3VWY1FHSjllU0xyMjVvRzMwdTkxNUVTUnZO?=
 =?utf-8?B?MFBHYVFjOEVRbDAzTlZUYkp6RVRXOENvZCtvZDJEYWcrQXFsSzRwM1ljN1pZ?=
 =?utf-8?B?dUI0aUluYXZXWEY0Z3M5bDFnSjdQSEtWbCtMRThBL1E3R1E4WVpWR2Uzb09N?=
 =?utf-8?B?RWNTL2NjS3g5dUp5a3dRVFVsVzd0THkwMlBaOWRncWpPZDVZWWQ2dndXZ1BZ?=
 =?utf-8?B?V1VXSENueG9SOWl3L3NVOTFINUs0eGpSNmlnWFZlMkFuQzFsd1c5TU51bnls?=
 =?utf-8?B?Y2V3aEFtTitVcnBFSXBDWDFic2FhTHZvbmxySjB1M3lUVWxoOW5QZ2NIWWdJ?=
 =?utf-8?B?SDVFbnJtM21PbUNXZWlMSm50bDk0ckFZbUI4NHpXREM2Ni8zT0w4VDdvRTB2?=
 =?utf-8?Q?BmbJGr4G1Qild9b00I?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f7096d-1b40-45e5-0b0e-08df260471df
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 12:54:24.3080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5iAUO9+WyiIVLCYoP8nmgt4036vOTYJWe4+dRcMyH5i/YjN99j1NBKnVN2sMRFcfQKO14rT9sCBiXF4Aj5/uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6783

On Fri Oct 9, 2026 at 1:49 PM BST, Andreas Hindborg wrote:
> Andreas Hindborg <a.hindborg@kernel.org> writes:
>
> Actually there may be a problem, but I think it may be in C configfs. If
> you take a look at the function that reads data from the iov_iter:
>
>   static int fill_write_buffer(struct configfs_buffer *buffer,
>             struct iov_iter *from)
>   {
>     int copied;
>
>     if (!buffer->page)
>       buffer->page =3D kmalloc(PAGE_SIZE, GFP_KERNEL); // <- HERE
>     if (!buffer->page)
>       return -ENOMEM;
>
>     copied =3D copy_from_iter(buffer->page, SIMPLE_ATTR_SIZE - 1, from);
>     buffer->needs_read_fill =3D 1;
>     /* if buf is assumed to contain a string, terminate it by \0,
>     * so e.g. sscanf() can scan the string easily */
>     buffer->page[copied] =3D 0;
>     return copied ? : -EFAULT;
>   }
>
> This function does not zero the page that is written into. This,
> combined with the buffer being per file handle means that you can read
> the original data in the page. The `kmalloc` should be probably be
> replaced with a `kzalloc`. This should be a problem for C modules as
> well.

Why is this an issue? The extra uninitialized bytes should not be used.

Best,
Gary

>
> Cc: Breno Leitao <leitao@debian.org>
>
> Looks like I only replied Priya when replying, so I'm adding back
> everyone from the original email.
>
> Best regards,
> Andreas Hindborg


