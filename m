Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020114.outbound.protection.outlook.com [52.101.196.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851C33CD8BB;
	Sun,  9 Aug 2026 12:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786277775; cv=fail; b=j+n+39DOm4KOL7d3yWgRRUArflMiEzOCb9h0ZRRLVBdPbZHmMXb+uCPd59ugYs69JvqxEJYxmuuHZkUxEtrjDcNpReQJ2ZTeVlbou1cIjtiiIB/4o0ppJrkbtHWBqDiSNnVohAn+cQP1DYocfii4+Of73LwqUz3V72LDoF6/fcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786277775; c=relaxed/simple;
	bh=N7uhj/LFOHKusFkJ3/oVOODSkj8F5LfMCRgnh9wVsMU=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=Y6W26vyoZ99iVkSIAKqr3fG/HX2J/0c/v9hzaXTf+UJ5jH4E+8PX2DtKnJfJhpTQMQQC9kymrt5yeXCWWJYGuOrFL5HXzvYOChMAIzAlZXtFr/fb58mt00nWCvDkWIzuELx+iFUxMrLTnnHB4LSSaGjFKIJpSJv08MHpWzjVqQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=uzkWG9P3; arc=fail smtp.client-ip=52.101.196.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="uzkWG9P3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p815g+gDi2j20u3aJU0zw6MocUwRfe/HMEkFCDeYDttV+oM+VK0fZpc2XbWWlOghTWFewxnbkdzRYC/U+nEoKSDdfC1qrzVB0+wGFd/Z/MOScC7QVlYfrcMdZYUU5IqYVNyIQvonSNw+eAbcXxV/zxRJkUhTv9NnLb40gtjPCcku1Zt7nHdRl+o6OIgd4zwjh2i7fHVRPQsOY5YG6p6tfUgsaHXZqYNTTQ4dYek2WiwO2ke0szPrxw2gOpwclsiFLNheT3wxQFWmHsgioPbvh7OOgup+I/Tkt78ps0FEpMAvuXFsGPmWSd+6HtUUNt2qgvWxTJ88DVplqr6lpbMGkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7uhj/LFOHKusFkJ3/oVOODSkj8F5LfMCRgnh9wVsMU=;
 b=jPbCqMdvAmbELWG1TBcAPUutyc0ECeY5etOvqDxeDLsun2Y+jsoI+HqFYlnxz2UwGVM7ajbSVF6i+iXVq509xKvXCV1FGlPDvlfD4lr3BgoTZmotvdwDlKBQSlJPkC3AJHPdvNFKjLXik9bjNHpehZzbsQ3O5mbhquJ/pLH03MH/r90PNqvEVxYpC22EEy4Gp4iYG3LzgYqrQoT8r7ekQb3MEfY8arrpAWumyfIrImvEce2nFRnob+CgjXB+tCQsjRwuZwxQ7e6R4Z8LltVcYwjPub8VZiz4wyhI9LtH2nHJEFJUIKe44CUU5GlSanRuzZ2HAqlihkWZHqoo5CtxnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7uhj/LFOHKusFkJ3/oVOODSkj8F5LfMCRgnh9wVsMU=;
 b=uzkWG9P3KCkj5wAX5o5hA5EVKfTyQeWM7WmUQoKMhn+vSLZ283eXv/dYn8/JqgrxHIcj6fMBeUOeBD9dFFSkBwk0F5C3sZVTSp3YvvdN2L1ENPPwuy73rKC9TN2lBg8bwMEERM63HJ5JHUhzZDm8N1ch/LECmaFem35YXIOzShE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CW1P265MB7928.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:212::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 12:16:09 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0292.024; Sun, 9 Aug 2026
 12:16:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 09 Aug 2026 13:16:09 +0100
Message-Id: <DKKEMEKDOIM7.1B1R7QP42HR9J@garyguo.net>
Subject: Re: [GIT PULL] pin-init changes for v7.3-rc1
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Gary Guo"
 <gary@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, <gary@kernel.org>, "Mark Brown"
 <broonie@kernel.org>, <linux-next@vger.kernel.org>,
 <a.hindborg@kernel.org>, <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <bjorn3_gh@protonmail.com>, <boqun@kernel.org>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <lossin@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <tamird@kernel.org>, <tmgross@umich.edu>,
 <work@onurozkan.dev>
X-Mailer: aerc 0.21.0
References: <20260805190012.2934907-1-gary@kernel.org>
 <20260806170101.67544-1-ojeda@kernel.org>
 <DKI2GNME8JEU.27LL7M7GZHZKQ@garyguo.net>
 <CANiq72k=xyeftXo7VLvxPQkaOQdXZP69rK4_GhcEc6khuaJqHQ@mail.gmail.com>
In-Reply-To: <CANiq72k=xyeftXo7VLvxPQkaOQdXZP69rK4_GhcEc6khuaJqHQ@mail.gmail.com>
X-ClientProxiedBy: LO6P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::10) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CW1P265MB7928:EE_
X-MS-Office365-Filtering-Correlation-Id: ff33a8db-b7ab-45ad-dd45-08def60ffefc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014|23010399003|10067099003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WjMdqU0Uow4IQR2lZ7LEh+7uCD09avcc7mV5nPZ0JT72iTXj2qHnb+zOiKFOTrK6o2VBYFA2Pfr5a+0PsSZLUDSDEAmDm4+wTes8wfKLVBbDoPJxabM8JI6ugkld/sSd2XnNWQ27AU3o6OuJDfCRLmpK8AujXfN6ZE2GQAkF1eRmGPuj+YhNRLR5CJHqZus4oGKZIZe8NsZdlRGEbTLRiPLfYYZ/UTPgufSxVKdZe9gc6Zh+YjSCaxFSdWTNIGxM+mmuN+SRtoY1SeEZHah2MxBkBjSls3YhgipmGg28myFbD3XBu5mWHdtkPBJNa1eJraOcB4YBPkUn1L4S00+fBLXV+BdFTSlAw8k35+Y09lROc1wNCVjL+SpvZWG83lnQMANxhiyrIZstSrrbYR0mcxnMb4WAVd2QpNU40MTNcbcZv+cdpa/HODCKe9FptoGmqT60dFd5ID9TorKs/j9aHAB/Xx6QKofrIIkoZ3CMuIVZtu6Bo2pH2kTsi3dgU4i7HoGPF84n9mewScBp6gz91lkElyF4Y1gAL0q15DniN97PYq1s4g4daKCd+5V+GycEs9IcXh3hscXm0QNwuQCiWw4wjZUX5bexHA5vbTeHZAz46VJ0hlC1e/lIE6ME31AW2L4EgynZ8xSKvR0vI/mkoUH6JU9WvL3j2rpuk7KHQwk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(23010399003)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWhsQ0dDK09JZ0phS3JuNUMwVkcvbFJwNERreitBdGpXMWZYUnE1S01rcStX?=
 =?utf-8?B?M2Q0a2h4WmU0MGlyNjFudmIra0Z5V2VIZTVtVUhMcjlvTHd5LzU1MXNkbitt?=
 =?utf-8?B?YmdrZVZYYjhVcmFRN0hucnprczY0L2tvc1UyTkVObGVrTUovYnh0RmovVFc1?=
 =?utf-8?B?MThKZlF1bWx4eHRoNjc4Y1phZiswaEhkWVRiekxndE13L3psempFMk1UNWdl?=
 =?utf-8?B?cGc2b0luOTFUTW9ka3RDL3BkSHY1MytLeGE5S1hxdTBrMzZzeSs5ckhMMXl3?=
 =?utf-8?B?STlRMUdKeHZHMFNiWVVXQjFTQ251YVh1RFhmSjBTYWprWTQzQXc3czNvdWF0?=
 =?utf-8?B?V3lzcldvemxFOG9MdXZQWDg3WWUycGlVVlplemhSWnV5S1I4TkkvUlBzZDBZ?=
 =?utf-8?B?cnFNTDU1elUrdFgvY3duVG9KR0d2SEswU0psaGFjUU90djdLaklDMWtxU1ZD?=
 =?utf-8?B?N3F6eDkxYVBKeHhweTJLNUFUSTZrN0ZLbFp1UEZ1WEFkUXNESEZyUWZ6RjhQ?=
 =?utf-8?B?YTVJbjgrTW4rTFlRU1JjVVpma0t4WW9sTW5XK3FYdDhKWmRkcWdxK01hVmZl?=
 =?utf-8?B?Z2RKL1poQU9qbVUzemtpQUxIN1Q3MEVxK2RpcEJlVGQ2cldXWTdHSTRFazF3?=
 =?utf-8?B?YjhtUktNYmNHMGlpOVBWZkNBSXpHMkRGdmhOWlVOQWlOMzVSMDZwbUZ6elFv?=
 =?utf-8?B?azVOc2lKMWI2a1NQQklyNWYrYldqZmUzOFFZY2pDMXVSQUVqS3VZcjZsalo3?=
 =?utf-8?B?NTRZcEZPS2pqWk5jUVE0enU1L29jeDl5Sm16VllKRUJuTG8ySTduUGxHcjAz?=
 =?utf-8?B?a3YyallGYnRqWUlndzVWV3NCTldCUjdyMHZwd0JwUll2bEo5N3BZOUk4V3ZM?=
 =?utf-8?B?REtVVm84TUVwakJ6R0QrdWZoMTdLbnU3Qm1pRE1HWS9vRHQzendzNkQ2WEtZ?=
 =?utf-8?B?ZkNuMXNaaW9XeDl5UURjOGdyVk1Ga1c0d3p2ajRPK3kxWDJhSnFsQnE5Nk1x?=
 =?utf-8?B?YjRPYlNqK2ViNXJEbXRUTC9lWmpOTkR5Q0xOdlYzQXZnQlVVdXZ0SEhTK2Jp?=
 =?utf-8?B?czBaTTFITWMrWnU1bHVCL2ltYTgyZUQ3TXJTMlVRYlRzK1lVQklQMmxnL2xW?=
 =?utf-8?B?eW9lM1ZHTDFHOHQ4dkpteis4a3R2aWcyWXlKSnJUTGJQcWIvN1YraGVlZVdu?=
 =?utf-8?B?b2M2MGNQZjU4V29vLzNhZi9hcXA2d0kwbnl0K2xaVE5VWktySEl6ejZNUWov?=
 =?utf-8?B?TTVtZ0FjdUE1THZLZUhTaUhab09uRnk0RmJpRVJ2eVFzU2tLR3d3RndmWTdM?=
 =?utf-8?B?L0czS1A2T3RtSWZUYmJhRVRhaktMVmtiMnJtQjEycDlibURveWRZdGRJZ2Y2?=
 =?utf-8?B?WUpXQTBSbHlxcEpOQjNQOG1CM0h0TjFvNmJBN2gwa3dpazNwclZDNGJ0T090?=
 =?utf-8?B?d1p0d2JpdERnNXFJUTNOS0VySVNzbTdCdlJlRjlIZ1dpc1YreTBQNFNFem1T?=
 =?utf-8?B?L3NlYk1BTHlvcWRvODl1TmFodlUydlhraGI1YVdYY2NtQzZmTG5GUWFiWFl0?=
 =?utf-8?B?S0dQMHRjUExjVkt2WEJhSXdWR25wZW1pWkU0RWk3QWNrTzBqSk5WdGpZZG1a?=
 =?utf-8?B?cjVTdlN4cGR6SzhwNUtrS0hYRkdmb1VMMVl5M2Jwb2IvYlU1WnlaSUEvS3dS?=
 =?utf-8?B?bzNYMnZjZjYzdjZjQ3pBcngxMkJiUkFiKzRWWlZuN1RscHp0QlBNMW9uOStR?=
 =?utf-8?B?WEJiY3p5WUVKRXdLT3ZUVHJtc2FDcE5xanp4ZDE4ZG4xTGpraXlLUXNrdFV3?=
 =?utf-8?B?bVR1akM0U3A4akZBeXJERExLL0tYMFVvdFdRUHM2VFJsVEdOcG5pdDF5dzdT?=
 =?utf-8?B?TkJVakFUV09XemFNMm5iYkRyelRuUmVjK0cyb2FSTGo4NFBPZnM2SlBzOEtU?=
 =?utf-8?B?dWowTWdMeEFua21PRGhTbFNKNzhWK3FheFliNXlkTzFGT2RmMmcwRGsybVA5?=
 =?utf-8?B?dTNJNGkzZDZYYXNUWFJ5YWoxNDdiR1V3cXc2eDgxVmwxNmxSeGI5TU1IOWpH?=
 =?utf-8?B?NzV1cWhYQmg1YVFza2puN0dWaDJ6T3JpZ0I3MkkzV0tKUWVCMEwzYWRWMFBs?=
 =?utf-8?B?Q1RZa1gzaVFlcUxLbXFlRjNQMURNSWczbEZTc1dPMlFPM2ZCQXNYSWtvREtr?=
 =?utf-8?B?cFhJY1A5V3V1M3BTb0QrNzJyRUdURTlLTVNjYkVEdk5qMnBtRm5YMUpySHZv?=
 =?utf-8?B?QTFqaGliVEpxWS9VbUI3d2tMbTdNVGVaSURqYVZyWWFPQjc4bERTVmFObDE1?=
 =?utf-8?B?Mng3Y2pObENPZHRjVzc2Z2VjL21tZEFFNEJ6cnhUNms4RExJbS83QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ff33a8db-b7ab-45ad-dd45-08def60ffefc
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 12:16:09.6980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1QTem90XcRpAXTojkKqEG02oSNvB0jFcFR9MibuV6rgB4HBkeMN+CRwppDGQLfFwMeuxi2wmPKvtzYSYVW7trA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7928

On Sun Aug 9, 2026 at 12:52 PM BST, Miguel Ojeda wrote:
> On Fri, Aug 7, 2026 at 12:45=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote=
:
>>
>> Thanks Miguel, the semantic conflict resolution looks correct to me.
>
> Thanks for checking -- by the way, I think you forgot to push the tag?

Oops, indeed! That's embarrassing. I've pushed it now (it was the same comm=
it as
the current tip of pin-init-next, 1e26aea0355ad2afa1ccbc62885c01f5bcfc58ca)=
.

Best,
Gary
