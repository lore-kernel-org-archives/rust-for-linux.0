Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A8C2BE7BB;
	Wed, 11 Feb 2026 14:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770820399; cv=fail; b=IG+aRozZv7qs9xPbVeY22bc2X5u7hykJIfU+x4zKbC9ccKxEjo5L1JK+bWEKMHmfXwQT2LI/21LfLchfzM32qWmIWflYdkzGtiweUMc8ZVOEdiIovjN5BQKEjxHGaNu5XIn9GGpo+qfJd33RgfJ03CK0u+cl+1m2WffGA6p8ztw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770820399; c=relaxed/simple;
	bh=43muu8u/i55AHJpMGRxlLK7cj3NRVDjNB9RlikufZoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=b3CiNZn5RhS4ub4yNCCEnD2EYtPDl0sFxmSrQLpTDHJ8qiREnAkwlCmioN+IEsf4ohlk3Gp4ZG4ddQglBG1Op2sczvT4/R58N1KfRuOb+NlVmiYAYzl3/xuEKRRy9wP8xUaN4ZW97gMz+dMRtDXaJCQYaeGjSD6e26sfxbJWXGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=r1hhKWCi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=v+xhIoz6; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="r1hhKWCi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="v+xhIoz6"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B9umfG1998105;
	Wed, 11 Feb 2026 14:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=LVyv4/e+WsFpnYpOVI9Vp6QjfiCzB7pgCtWPTCFf9C0=; b=
	r1hhKWCi7D0cdDbKAtX8was1xy3DRm4Y4TXgRRhcZjtumGVNxCpa8ERDI92uwl66
	SeXMxvvu3VXKwFOO64v4kUjnNLxMlYy0mSn7h4rhMqOcdTUGXoZ4wGSdmH6KwTWZ
	tHJqYlqN6aqSQ6HyGwe/ZkCt3MEQzf//J7b2wqaxMD5l1P9Hy/B3PYoeAeU03sx9
	X1Q/7TteP79LMfsJ6q55wXbU6DcAzHghi8e/+ee37T+M8u2yYH5rvnyweDW7e8JA
	Wded12J3+cmBqoIffKkEd1fo3HVNMjykiow+OVFXu2XpqQoT6F+Zu2yMFUVaDHfB
	mb/7B8ezg5w6CXbPFHhbaA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c7s7ru1gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Feb 2026 14:32:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61BDGOic032894;
	Wed, 11 Feb 2026 14:32:50 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011071.outbound.protection.outlook.com [52.101.62.71])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c825v4bxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Feb 2026 14:32:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pG5A61HfA+H02aWK56KK7A2P6TrDhVmjG1z6qx7er+OBpeXoc+vTTytAWk7wrsgLXRM3t/zShU95Ca2lOCvqas8YAHGeXBed07eaU8vCmnAKcWJIMwra3ILOvN342dqWaIqoNQo+NBoy0yYidg1viLLVw0lJ4Kd5zk8g4pqxJUwf+furRMqUKeLHBu8QiVyHXuCvwZ218TERKFlPLykv5a2sxkYNbcc4Gx2YXmmsHBERZVW9NadxrCbz7pGFnYTmYPpWbW/IRADX/HfGOndU9jpDLjl4NvIUQxFRS8dk/ts4U80sJZ0Mdw3KNhBGW8uZhaSs+OkT9bUxdHsy7Lrkyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVyv4/e+WsFpnYpOVI9Vp6QjfiCzB7pgCtWPTCFf9C0=;
 b=bRqeDXXsy/QyeN0dhn5C/+SQ6fzZKCvrzmVlDfHXQaMMYnUOd+UMOtXOWspstuFnrDVu2BqxDwymepwG7hHUgaKab1Sd4NabuV2239V5Qs5XmUnQZxlYm+ln8PaA5XrHFjvcmM1Zla6Gaavmd+aqcdDgascYFMgnkMqUX+BYooSBwvi5WChW2IMgTbYooF8CfWlsvw2l1pAx8d/BH074MVwTzhPzntnwCJPkIpaIoiw4LjslrdrK8MbFIs87DEcSvU+QaLZfzWjs1V3ReduxLTFLadD6PwJTAbS0JbdruD/8Jy0QvLIv8GjCPnLgPYm+DnQxDhZVWooyNp4vztJuBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVyv4/e+WsFpnYpOVI9Vp6QjfiCzB7pgCtWPTCFf9C0=;
 b=v+xhIoz6OXBhzH1dXX3ErZ5+dXO6EZuVnDN2UvbiPcKXI/kzNVrUmKtMvrekRwP1nM0kAYJKn4yjSViLqotU2j8qbP2vkZ3DxTOZCvIRy8ItpEqWnju/DLixd4wwgmgg9KHbsNZEueB9pZ2kaX5zd2452f8i+C0Ei1rFsKSTmR8=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by PH0PR10MB4501.namprd10.prod.outlook.com (2603:10b6:510:43::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Wed, 11 Feb
 2026 14:32:40 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::4b84:e58d:c708:c8ce]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::4b84:e58d:c708:c8ce%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 14:32:40 +0000
