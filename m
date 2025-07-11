Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2074.outbound.protection.outlook.com [40.107.96.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0532827E07B
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Jul 2025 12:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752235496; cv=fail; b=OFaYsIOZge6Nd/HXpUbCiEWWrxUnLO3KbrUAnHlAcYlzsLQffpGjlSibkcX9wIjstu6LGZQOvSTPrqvFC1q5rbbn+xSe7EFXR3cKmTFje7qEGmgjFsKQSbllt8vT5gA0H4GbqIVT3BxIHbLY0HHS7aW6QxPWpKYzvr564T2lFFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752235496; c=relaxed/simple;
	bh=kw6M1HsgNg1LzUvRxd9yktL+jQUVifsT4DhOO7JPrgQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=dP99kxcpLsXXYPDksznQXre+fyt7L2UWxaOvxK3A77GQ2En1NDoSQ9qUcleAAIwznAZ2JPG0TViBb4GuowAy5Lu3UqQDkp6P/xaMHDdlEv+n4cmsh3VMtydsx+AG5a/QeIqnhuTJ9iaD0JCzskjcjUhGMd5ebTBGEusyP5w75qw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bme7XaE1; arc=fail smtp.client-ip=40.107.96.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bme7XaE1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWVmu9ESfzAjCZuwjKtx0bmc71cksSKknebX16hEfbdB7Ydwj4QITgvLQ4+9EEqNGDthcocCb/lTM6byFXVkdb9zcmKns4xXN/w/duEoJ6jyfndEGQTYR2NvEjlH5pKkKFJop3b4NsXWk1st/H4bhgGK3lTwrknb5GvFskjDGujENOUCEeXPJHxRwLmwE0nyQjWxyKs2/1PB1NhZOXWAJuA0U0L6nbIjfae/nA9MmDaxS1sySJ+Bk7N1zbHMysb+OVGv2F09USR6MOBKovLerlbCPHCpiJxKO+3NafyJ9jlBXOxiExuin3Q/b7m/+Vs9Ic3ZutFI7uWgeenzTPTBAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdkyC+eVEmDYb8PzzuE22apK+LFB/3zTLt9D7o8kMY0=;
 b=Tsto+qyg5+IUfh6jezP40lj2EYmZnhzDZeJO2jYCBozFq2C2POuCTaRFE6TPDRIMvpLHT9858jbUp8YEjXhBEPdyIuGi4TREC71y/XdEKlauDcmD5lRIy9qFAlB+dak7CGpuU6EVyqO68LAoz9h7inilZw/4yz6cbgpwDdvWEDy9WAcSvGUdZZ1bTc4WFv0pb+DySM10Wi30Zy3JP5hs1Ys44KJNbxfjTLdsMqyE8jw0a0Z2SA3WREyIQLRSh6/xAz8u1JlBjXohiWfjskr5n0aJbHwPz1pFZghpz3PS+KeURyjTbUz3XoIpLmKiXJfIxsMBHsvuyuYuBD8P7qWqQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdkyC+eVEmDYb8PzzuE22apK+LFB/3zTLt9D7o8kMY0=;
 b=bme7XaE1de6fo9BO2M6OJ3IjXvkp3h5SHv6uNsJAbGPQH2/G+kz9hwDueGQGcDj7hgmq4vP9Pn+03nPoevYfWGnp0CBco8obgpCScIRjM/gg9k3YdlYyfAP3bokTKrXQmkIo3FDlxlz1YL/MA5R2zhdTNDHlhjIsw6zq7st+U17yGp1q0Cyo1b6/kiOidsi8K8owKN3oLxmnN0vkFjaXOKAFh9xqk9MPQWXfD42wbMqyZwYAf7rDgAE6gMeX7AJ1mSRLhY+ctxg6vwAzzRJmckXCvH9Q5jj+Oa4w9VPBlYVVkLyrIeDmaOUQJQpiTMGcYKXTZVpmps3NJjzFo/9TrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8655.namprd12.prod.outlook.com (2603:10b6:930:c4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Fri, 11 Jul
 2025 12:04:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.021; Fri, 11 Jul 2025
 12:04:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Jul 2025 21:04:48 +0900
Message-Id: <DB97N2MN47L3.1F7450280ONEB@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] gpu: nova-core: fix bounds check In
 PmuLookupTableEntry::new, data is sliced from 2..6, but the bounds check
 data.len() < 5 does not satisfy those bounds.
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Quaternions" <krakow20@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250711113327.39201-1-krakow20@gmail.com>
In-Reply-To: <20250711113327.39201-1-krakow20@gmail.com>
X-ClientProxiedBy: TYCP301CA0050.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8655:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de33184-7134-4ab3-b06b-08ddc0732422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QmRRY0lGK3NKY1NidHh6V3BXWnFITElrTGl2MHlRa2U4SmQ3OFJaMktjVXJR?=
 =?utf-8?B?dFZmTXFuQUpmUWkwK2ZoTVhYTkJFWEVjeXZGa2Fua256TXVzVDJacXZxekR6?=
 =?utf-8?B?a1hHcTl2ZWY4bUk4Z3dxWStNNGpkbXBIaXhLZlltRkZucFdWV05FNTBwcTlO?=
 =?utf-8?B?MWdXaTlKTWJDZTIrT0s0Q3dEamFybWZ1THhUVEEvZm5yQmxaQjg1UmZIMVBP?=
 =?utf-8?B?c0xta1lvOXFSalc0M1o4TkE1QzRIYmlxVkgwVXFjUDNDTloxTUxEelRXdG1D?=
 =?utf-8?B?LzdzWUdTTS9oZjM2bmRXOWs2K3UyOW9udVRLYStVSWxCcDIxcjNlbUZrZFZi?=
 =?utf-8?B?U3doSGJTOXdsTlVsY3NENGswekFQSVFCTWpweGhGTS9Vc1FWbUh6bU56Mjlm?=
 =?utf-8?B?dFREL2dVajJRLzJOWk5nd0hxV1MwMVEwSVB4Yk9UY0F6L1k1enNPb1NVQXNm?=
 =?utf-8?B?amZJdHNxNFFDcVg2T3hrc2h2RzBIcDRsNm1OZkZrMU9jaStkcGQ4V29kdU9p?=
 =?utf-8?B?MUJPQ0ZIZjFpZUt6b1BSVGVPMms1ZUV4a25OdncvQldOMkdsZXloZlhuZlNL?=
 =?utf-8?B?Nk5kVlErS290bnVxcTBBMXhya3JKVE1HSUhzN2xyYkJhclRIcHUvQldjWlcx?=
 =?utf-8?B?b1hTNHp2aFJkMmhyQmhhYUlLOEJ3Kzl6clJaQWhOTVpzNm9mTDhPQnJOTE1T?=
 =?utf-8?B?YXNGV3R0SGlJOURLdzU0cjl3eWxKbEtYUkx5SkRCc3dmd3pvRTRJYnBwTWNz?=
 =?utf-8?B?TWdZUyt5L01zOSs2bVVEUnJkelhWTFAvMHhDYXNsbWxTVFRNR24yQTJVWjlP?=
 =?utf-8?B?UWswRUYvZGUwWEo2QmwzNGowb3NBUzVtVDFpMlJVK1hva0NZd3d6L05pOGVz?=
 =?utf-8?B?d1VsSE90Y0gvZzlIanRPRXE2WUVEK3B4RlY4dUZmY25CdDh6a2RDWGxqWksr?=
 =?utf-8?B?dzZid0FXR0pHbys3N0VKTzJpNDI1eU41ZnZSaGJTTWhPVXlDQzhlYkhOYUFx?=
 =?utf-8?B?M1hLd3g2Smhac0NMSWNMQ0VBUG5yQUFGUEVxa3dHdWFROCtHZmlsdEl1VnZj?=
 =?utf-8?B?VVhkSnl1M3N4SXcrUEVESWp6cFZyMStMYkR5SCtQYWRPQzdQVk1vSkxVdk5P?=
 =?utf-8?B?NGZTdDMvcTZmLzZRS1h3ZXU2M0hQRzgwS3h1d3pMdGZEcXBBRUFLN2VSMUhG?=
 =?utf-8?B?TkwrYjZHVlBTNDN2ZS9SUldqcytPMDVXNVIxZ2hSakR4R0RkeW1IbGtMdm9J?=
 =?utf-8?B?RHJwUjQ3ZjdkNzg1VkF4WWRyZ0JEU2FXa3dRMXI0NHBvalE1eDRvaUZocFFj?=
 =?utf-8?B?K0ljM1R3dkFZVmY1RU5zdmxRTk5pOFo2Z1lSN01hd21XRXVMNUdWNldwMTlK?=
 =?utf-8?B?Mnd5N0RqWWdWQ1I4VENsNlBlWStEbDdzWStEaWk2Q2xqek1GREloUXJGekwv?=
 =?utf-8?B?QitMb0VkbHZwTE1VSDRRSFM5cGhBVGhXSi9Dc1FCSS90RlRaV1Jxa2hHbzdy?=
 =?utf-8?B?Kzh5NnBDWGs4WkdzMkdDWHRoZjk2OEg2N3dJbUFNVHBDUmNlRVJhQndZckth?=
 =?utf-8?B?YTRzQ3NWbWV6cFdtRFlUeFlFc1l3VHJXUWpqRGhRSk5ncXJid3JMQW9VckJI?=
 =?utf-8?B?ckRJZGc0OEJ1NjFsbnlrRXc4QmlwMlpYNWkrSmoyUlh0Z0dQaWIzRnIrcGJ1?=
 =?utf-8?B?YUUwVWRPdTRHc0YzSzViSGdmaUVPVllSV1JoYnFjdGFxRVZ6R2J3TXBjL0Zn?=
 =?utf-8?B?UGd2RGpkRWhianBGWisrdWJOei9Ga1J0OVlBNDEyM3hUWnRDdjJDRGtISHJP?=
 =?utf-8?B?NGt4UVFqM2t2Wk93MXpFZWZqVzVOQmJndHJ1ZWFJQ1hwN3hzeEZtdzcyL2lZ?=
 =?utf-8?B?dzU5RVJJME9lN05tSE9DTkFGVlduakp6M3Nzam1uNU1Ja1MwQ0pVMG9ZK0xP?=
 =?utf-8?Q?iEBKg6D/sJw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RW1MYUxSd0JVY2JOenMrYVZjQXVhWEJMYnJpNmVGYXprU3lTRDlDWm5GY3Vt?=
 =?utf-8?B?aGhTVWxFU1AxK1p4T1YwaXdiWG45ZlBZbEVhMU0wbjQvaFFOZnRQb3c1R0lY?=
 =?utf-8?B?ZVg2NC9vMDJyM2Jsc3kvOENDNStjSVZpVU5oSDBEaXhPNlpXbDF1UHQ1cTEx?=
 =?utf-8?B?eW1PVkp6NDNlMUNWR2FJYXpLUzJCY2x6UnE0ekJuY3RLRndUVXAzQ09VMlZ2?=
 =?utf-8?B?cTV3bWp6aHQrZitMRjZXUm9pTXJaTkZWWnpiQXBSVW5vejJRSEpnaVVMOGRq?=
 =?utf-8?B?QVdydUw0NVFodnE2N2EwZ3ZIM0J5UVFVOHV0czZxK1JjR0lwNWE2bytVcUtm?=
 =?utf-8?B?R2hIQnc5R3U5VVBpeGw2cUxWNXo4YkszQkoyLzdVamdBN3Ezb3ZqUGxuRE1o?=
 =?utf-8?B?eVB1bHhEWnlkMzVPaXJQZWxORlN1R2lsRC9ZTEFyZ1BRTnllZGJUZmJUL0Vp?=
 =?utf-8?B?aHNCQVpIZVFsWGJvQXQzWTlBUjI4dmk1dDljbjNWcU4wOStwVjBPSnRWTEk0?=
 =?utf-8?B?TGpwaGhwOXZ2WW80bjQ2WTN3WGFGTlBIYkErUk5HOWJ5MXEyQzhEUlR3Mjhz?=
 =?utf-8?B?VkoydDlha0lhdG9EY1VlNGZEZW1zOTlUSUJBaEowWDN4c1RJamdUeUdvQVp3?=
 =?utf-8?B?ZGwyV3l2UmxOUEY0dnBhc0FoQm1ESUlzbVIvRlRQVzhZRjhFV3lRK0JPRDRQ?=
 =?utf-8?B?Ynh4VXVEV1Zqb20yQUczb2xGajFFTWhDelZaY2J3dUtmSCtvZVlyaWZVNWZQ?=
 =?utf-8?B?b1V5UlFieWVpTks4a2ZYckxSTTFoUjF1ZlpRQ05pOUgzSGFMOXcyekQxanlO?=
 =?utf-8?B?SWxKOHA3c0hYUnZZVUR5a2dIZE9lMjcwQnBjSzY4Y1lvejR1NzZEQ1hpWjJH?=
 =?utf-8?B?SGFLY1JkOWFXMElXTzJVeEhSRFdid2tIVnNITy9odDA0L0xyTWVkUFVQVWZS?=
 =?utf-8?B?cEE2a2NEbzBnaytIU25JQndGNTQ1c0JoL29MTmEwWTBMR2pkMXh0OVhGNVgr?=
 =?utf-8?B?ek5wK3kzZGtmWGZFUmtkL0UvRzJnRnVreEIwckVJWmJCYTNOYU9ad1M5T2hE?=
 =?utf-8?B?LzB4THlBUU0weHdTY0pJcFo0UXBMaVdRY1pMNXZFTFFCYlFidlBrYjBzS0Zm?=
 =?utf-8?B?aVR6Wk5ZUGlGNUVKeHBCVUdDVU1WUzJOYXFHQStQUGVTUmNpbG1aZ2NwcDhL?=
 =?utf-8?B?QTVPNjZROFRzWSt1QjhYK2VHUnFEcUVSd2MyZDVmTkZ2NWhsVGowaXEvWGZm?=
 =?utf-8?B?dHg1SnZwMTVCR1dEbkoza1NNYUVYWldJQWl1dC91bzRld3YrSVltMVVkbjgw?=
 =?utf-8?B?ZG9IT015elIzSkRhaGdQT3hUUlFjR05CRExHMk1XaVVaY3c5OXFZbDNTa0lk?=
 =?utf-8?B?bnZmY3gyTGZEbitzN2pPVVpIZlNLa2pnR1lXOFltdFdTQ0lMWWxYMXYyQlJT?=
 =?utf-8?B?VFdEWjZXYUl5UUlHSTFtNGo5OElxZUwyM3ZaOHRLL3VCb2RuNXJ6eXIvSGhP?=
 =?utf-8?B?UmUzY0hhVlJzSTlIaHNWbGVVYlR1d2l3UWZhVUNCV3FmYUZYZmJrVHc3c0NV?=
 =?utf-8?B?TXlMbHc0S25ORWM2WmE5THg1RjRDbmNMcktUbTYydUNmdlJVZmRKK1dhbDJO?=
 =?utf-8?B?N0c1Rk0yZzUyRFdydElLZC9Vb3pBb3BtSXBPbHkzbE0zb3U3Qmx1b0FKNmdV?=
 =?utf-8?B?WWd3cHk0UGw2U2oxSVl3dzBmOUszdlo5WEd5SXhlRW9KV2tXbHd0b2hlS3M3?=
 =?utf-8?B?SU5Md2FQMmZhQjRERjJoWWlXRGVRamIvV0lWZDh4dVlhdlZnVElLaUxidFNw?=
 =?utf-8?B?WUNuOFlONUVadW44NGVMZVJEZFU4STNlMTZzM1RYOWRGY2VUVUNRMXB2blg5?=
 =?utf-8?B?SCtOQXFLSkkzeXp5S29pODQ2UFRVU1VJUmZhUnAvYjhRNHNDSjVyeFhVcjMr?=
 =?utf-8?B?aXJ1WE01cjZNRlRmV3V0aGxOdG1xRUxNZngzMnNNWWxwemhvTFh2d0Uya2JY?=
 =?utf-8?B?S0kreG5sblYrU1hNQTNzK2M2cklOU24vTVo1YVRScFlhVFg3UGJVazJJV2wz?=
 =?utf-8?B?VDJpM0EyRjI5VHh0N3RGSDlENkRoNndMOUN3VGc0c0dBQ1V5dDFicUVMcVJz?=
 =?utf-8?B?RzRiNVB5VzJNOE83djJNVjNwaVR4MWJubjliT0hmTmprZCtZbXkyK1Rpa0t6?=
 =?utf-8?Q?E/SJVA1CJaJpLZJARA0Y6XuQ6YVAyRG7rMRgG2Rmp653?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de33184-7134-4ab3-b06b-08ddc0732422
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 12:04:52.0786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +EPQ4azqplfff9A6UjKzUjKphx0ygdKdD2uU8BXvtwePNVJZshmnhXIPzlAQ8YW8I6Zz6FoXe3Qoerm+wqOdAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8655

Thanks for the fix!

On Fri Jul 11, 2025 at 8:33 PM JST, Quaternions wrote:
> Signed-off-by: Rhys Lloyd <krakow20@gmail.com>

You will want to split the subject to something more minimal (e.g. "gpu:
nova-core: fix bounds check In PmuLookupTableEntry::new"), and use the
rest of the sentence as the patch description (as a rule of thumb, 70
chars for the subject, and kernel patches must all have a description).

Also your "From:" field must also match your "Signed-off-by".

./scripts/checkpatch.pl will complain about these points (and check
other things as well), so please make sure to run it before submission:

    WARNING: Missing commit description - Add an appropriate one
    WARNING: From:/Signed-off-by: email name mismatch: 'From: Quaternions <=
krakow20@gmail.com>' !=3D 'Signed-off-by: Rhys Lloyd <krakow20@gmail.com>'
