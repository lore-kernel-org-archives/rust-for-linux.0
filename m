Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021095.outbound.protection.outlook.com [52.101.95.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4B21A239A;
	Thu, 29 Jan 2026 14:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769696518; cv=fail; b=k7wEKaLQEfrF054isaowW3YwKjJzOfDChUOsWHwZlunxz6lXOrSpLPvpnVlFlhXTq7TumcEi2jFRLzzLOY9MueNbzXPTOCB8pGXrVj2V/WDx18sDhLJIhCwn5wEtLXGe9ZtEmV8T27JnhIMeC1K7rS2gJo12iPjazoWEMPLKTH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769696518; c=relaxed/simple;
	bh=N0k1cHjj/KcRxsbxSDmkVU6ZHQLHjcUxZLwOYJ3n8KM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Swiz6lMHLqhRREp2tiy+zUQVOiDGxuCbphTFnmUh3CchfIF8QQNk+TGbhk7Uyf9lub6wUFSly3Sw825BG9S8B4aEkhMD2rw15Kk2D2trXCCK6A6j1aQxrFa+qPub599qU8iqgs5hZVbHD64wuxOfi7kOVWeUT6QumSJJ1LkI+Qc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=IEbGYAvI; arc=fail smtp.client-ip=52.101.95.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="IEbGYAvI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWdWmvJfPqA4gqqboJqJy7hggdMG5QrRSfr6DyhrjanxVXjHp0H2imPouCW0gsTPltGJPQg5+URQ6xvY6FAQvfD4+eZaCQlFa1JyEQyZdf5p8yFJUEckwRkvgQfk+jtfQ1ZhEbESAW7LvDr9DmCjjgFmeEetqiECK7e0c5npyY4ZqpoVvY+IF5irSozodDvkxTfTpl880RF9Y45VjssdBa3O1V/T8XoREygHgBVxJmuK4KhoUTkhBnG2oWQkl4auJxyxPINyCnNhaFcEIT5goNcdOj4geV5Ktgb6Fp1XX+pwuIQfIXYxUzud+vcB2Ng8ubR1Od9N3c2yo7/iEMRN3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJiYHGjMWEIcsGERqnDwvFA6uKXhVkWQhjEPyxZMOeI=;
 b=GJPy9MPjmzR9fphGt0oc4+rxtcyNQfeJhqjGwJhjcVqYT939U/SqqXYz9xyqBNdyb4pdal/+120CVHfGPKpcTu7i4HlEztu8n9Bk6rg56xtPUt2Lbb/B1QThn3d4m4k+0tmH3R7eXnfbHCOUY4VNJGEPB09ywVuTNErcFZERZnlJ1B1qyCg5I9u3ZsFjByZO+YwGhNyb3tMRkV6TrpkQWnBpBHe8vQRTChJWskg5CNVfB1mrpgk9GF8zHexnr6c8y0wlkZGt6HHzuPG0tkkm9Ks+MPEwLqSHLn3rmrOUMahpGZqXFHSaMwi+6geji46dbBK3ZSGa95mbnScOTueykg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJiYHGjMWEIcsGERqnDwvFA6uKXhVkWQhjEPyxZMOeI=;
 b=IEbGYAvIoZ5bouzT8FdbP0dDzARnYgcVuZEZ63MdeeFd1N+OsG0rAyWyJ9EXHhcjE1V84EI3VSxlWpToVrG/95n3u1Xx0eTRrPMEQk/xvLSZs14yMIsRs3e+fw1ZKOqaYe0nTeggne7HVJMC4z3ZdlFTpDFiqI7mFiM/WGJQCrM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB7153.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:32e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 14:21:53 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 14:21:53 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 14:21:53 +0000
Message-Id: <DG1522O8EVWU.1J7Y5529FM1RS@garyguo.net>
Cc: <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/5] gpu: nova-core: gsp: fix command queue ring
 buffer bugs