Date: Wed, 11 Feb 2026 09:32:36 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Tamir Duberstein <tamird@kernel.org>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
        Danilo Krummrich <dakr@kernel.org>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Lameter <cl@gentwo.org>,
        David Rientjes <rientjes@google.com>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Harry Yoo <harry.yoo@oracle.com>, Daniel Gomez <da.gomez@kernel.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH v3 05/12] rust: xarray: use `xas_load` instead of
 `xa_load` in `Guard::load`
Message-ID: <hq46fcdy6zvwcwlbtbjynqadiwy3wjs7raxioime2et5amzez6@wvzzlkiijwvf>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Alice Ryhl <aliceryhl@google.com>, Tamir Duberstein <tamird@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Tamir Duberstein <tamird@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Harry Yoo <harry.yoo@oracle.com>, Daniel Gomez <da.gomez@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-5-f777c65b8ae2@kernel.org>
 <zqo3qcdqlrxnqxl63kqeuvdacpbbywdrcir2kfwh7j6zvbfuq5@wspy4e75axfz>
 <CAJ-ks9njGhT85pgUSahki989Y9vn3XOBNO5wxB8wE+KvbL00wA@mail.gmail.com>
 <6sd4numrxigibwynr2lfmtdj5uabggrx2l57igtjbnq4uwddrm@wipmwcmqbkjn>
 <CAJ-ks9knC3pKpiMaG6f3C1Kr6su9p26hM7YvVMzsVwYVHGtm2Q@mail.gmail.com>
 <CAH5fLghKwNEdVeRi3H3LQ9NTPYprpAeY41-jgfq8YEST9PaGdw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAH5fLghKwNEdVeRi3H3LQ9NTPYprpAeY41-jgfq8YEST9PaGdw@mail.gmail.com>
User-Agent: NeoMutt/20250510
X-ClientProxiedBy: YT4PR01CA0280.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:109::15) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|PH0PR10MB4501:EE_
X-MS-Office365-Filtering-Correlation-Id: d0adc288-e4db-4232-1db0-08de697a68d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|7053199007|27256017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlpqWHJYTzNBa3V3cElLNHNBb2I4MHdsY3dEMEpoelJUWHpibTc2MTJNc0VY?=
 =?utf-8?B?c2ZVamlLalBRZDh5TFBHNHNHNjZBSUw3eW9uWXQrL2N2cVFlV2w3QjhML28x?=
 =?utf-8?B?VzY0dHdlc29kSHVwMlVGay8yVnRZNDRtKzB0YkQxM09VQ0dQMVlCSzJ5L0Vx?=
 =?utf-8?B?WTJqYndWT3lYM0ZoQVo2OUh0TVU1cW1iY01jb1REY3VzSkhLa1NXcmdicnRz?=
 =?utf-8?B?L0pZaHgyMDA0bFhKTkRsQVNFaUIwbytBcTladmJxTW5iK2E3QnE1dGVXbWwz?=
 =?utf-8?B?bUN2aHNRVm9XNVJ2YjB5M1NHSjhvaW41WFNoY0I3MHhUZEFhcnlNMXpobFli?=
 =?utf-8?B?VEt0eStMb3Y5dGM3YW5BOFB3ek5nVDdSSkZYVFVpSDJ6cjg1ZXZzMEcrdEow?=
 =?utf-8?B?VUcyWHFSQlJscStNdUxUNzhndGlpRVVTbktvSFQyZEZvN1lKRlpGNDBkY29J?=
 =?utf-8?B?R0JCK3VLbW9xL2M5d0o5SFpSRjRHYXkwbjNkcG1qb0xMUFpoQkpEcnZLOC9p?=
 =?utf-8?B?c2RHRGJqV3YzbWt1VlBzSmIyU2k4OUsrWWs2U1gwUVdiY0RRVGdwZTJ2UGpt?=
 =?utf-8?B?a1lycjdtUmIyLzMvL201QjFWNS9uaEwxeElyVElyMDM3bm5PdC9ZRDJ1Ry9L?=
 =?utf-8?B?ckVmejRWQUlGZlozTE9SR1FaUGNYdlFVSzMzckFhejdOcWo0NUlJajhDdDFT?=
 =?utf-8?B?U1BvclNNbmNPNkVDTWdUMVUvY3ZXSllwUG5ZeG1PeFpoc3VmclZTQkZrcUR1?=
 =?utf-8?B?TXBkWkFiRFlhT29PeDhBYlhaRlF4MnRXTlU5eG05K0Iwb2ZRWUU1N3lpQUJN?=
 =?utf-8?B?Vm9qWWdIYVRoN0dNNFl2VDBJMnR1MEc1TE9SdUtJMnk3N0hoZzVSSUNYcVhu?=
 =?utf-8?B?TTdIYUFkRUhtbmFwZWJZK3dlSUhlNXFwbUFyS3RmZDlWSWF0M1BLVW16Uk9k?=
 =?utf-8?B?NDhWa0NmcUE0eVdtbmdhRjR1N0xzcTlrRGZNY29mY0dkQ1dwR1hzZk5xQXJw?=
 =?utf-8?B?VGR3SXMwaGpnb2lEVU5KdURhRFQvd2xUQlc3L21oSmN1YzFhdmwxSG4wbUdr?=
 =?utf-8?B?VGhJdnRjMnE0ZkcrZFg5S1pqMlMyaUJpQUNwRHdhLzhlc2JsS0tZc1Nkd1FW?=
 =?utf-8?B?UzVZcHFNYW9ZVzUzeVU4Y3cwaXNXamt6b0M0NmdJOTR6dmlKaU1Ec0RkMVR0?=
 =?utf-8?B?UGxnRUlyOFBYWjVET1N1dEl5TFprMDZOcjJtY1dJV2FZTjZTUTFOYTB2UEV5?=
 =?utf-8?B?Y2k5VGhRZkxMS3grS2c3MXF0eUNBd0tlU1N1MUs5TkdUU21xYkpaWlo1bkJJ?=
 =?utf-8?B?MmFZMzhUNytFdXlWTEJ1RkVqTnJabm9sZ3I1SVBlYkx0c0xzKzBFSkNqTnhT?=
 =?utf-8?B?aXVIaDNzOGRtMmo2Sk5QSk5ncU5kM0FDT2x5ZHplRkxKSUFRV0k4S1V1azNH?=
 =?utf-8?B?YWRxTk1uWk9JZ213SVVKcEE1a29ENzZhSm93aGZ5OGlRL25VSkdjT1JIejYy?=
 =?utf-8?B?U2N3aG04a1Q5d1RmblJEZ3NTVVBvZ0FkaGpOZnRHNkJFWDhNSytjTEF3KzEy?=
 =?utf-8?B?NGNxOWl3NVFLU1M3a1JnbDBVQzFjOUg4YVBCNmlnVUVSS0ZKTmRWSEVPb3FH?=
 =?utf-8?B?aVIybWhmM3hvSzdhNU00d3M4YjdveFhkYmJudVltc1FJckFmbXJOK2xjaTJN?=
 =?utf-8?B?ZlhMWFU4ZlpUL2VOWTJnLzhYOWp5SDBZSHhLQmhkbWJhTFZPeFQxbzlvRjlx?=
 =?utf-8?B?TUIwZkNUWkF5dWswWVBhSGdYWGlmWExLK2hKSmJWM0Z2TG9uUFZRdzIrbjZv?=
 =?utf-8?B?bUwxZmlybkFLZWhmSUoybm9JaFVaR3dDb2lzeElJZmZwSTFSYnZWL2pkdXFD?=
 =?utf-8?B?VkZDMVk4elBNbnpndWUwaFV3Tk9hTnl0QlFBZHBOa3FZb3Q2TVgvSUNpQU1h?=
 =?utf-8?B?S3J2a1ZMNXM1a1pkdFNHWTJGa0pJRlNrNUNWVmRJN0JiVDc2c0JmRkcwcm96?=
 =?utf-8?B?SEJiMmlwKzRLS21aYTcwRlNNQkFQQXBycEMvOEQ2SlRCekRPSkZzNjh1Mm5J?=
 =?utf-8?B?YWo4SFpPUlBKRlBVaG5jUHltRWRpbzM1VnU4V3dIMWtnSTFQUXQ5U1QxWEd1?=
 =?utf-8?B?Qi9MUWNPN2ZvVERaTE5PWWNzcjJ6WldvbklGdUxiL3N6djE2K0wxaFg5Z244?=
 =?utf-8?Q?6I9YcO//Hv94+N/MH3YKuqg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(7053199007)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVZlZnF1WFk5dG9UV0IvalQwSFVoS2U1cHBKdkxtTXFqa2xMd290amsvbDFj?=
 =?utf-8?B?WjJyTkNsbFNKbldIbkt6MkdLZjZ3YnRuUjY2R05WcWcrK1FyOHlnQmhMayt4?=
 =?utf-8?B?TWUrV0drVGNtcUpIbW1JTXhSMGo0ZmtCbmcveExrdytuYWtnQ0YyN1IyYzk0?=
 =?utf-8?B?eHBJOXBKdHF3aG9qbEpFdUNpME92NGR1WXdTSm5WaG1LaVdkTlc1M09DcGpK?=
 =?utf-8?B?RnBLRVMwdVh6bDBSS2xQd3RQWkJzS1pyKzMwM1BqclBTNEU0Q3NhRXpxWEZV?=
 =?utf-8?B?WklCUEJDZU4vV1dwVTJrSEZHem9BK29RT0ZyOGZWc1Jha01FWUFKTUN1MStL?=
 =?utf-8?B?cXJGTURhOHpBUGgzVmZGdlhmdk51SVk5K013VXF1cE5DMjllUTNpVjkwSklp?=
 =?utf-8?B?K1RYRkF4RXR3emxET0NYeVQ2enhDcVNqQlBmRWw4YlhhdEt2eFM2ZmFTWVk5?=
 =?utf-8?B?QW9VeExKSktsekdhc0xORW83N2taSHVTQ2IrT0RjN3F3MEVxUlRWWlFOdzZ0?=
 =?utf-8?B?blM4b0RpMUt0ckNhMVVFYkJVNGJvYzg5WTZTamIxczV1NTlhaEJTT2VqRDlG?=
 =?utf-8?B?amtqaFVJRUFBR21aaEJONHR6VVJmcUNlSkNiVlVtcjMramRjRjB4WC80UE9L?=
 =?utf-8?B?TlZmUi9VdmdNczI4UmZuM2JrVUlLbEZuSnRNdW8xQ1lwaHFwbnBXaEU2SVVj?=
 =?utf-8?B?Q3NtaGpPcHZxclVXOE55L2toaklVSkY2bmNHb0lBa3NPTERDYjVmdFo0TzhT?=
 =?utf-8?B?MVNsMkpmWlpKZnkxcXlidm5IdE1GRHdTZCtQbU5JaFdlT1FTWXd5MkNTL1Rp?=
 =?utf-8?B?dHR1SVJ5ckp4Uk5ka05QL1UzbEtjUXNwU1AreTZnZnZ0NnMrOWxLRDNVbzJw?=
 =?utf-8?B?SkRBSUhyUFNMWTBZQU9YLy9pcTFodVE3NkdGYndUMTUwOVF0cXRXUkREcDAx?=
 =?utf-8?B?cS9YR3FHWUNUV1U0LzduSWZPNFgrbEdmUElZNXlEK2QvWVQ5OXZaQWJ0KzFq?=
 =?utf-8?B?a0FtVjNidzNabE8rQkpNMytBTUtFTDE5WjhCT2J6ejlWaUF0RFVnemhneUl0?=
 =?utf-8?B?Unp6ejQ3QjRGSnZVT0NWQWs2cVpwdFJjM2VPSzRFNGk3aUFxRFNIcVlmanNC?=
 =?utf-8?B?WEhibUZSWmVzYXZQSWpzRlFhKzRMTnpMZmJoQXM4ODZkaXVDU0dpY0tNQVBB?=
 =?utf-8?B?YklWOU81REQva3NRa2JrOTl2aUQyaDNkZUxnSWlTKzFvVlBRSnVjdG45cS9Y?=
 =?utf-8?B?S2hSSkE2OFVyaUR5WkoxYUp2ZW5zUy9uOXBBUFpDMXd1dWI5ejZVQm5lTEdR?=
 =?utf-8?B?b0hZOWhWYVU2Y2YrQ2ZMWjJXWHJhbE5Xd0kraVZieTZsVDFCOUtRcTZLS1Jo?=
 =?utf-8?B?cVRtcVYwc3Z5blVnVzJUbFZ6ZWE1ZmJpeGRIc2tHcU12akVCdlFoMlpnSCt1?=
 =?utf-8?B?THRINEJMT0ZabHZsNzJPUDBoeHlxaGtPK3dZOHRMN3FmeTBYTktvMHA3Z2U2?=
 =?utf-8?B?d3poeGpiTkZSS2RURHdZK1hEYVRFcituWGZ1TFNBR0Y3L1crVEt2eXZYK04y?=
 =?utf-8?B?NExMNmhBa3V0VTR6OS9iSW9pdUJZdjFLSDdENEE3dDZoVDVTWjJSWG9wYU10?=
 =?utf-8?B?WTJYb0dzT2hYOFVnRElBVU1UbjhRNlZWc1NWYkhkaFp6bVVaWFVkMWtKVity?=
 =?utf-8?B?SGNIREk1QnJlNHpWbFk5cWxkM2luT0RLYnZCSFVDc2tsNGJJN0d6MVhDNkNZ?=
 =?utf-8?B?TStPaU5BdUtjK3h3am1SZkdqTElwQ0VqdlF1VDlObnh5Z0Nkb2pYbUZlKzFn?=
 =?utf-8?B?RU8ybHplVVllY3hhM3lXb0RpbG9HY01KbWV0VTVCb3Y1T3F2L2FPOCtpcW1z?=
 =?utf-8?B?dFRNM2VuOFFPYWZlMnNUZlhJYWJFSkpzUVo5eDFzNVpUU2phK3d4MEtlSUQ1?=
 =?utf-8?B?UklTcUc0USsvVlU3UDZSTEMwaW03cGlMZjVwbFRYdkpOWTYyVk1xRzJlZEg0?=
 =?utf-8?B?eEw0bXFPaDJjZ0ZvT1phdm5TN0VvQmRGMEdGZ2RJK1ZBNHNlWjVvTkt4TkRo?=
 =?utf-8?B?aWRxZmpMQnR0ditmdGNUaHlEZkR2RGF6ZWpoSENuL2d0L04rRGhGaDJLaHFL?=
 =?utf-8?B?U1g0cHZtbUpPbUxsZisrem13UjNWR3Uzd0cyanNZeDlNQm1ob2hZQ3ZaZWRr?=
 =?utf-8?B?bm1kUUlBcW9MdTU3TkNzZk9HT0xta3hXbkN4R3Z4UHR0bmdrRk5WVUM0YXdJ?=
 =?utf-8?B?aS95MFoyNjNmMitTdzRXYlQ3aXh3ZUszNjkzd2RYWkdhQlpMMG1GQm9NMFo2?=
 =?utf-8?B?VFIvaUUvSUoyWG1MLzVKNGdqR3lmd3ozbGdIdnJ3cnV0SDBvalpvZz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	koSkqpbyJIQtYwpoFI/fHpSDu+h0itDWqx2LnVMMh6gxAxTKC+IBIDD5N2NbaZEzkCzXMZXn3UYL2939FmCSD3HJgC/EuQidi9m9YaA5HxmOVtBrqLjTplRZgQsV9or9DBD2P78IS+ALvF8NlQXZqRmCHABZXTyEPiRkABYjDxg1D4WnCLFvVzev5LdUatmt6/ThBkT4h7ZVdoNXdes1OdmHmzU6t6C1yZ7aAVWKcl8ZaPcG6Apit3+NO4RoMv3bQUWyNHlPW+/0P/LiWtKM904fomZZAoP98o2beVstRNQyWEwfxtfVCVAMKtlYSN3//uSBQtfkHhZNLhJ8KeiyNhUa47rRiT14r3Egxnoz024SxvPNhwWLiii/y/r+fEuJXas/2UQXzAHloZlfOY7jksXHnLSBY7B6vOD8aAZs8RVTmxOzSl4Ly4FTuhB6R/0/crakjnW88UB5b72hAHI+k/kDsfBe3t+trHzLIgHxW9B1tjS5eWP/iMu0fdUWtAejO+OwmXJjPC46sB6ATmBTi7akaZtkOKrKpPfYLAZr70TsaqBi0J5hp2UQvpnjWvB3638G+MpkP3qa3HPtB3/+/kTYNkyh72OTLkiR9/tvyIs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0adc288-e4db-4232-1db0-08de697a68d3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 14:32:40.1045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7F87GM2vB9rJB0n/UrkeBLgSC81O/r+u/rBcg6s72ZeSp+ldsq1wsUFHBAtVJXU8+aqkyFb82Uoph6xjFF3kjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4501
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_01,2026-02-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=991 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602110112
X-Authority-Analysis: v=2.4 cv=PZbyRyhd c=1 sm=1 tr=0 ts=698c9313 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=yPCof4ZbAAAA:8 a=QMoiTz0FH9HZ8Gm0jisA:9 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:12148
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDExMiBTYWx0ZWRfX8TocgRb1EaTl
 RVp6rvP6wF6s5lXszOIvwNEqboatTPCo9YJHcrT/9AN7uMzZbo58fuastVJ/6xCQajAo2EYIs8U
 taWSOjeIbn60VcIB7ONCQ+Fxwzgwa1FNGmXPMBbW2X08TRAcez4oE5Jaw8Tkn0zpyOPONUy/hWo
 M6QTW6pK+6/Sv4NqGnNTLWPiqUEfnT5ftmzOprSZBrFIWAyQyGBmSXbFDJ2J9pDrmtOlChgu7aC
 9sBBwU84UqWPNSU8dnGE9vXx2F+U6keDiIupkL0GQ7t6thuQvfZBOKRZOBVkzZvzeyp3J22CfCH
 ue8AKNbl1KFxGBK/qWSUQeHyfhsXfE33X8CXAFc/lkvazYINzvCDg7fSKcYG3tpUxAPhu8sqMHX
 XEtSe8pwZ8hXHyQ672VbBveOHdKHSiYk4ICcfhRiZDxUPGzvMTVhGA7eUYq1bAQskLMy3kD+E9j
 BGnjTTqahAiFoY0EfLcs4fXcNN3GPWbY7Qe4aLp8=