From: "Gary Guo" <gary@garyguo.net>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Alistair Popple" <apopple@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260129-nova-core-cmdq1-v3-0-2ede85493a27@nvidia.com>
In-Reply-To: <20260129-nova-core-cmdq1-v3-0-2ede85493a27@nvidia.com>
X-ClientProxiedBy: LO4P123CA0259.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: 176f5e54-84bb-492f-7e01-08de5f41c01a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TTR5dGVHbjhsQ3JGR2RDREhYempCOHN2UWlpajQ2OVpPWU1NSjBDYVh4VUFD?=
 =?utf-8?B?R3E4QXkrQzV5S21lcGhwekhnMzJzQlZKYWNtNVNYMFJ0VGxnbXBHRUtQOEVX?=
 =?utf-8?B?eVFUYTF3TmVWc1o2Yzc2YTV1S1BmaXpzRUdmNWh6ejBFbGxBK3FFQlgwcTFp?=
 =?utf-8?B?N01PREpEdisyby9USHNxcENCZ25TcjRtUDdCZG5ybm10akVyMTkrR1BGeFNP?=
 =?utf-8?B?VU9IWHBtUHZsYyt1MWpESEhpYmx0QkhuZkdkODg3S0hzQVN2UEtsSStxV3Zm?=
 =?utf-8?B?YjJnUGozSThPK01EeFpNMnprQTM0SzF5WlkyaDFzSU1ybHFTQWIyQWNIOUk1?=
 =?utf-8?B?Rno3aXQ5Wk0zdjhGNG80RHl6T2hHTGFxYmZxMkJLOCtqa0cxVTFZbW1VTGdO?=
 =?utf-8?B?QkRndUJ6a0YvVW80cE1kSXNESEtoN1ZEbVh5V0VCTFNFTVVVNU42ZlN6NWR1?=
 =?utf-8?B?NUpsWERQMkt4UlRkYlJVSEJaNDNmUkZyRW5vUldJd1BvQm0zNVR0VXRMQ2ZX?=
 =?utf-8?B?SERqMWdlZFVaejBaQ0paVUhla292VVRiY1hVNGRwbDJ4alJwTThObERVTEVU?=
 =?utf-8?B?NHQxVWRYTFpHRGFVOTM0aFFqWWFVZG9zNnhvY1EvNnVTb2dsWFNPai9YNUJK?=
 =?utf-8?B?RCt1NDJZbDhsVTVEOFUzbHFpbThvTmtXdjBlaE54dTIwYThtMmVnL1RKSUpN?=
 =?utf-8?B?V3JWVG9EM1ozVHhCSnUrVEtrS2kwaWMrSFE3MmNKWW1hQ09sNllRZ0ZUckVW?=
 =?utf-8?B?UHB2b1NReTVCeVF5NUNIV2szT2FHRFI1MzhjbllxMVcvdFNoT0ZWVUFJcVZN?=
 =?utf-8?B?UGRja0I4N3ZreHl4WXVFalNOZE5xVXJRVDVLd2hTTVlkcUx1NmJrWHBGYkJx?=
 =?utf-8?B?VmpnNzhPN0V5M05IaStBN1EvdzZBTHZiUTJXTG93MWREbk9TRHJ6dXVIalRa?=
 =?utf-8?B?dS9DcW9TZ1ZxbTJweG8zaUYvUldkVWtRTzZydGhqT215ODVNZGpIT3V4Yk8v?=
 =?utf-8?B?VXJPdDY2YUluY1R3UGtFVFpxS1lvVUVXRU1nMEZPazJEd3FCSm91ZEMxM1Rz?=
 =?utf-8?B?SzZOa25peHBEbVdIRDJLNCtkR2pFNmNDL014VEVNS3RXd3BHblRvQ2FPSDNU?=
 =?utf-8?B?bWI5OFhkMzdPQjBPZlVOL3RuY09BVlFNenZqc0VKb2xkcVV3ZDU3OTdUak10?=
 =?utf-8?B?RHJUZVN6aGR6ckt4RG9KYzd4NkgyNjRGZXhEdVhkM3RFNm1udFVsemtwajF5?=
 =?utf-8?B?b3R0bXEvcFlpQnpmeEoyb3VtTyswNXgwVDVla2dVbUwzWGFrVllySXU3Rk5t?=
 =?utf-8?B?L2VJVy8rUGhyUFlPdlFQamxmbkNENjVkdzBNU1NBTVUzT1IvVlhRQVVyTDA3?=
 =?utf-8?B?T2wzelV4aW5Td1ZRaVRPU0FoSHhSaWtpVWJGc1g0VzFTWTBUOHZLZXFTTmFa?=
 =?utf-8?B?aDZBNjh5T1hoWk1FeDdWYTR2RzBBbTUvcE9FWFlPaXBZLytJY1hEOWpYZENV?=
 =?utf-8?B?bkNEOVg3cTZNTk1KakcxMEhXSlN6NGMvN0dPWEdiak1FS0RSazI0V05FWmVv?=
 =?utf-8?B?bTc1cEFYc2NoaXhFSVFGSW9uOXArb2p5aXRhWFJscE55dkgvOFduSnE0MURw?=
 =?utf-8?B?ZWN6TDVZK2Q3WEJ5QVM2R0crbHlkcm9YZGZlZmFMWXpuVjBuL1FYTGhwbU93?=
 =?utf-8?B?bHhYSERTejdERW1kVktVUTFTZnc2Vk5mVzJlMlBYWHo4dXp3UzNKUnkrbW03?=
 =?utf-8?B?VTVHaG81LytaWDdrdEp4cnhDdVBrRlJ5MVRzVDNSOFc4bnNBVm1BMVVvNDFW?=
 =?utf-8?B?WnNYTllETHdRTXZqUkFnWlZOd0VRczJ6NWxxRlFhSU5uYW1wMjNielNhT3dk?=
 =?utf-8?B?THNtQkRQc0loaUN0Z0Y2L2luMXFqdnc1UVl6eFoyeU1MVjZiSjRQdXJMR3BF?=
 =?utf-8?B?aE42OVh4MXFSMWNER0RWQ3RMQ2VKZjVlRktWckpFaU9kZlorcVdXZGwyMzM0?=
 =?utf-8?B?UldZTGVLUGpBSHdjVC9idTk5L3hOZmp2bWxoSE45bGxaaXdnN3E0eGVFaUEx?=
 =?utf-8?B?TWF5WE1vYkRzWFJ2R1ZOVWxRaVh6aFZZc2F3UnArQkdqVFBEUEN5a2dyRmE1?=
 =?utf-8?Q?IR5w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkwvQUQzVlIxbkVxUW4xWmMwekFwdE5ubk9LdlBGWFJ2aUx3Rm40MGVQS2VM?=
 =?utf-8?B?SDBRdkxvK0s0TzVlY1I3dVA0eCtNQWg4cTE2NWNOK3owcE1wWkhRR0kvZUdk?=
 =?utf-8?B?TitqUmJWTm5HQnMwLzR1MURFUHliNzROL2MvbThEeGFhYmcrMVlmb3l0VlhM?=
 =?utf-8?B?bVBLeDZpUVpoSEZCcXhwR09JdDV1bFVDN3J0ZC8xYUlXVWxOclpEVW1QRmta?=
 =?utf-8?B?ZklRbFhZMXRVSnBpaFFsRTZYWXlEazlGQVovZE01a1FZcUlVaFFHLzlMMGZR?=
 =?utf-8?B?VThHOGlYaU9rdmNXdzFKRWxVMktxNVJQMXdIdTIvckp1RkRYa0hyd3UrUXdj?=
 =?utf-8?B?QU5wK0hBTUhrYklYQkZ0bDk4cjg0M1hPeDNMT0JMbmljVnZ1cUlyb0tDc0F5?=
 =?utf-8?B?VmE3ZXdoT1ZqYXA2VzIwNjFhWStvd3AvcnBhd3hMdVVSYk9sMnVGRndJWmY5?=
 =?utf-8?B?dzRiRUlwQitUeWFWd2JWUFMxWEh1NDMwVHpwa0E3TUZvSVJ3eTNKVCtLVXpX?=
 =?utf-8?B?Z1Jid0pXT0FKbGpxNzNQeEwzbEJCOHprU3hWZ3dkTkxmbkhKZEJTcFJjbGcx?=
 =?utf-8?B?VmVXbTQwaW02WFdqaEV2bWVTRmE0MEVCRnV2TmgySkI4RGxUZXRCek5uYUIw?=
 =?utf-8?B?WlltWHB3V3RCQng0dUR6aHRVQTZLSDBNc2FKTXFQOVBmQmQzbFR1S0ZRZHNG?=
 =?utf-8?B?YXR6cEZWVmJNKzE0eUJwV0tqd1lUZUNsVEorWTU5c2hhZXhDQTAvdjFpK0Q5?=
 =?utf-8?B?bCtjc3NCMzRBdDduSzlCd0k4YjRudnZVREIrTFVBbnQyUmtiUnU0b2RIWmVl?=
 =?utf-8?B?TFF5ZVZ5OWZXRUp1VXM5anlMVXEyYlpxZzhTQkFWaWNOTjlnbXRORFcvSThM?=
 =?utf-8?B?WkJyMG9TT3NyUktOc25LSnprZ3U3THNPMTlTdFQ5Z1RQQmM3QlRVa1VrL3Ir?=
 =?utf-8?B?MEIyUW8rKzI5YjQxOHFFTEU5OTBCblJ6Q3d1VkZYSkRYQzAwMTBNalZNeWVB?=
 =?utf-8?B?THpVYWxTU1cxYzArQ1FTYTRMRXlOWk95M0s5ZE1mSkloMlJLR3JKayswMVFF?=
 =?utf-8?B?aXVOaVowU3EyeCtSS0xiSzlQN1pWZlE3YkJrQTNTYzZiNnZ6U0FiaGJZN2Zt?=
 =?utf-8?B?a3I0QzY1bHJuZ2hGanM0dmxEdndwVlIzcFJoYUNGZHRaUENKdVBlTmUybyt0?=
 =?utf-8?B?M2w4NGF2MVZWd1pCV3RhYTc3STB4eHRham1LUEE0YTQ5VjRQQ2xQczlXTkY0?=
 =?utf-8?B?eU52SlRiYzFmVVlYM1hYSTB6UGVFTTBxUkU4WjVuZFBsYXFpa2RiWmgwWitQ?=
 =?utf-8?B?cnRCYXg5YU1iUUFvWFMwSGtiL1lPVjRFRUdmcm1FY2pJT1FRV3R6RVdkaHlB?=
 =?utf-8?B?bVI1c2JGczZsR2tLZ0hSYnhDM2dBQ3ZnTmNOZDZQdlorbllxbUdWQ2luby9W?=
 =?utf-8?B?MlYzS2czWDVEamdLZnhmNGVXQjdDck5ac3NJc2lqeGtZaitOREhUem1penJP?=
 =?utf-8?B?Vk9rc3dEbzNWY2pPeGQxUzhvRXZHcG9QZ2ZxNFYyNTFQN2Z1cEJYT00rY3RB?=
 =?utf-8?B?T2l0SE91eU5SNU5DeGxWaGc3UjFmMmZPUmRLK3I2TURBTytZMVgvelpZaEpD?=
 =?utf-8?B?MTA4UFNVem9pNVoxeVBYQkt6YkE1UG56eVRSSXFMdnZhT0FqdXYyeCtrdGlH?=
 =?utf-8?B?MTJOZi9LYVJ5UDR2cGJLdnVTdnBLRUQ0bGhJSjdlY1pSaTJnNk5iZVN6Mkwy?=
 =?utf-8?B?dnJHNnBJdmdVU3lSTXRYQXR0R0NBaVR6cm5vNnZHNkVSeUthQ2xJaWdPWHRG?=
 =?utf-8?B?WVlLQU5XYXAxOWVoU0VtZktIVENzWEdWWEdmNkNSejBBODVxQmQvUVZjd2hn?=
 =?utf-8?B?OUZmMDNLRW9sVTQwTGp6ME5nNDFrMDlhUTVEbms3T2VHTGh3QW5mTi9pUjh4?=
 =?utf-8?B?bWlXOVN4NHdhNHgydFE1clpjSlBpdE15bDExL1RyamhPa2dvSEZRL1U5T1Bh?=
 =?utf-8?B?cWFrbzR5TlZSOWZNaXpIVVp3ODE3TEtZaTk0SndYL01HWjZaTVVDY3M2SFdX?=
 =?utf-8?B?RE9QZGVvaE1xWGdWZy80WStyMGt1RGFvV3JIbXVybkFPVlEvdEdweHN4Y1Q1?=
 =?utf-8?B?RUhGREpSN0RmZE5RSCtrdm5tazd6Y2crZmRuSXVTY3dOazNrMHlEc0xuMDlB?=
 =?utf-8?B?RnhScVF3cU0vcDhkNGJ3THkxNVVIWFJ1SWhBRm9JN0tPTjN4QnV5ZXlxbkti?=
 =?utf-8?B?emhnZXk5U25xazgrOGIvczFiMTBRaUZGeW0vY1BKMXNidDdxL0hDZDJxdWt0?=
 =?utf-8?B?L2dBZ1VkNm8rZ1RHQlFQeDhHdzJ6TEVLRlhKVEtxUk9oZXdpdVhrUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 176f5e54-84bb-492f-7e01-08de5f41c01a
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 14:21:53.4592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QOzvwDMa9U/vbscunXnszIOHb7KfqBtM4vBVCOtD1ACPtps84Y/ySOUTZtX5nZNW8ozAM83exLguvOKhxNg++A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB7153

On Thu Jan 29, 2026 at 7:44 AM GMT, Eliot Courtney wrote:
> This series fixes a few bugs in the GSP command queue ring buffer
> implementation in nova-core and also clarifies some of the comments.
>
> The ring buffer uses read and write pointers (rx/tx) to track which areas
> are available for the CPU vs the GSP to read/write into.
>
> In the ring buffers there were some indexing issues which could end up
> causing panics, so I fixed those and added more rigorous proofs of
> correctness in the panic comments.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

For the whole series:

Reviewed-by: Gary Guo <gary@garyguo.net>

Best,
Gary

> ---
> Changes in v3:
> - Use `&mut []` instead of `&mut xyz[0..0]` for empty slices.
> - Simplify driver_read_area by removing unnecessary split_at.
> - Use range notation for comments (e.g., `is within 0..MSGQ_NUM_PAGES`).
> - Fix up branch order to mirror existing code.
> - Link to v2: https://lore.kernel.org/r/20260123-nova-core-cmdq1-v2-0-e79=
7ec1b714c@nvidia.com
>
> Changes in v2:
> - Modified PANIC comments to match existing style.
> - Link to v1: https://lore.kernel.org/r/20260122-nova-core-cmdq1-v1-0-7f8=
fe4683f11@nvidia.com
>
> ---
> Eliot Courtney (5):
>       gpu: nova-core: gsp: fix incorrect advancing of write pointer
>       gpu: nova-core: gsp: clarify comments about invariants and pointer =
roles
>       gpu: nova-core: gsp: use empty slices instead of [0..0] ranges
>       gpu: nova-core: gsp: fix improper handling of empty slot in cmdq
>       gpu: nova-core: gsp: fix improper indexing in driver_read_area
>
>  drivers/gpu/nova-core/gsp/cmdq.rs | 71 +++++++++++++++++++++++----------=
------
>  1 file changed, 42 insertions(+), 29 deletions(-)
> ---
> base-commit: 58d26d42818c0f8c9b334cc7cf318b43046e675f
> change-id: 20260121-nova-core-cmdq1-6aaa369824c4
>
> Best regards,