X-Proofpoint-ORIG-GUID: MSDIjaA6PHO2ZpunV1rcqMEbnUYqg1mI
X-Proofpoint-GUID: MSDIjaA6PHO2ZpunV1rcqMEbnUYqg1mI

* Alice Ryhl <aliceryhl@google.com> [260210 16:34]:
> On Tue, Feb 10, 2026 at 10:23=E2=80=AFPM Tamir Duberstein <tamird@kernel.=
org> wrote:
> >
> > On Tue, Feb 10, 2026 at 12:59=E2=80=AFPM Liam R. Howlett
> > <Liam.Howlett@oracle.com> wrote:
> > > Is this a temporary limitation?
> >
> > Maybe? I don't think RfL has good abstractions for RCU yet. For
> > example, exposing load directly on the xarray using xa_load would
> > require a way to guarantee that the returned pointer's target isn't
> > being concurrently mutated (e.g. under the xarray lock). I'm not aware
> > of anyone asking for this, though.
>=20
> It's relatively easy to add an rcu-backed load using the RCU
> abstractions we have today. I already shared an RFC containing such a
> method for the maple tree, and it would not be much different for
> xarray.
> https://lore.kernel.org/all/20260116-rcu-box-v1-0-38ebfbcd53f0@google.com=
/
>=20

It would probably be worth having two loads then, one that does
rcu_read_lock()/unlock() and one for writer/advanced users like we have
on the C side of things.

Or at least name the load() function to indicate which is implemented
today?

At least on the maple tree side, we have both interfaces and users for
both.  I just found the change to remove the rcu safety odd because I
assumed both are needed.

Thanks,
Liam
