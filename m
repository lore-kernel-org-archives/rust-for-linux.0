Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013052.outbound.protection.outlook.com [40.107.201.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B471E394480;
	Wed,  4 Feb 2026 21:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770239343; cv=fail; b=Nvbg1aSCnBlTAorblztJHims8g5wymd5CaUi2VWcidExmpsBua/LIVtPhvOEJKacMpCjMkkx7Kw5aZwI6NUFEyQHWKlrt1XjT0lr0nQOohkhlwvgt+VVmK8j9htaIjITYJ8OVnwU/ShQB+6uU9BkafwvTFQYFeJOihqxls9dcTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770239343; c=relaxed/simple;
	bh=6iNXzY34BKTmIgsOMU/F63iy3bxJTiH4FD2H5q2emNA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QH3X0jAVuduj7N3CFvtgotd5pZI59YcUak7OMVqA/5U+mBq8HEMf1FedVOeADC31f/adXTMe9zznU1NwfVD7C6AhdzVb48d0Bi2dFD2XZblXSBv5RImaoc9qKSty7RGSz9qDhjruuxB1sTQQIEUh+jWCAhHeTYyyFk+eB6auXqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pIq83CJ6; arc=fail smtp.client-ip=40.107.201.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pIq83CJ6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQ3eBsz7nJC6G9YoImJ94K7FszXmW/s7TfbEAhPKO9L8ABFJtGDoBN+DuJnmhn4qQv1uDed1ausYNWPdv+NJzqUuVK3fgKN4PBLD367Sb5p/nFysu18HHepMbgFC7USDl6xGMgCUpvCqTCb1lESWDHpBHLVXQRdXxrdclkp1UL7G6ludarmCAlxuGMGSX6Q8QZVPedgUNOvhfGdGmBMKyhdlb3bxsEWZO7zbJjAGvSRx+P1voBZZZoBsWpIRUAQy/BhJW8WyPDu2gx1lX9MFk8LQuk5coetfGLRYrUUo6J951ybrfDfuA7Wh32lnyyLXPIL9h74lilxNtwJ0TxVEyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6iNXzY34BKTmIgsOMU/F63iy3bxJTiH4FD2H5q2emNA=;
 b=i3h4fOr5qsU+yegWWQmg/EZuFYCYfXZvIgXpDu2pgOpcJAkbiX1oCLyOaLcrL02jwJafzZleJ8SsNlAaTYinXGLfCtOt3ghx1Q8DI6zcG1IV8/0Tus/xZ2X4DbieYvvqI/Wip54EsWF7Y3ka4nFnxhOa4vTSj9mfD7JRwHImcpPx/HnSm++68dd/RJK56VMBGofRiz7rWEyIwlZP//yqqZZo2YjIEr6Jb5xn4I97ZdcfKQirAEiQtWCxeRh0u0RLFl24P4kKac44ULvbPdwG5kBI4rGNPoNryzwDOBa+F8F1G+RGk6MhvXR7QKTmoORgVRZ/9EMEDugVlOLN7GPsZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6iNXzY34BKTmIgsOMU/F63iy3bxJTiH4FD2H5q2emNA=;
 b=pIq83CJ6yctap7K1GqslwH6d3pmaHMUWneDaZ/RaLx7N1WnzbyS+QDsOPWxe1/eEaKDlsO/wirbz1ixRRDvf/SduV41qAXwn8FAuW26IF/yvFdMoCMh1F9W8H7kBfV5uIdnPXlzLEqhPHAhlgCKUId7WJyc7qhuvI5y4hFVK4nT9fkzSAo7eLNratxuV8TXjdoHQJNFPpWTGErtBM1uMXGAW3Me3/zw1ONTzN+mvNmcAbNPrUOCCOEoRQnej2i0m8bLMt2T/ik9CpcsVyJyLIKHjVQvrY+Iw+jrBhLX24BZx2LjsBCxwdLHTJ2HytRmL9/xqdCSv1GgunktEDAgJmw==
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SJ2PR12MB8062.namprd12.prod.outlook.com (2603:10b6:a03:4c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 21:08:52 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 21:08:52 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Dabbelt Palmer <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Miguel Ojeda
	<ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, =?utf-8?B?QmrDtnJuIFJveSBCYXJvbg==?=
	<bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>, Zhi Wang
	<zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas
	<bhelgaas@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Dirk Behme
	<dirk.behme@gmail.com>, "nouveau@lists.freedesktop.org"
	<nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 1/5] gpu: nova-core: use checked arithmetic in FWSEC
 firmware parsing
Thread-Topic: [PATCH v2 1/5] gpu: nova-core: use checked arithmetic in FWSEC
 firmware parsing
Thread-Index:
 AQHcjwGXVkRTHzW2UUWwhJzkgIcyjbVnar8AgABI+YCAAJhcAIAACr0AgAlC/4CAAVd8AIAAJZ7M
Date: Wed, 4 Feb 2026 21:08:52 +0000
Message-ID: <B65E1B54-C5FB-4076-8DD7-8202F69471C1@nvidia.com>
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
 <20260126202305.2526618-2-joelagnelf@nvidia.com>
 <DG0607SU943F.1FDOPYPN38FCS@kernel.org>
 <259bdacf-d16e-4fff-9f6b-f860feb40aa8@nvidia.com>
 <DG0N5PNS1ZQ0.13WMT4XYDXNUS@kernel.org>
 <8859d68f-ca38-469e-8345-84059573ac97@nvidia.com>
 <DG5OGLH0BHNE.2XSVBQHAAXHGI@nvidia.com>
 <CANiq72nhzix4Dr9_gbaFwZQQq=3cDY=oAYVgG5hDAmMgaYKQJg@mail.gmail.com>
In-Reply-To:
 <CANiq72nhzix4Dr9_gbaFwZQQq=3cDY=oAYVgG5hDAmMgaYKQJg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB6486:EE_|SJ2PR12MB8062:EE_
x-ms-office365-filtering-correlation-id: 9159c99c-2b85-4a32-c893-08de643199ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RmcvYjlVU25naUNrZGV3ZVpXYWZnMmQ0dlFidmx5MU5ZbXgzRGhFeW9vY0Vj?=
 =?utf-8?B?K1JQVnJLSjZPb1B2YmFnamN0T3ZLdWVzbGYxaUxGYmJ4LzRQMDFSQWhCRDQ3?=
 =?utf-8?B?UDlNVmYyWmhRNFRyTlNWNDhmVWJVSkh6MFNGU2xGeXB2eWh1R2ZiQmZvS3Q2?=
 =?utf-8?B?ZGtOZ0hYb1RSMVNlRWFHV2hnaUZNWWFqYmErU3JWdEhmVitkSFhkRjh0RWdr?=
 =?utf-8?B?bUh2MDF0a25oYjFWdkRvOHF4OUlVaFNRNTN1TzgybXgvZFJCenkzVTRyVlZy?=
 =?utf-8?B?YTBPUVF5b0pCcDRzeUFTVkxuUDFzN0dKbHcxaTBsNnNpNjlkNzg2QjhTcDNQ?=
 =?utf-8?B?NXc3ck5tN0NTY2dGQlZHSXRQTE1YcC9XZ0RYSFJSVkhZQlF4eEFxZWloQzMz?=
 =?utf-8?B?emhTaUJibnBxNy9Ba1RxMmRCSmtaKy9xMkVZSmFYa24zblVZNzE0cGN6SVNM?=
 =?utf-8?B?elloSGIxTEFHb0xKekFBbS8xVENXa0k0bVZsanpMakhaRTc2M0ZjUHE4Q3Rv?=
 =?utf-8?B?YUtlVmgwQm1SeWhlMWNReFZXdjg2KzRIQTBBUlRDeEFmTFpuT25wMThjU25F?=
 =?utf-8?B?WCtUeU1RMHF3a0NXZnAyeEYxZC93eURrNHdTeGl4OUUzdU9SSHFRL0FCYi91?=
 =?utf-8?B?b3RuMk9wSFFjTEp6TXFuZXYvazNDWEk1YmFwWHE2Z1lWOVBDZWJXU0Q4WUNJ?=
 =?utf-8?B?dm9tcjVybGNwSWlEUklzRm5BNGQwVUtjSElHUi9HdFJ2c0tETTBUb2ltbXlo?=
 =?utf-8?B?QkwrdzZRdERaV1gxb2swMXpoZU91VllMQVR0NUp6UTRyejg1cDQ1SFpjQlpn?=
 =?utf-8?B?MURZUlVoWGUvZ0VMaERmSEdsVmpjb0QyUndaZ0ZCblpFUHZpZDh5ZEJkRHJp?=
 =?utf-8?B?NTVRNmxpbjlaTnNtVVFkS3BDMFRNQUFUWXN4VWhsYXJVc0hWdkMvZnZMYnpB?=
 =?utf-8?B?RUwwS3h6cDArYmFwb3VoY2dTeG5kNjNjTVBhd01KWVhOTjF2TnYrazlxdHIz?=
 =?utf-8?B?N1RkdkVUQ3RhZ29HdVdpRnZVWHhIMWRNazNCTGJ0MUdWeHRzTzdqZkh1QzFu?=
 =?utf-8?B?UncyNWM0N0k2ZXRNRmhvcHNWQ29TajVmUGFDUjA5eVkzMTFnZjJPbjM4T2w5?=
 =?utf-8?B?VjhqSXBKcXFtQ1BqcGpraGNkN0U0cUJNWWhPdkNTaFlxZUExV2RlNXFJV0Rm?=
 =?utf-8?B?VXlmYVFIUU51TW1WWkNIYTd4ZEVCY2c2Yjlzc0NBeTYzcnphZEVDeHR5OGdN?=
 =?utf-8?B?QmNhVnpqTnhWYmk0Ym0vaDRYb05iaHQrcGF2MmxNTk03c2lLWUtOWTBrMW9O?=
 =?utf-8?B?Q0FZVFZoYVppN2ZLcUtjWlZseTdTT2xTTlJIMDJIQUJwam1vcVlKRVl3c2pn?=
 =?utf-8?B?emVWVlRoalJJVUZKOS80aGgzS3VZaGRLWHA1VUYzNzhpVzVFM0YrRXRsQkpS?=
 =?utf-8?B?c1Q0c3lGekd1NFhzR3Z0YXRpelBzbUZ3YVg0TmQzWlVpMnMvSEFKVSt5cmZ0?=
 =?utf-8?B?NkNKTGVPZHFFbGxOcUtFUnJxb3REZlRxeGh4QlYvU3oxNFZiekV0b05WN0R4?=
 =?utf-8?B?eFZQSGIxKzNrRkJNWGZjNFhGbWdnVCtud2UrUk45QkVDZjhSZXBSaExWMDFN?=
 =?utf-8?B?QjVvWWg0YlFhS0lSdGNCaUdieGljWWZIdkRVNFdoRjErVVlCRTA1eG8reHVq?=
 =?utf-8?B?VnJhS2hFQ3pIK1JRRUdZeDZrZTcwQ1ZaOUNaRmhOZW9mQ1dDRWJScS91Z1hT?=
 =?utf-8?B?Slc4TkNZZDNjcEIweUIrMlg1SERqalR3K1VhL1FlM21oS3RYd1ZhRmt0bFo0?=
 =?utf-8?B?VEJ3Um45S0FvR2pveitpOFowOHVkbVd1SXh6V2E3VGM1Mjc4TDhMZDJXanhI?=
 =?utf-8?B?VEd3SVJHVlE1SXB0SURWSFlPWHlFbFJwcVJkenB4cjlGam9HL0wxaDBFcC8y?=
 =?utf-8?B?Q0lvUk5zd2xYaG9PVnIyUWMyUzEyMkVnRlNERi9XTEQzb3AzWW1oMTIxUHZU?=
 =?utf-8?B?R2svemxXVmtNVGN5UTEwd1Jqb0c5OUFtdzd3aXRJU1lLalZleVRVRjRMNWF6?=
 =?utf-8?B?WEV4bUZBOGZ6Q2dQM09aK1Z3OXk2Zk5yZXVwUE5oWUxoZUVoL0QvcWFFalJj?=
 =?utf-8?B?L2RJYzdKdG84NWhobjdjNFVJSzczNnJGVisrbXNGUHQ5bWo1V1VYK0N1bUFo?=
 =?utf-8?Q?lYK98uScuCV4OhNjAvrT+hk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eno4RzJFNnZkS2tGR2cwTW9GTmVQTGlzQjNkYjJHWmg0akdXY01ZTGFzKzNS?=
 =?utf-8?B?M2xwcytPeW9KN0pVQThoVmhLM0NQc0c5NFljdFBMQ1crcUpTRTBnL0xURllC?=
 =?utf-8?B?K0VYaWNMTzk4bGRqUmhGaDFSMlhZZm10VllmeUNxQW02Z000TXgyQUdSK3lF?=
 =?utf-8?B?NitJbDYzbzE0WEhySzI2cWc4WHZSeGdtU1Z5OGppUDc5eGt2OXlUSTdQb0dS?=
 =?utf-8?B?bWdvZmxpSEMxdkRvUm1CamMzZzc2Skx4M3ZJU09XaTFuMkxLbVhkZis0eEE5?=
 =?utf-8?B?ZVczVWdPZHpVS2xoVkFhbWtGUG1Yd1NTREVtZmRndVZFMFNhemdKbVhNZ3Ix?=
 =?utf-8?B?aEIrWWtBNlNrQ0ZhY0xYNXVrbktpODMrZ0tmdVptMDFzWTRkS0czR3psQlVt?=
 =?utf-8?B?c2NRMW9NbWRMTkhKOFNqd1NTL3M0ZWZXV0R0SGZMUVhDZ3Vid2dmQjFXa1Ra?=
 =?utf-8?B?d25MajlyK0pnQlpSQWFJcksvMUxCZ1FwV0VUTEV6bCtkUlVXU1BvVDlwMGZ1?=
 =?utf-8?B?SHB2QlFkUW5KbGt0amFjZEhFbm1LYmhuVERqaUlmaUkyU3M3eDZVOTRIdWU1?=
 =?utf-8?B?OFZJWTZTcmZpWXo2RitSUUQ3T0pEV2ZOYXYxNzYzNFRLMStNQ00wQndVWEVI?=
 =?utf-8?B?VVZGckxydWlrS1o3dXZSQzJZVWR1UE9xOVlDYU90OGlHM0lXQk1CdU5ROU56?=
 =?utf-8?B?U2crWmJQTVlBYUFvVGVwNEhvZVlLN0p6VzRNZEhsc3hSai9USVBPS2Ivcytn?=
 =?utf-8?B?KzJvTmlKT3RGNXkzQ2ZxYVpUVFJHbDBLdTh6dXc4OG1ybXBQQlh0YVhIN1hy?=
 =?utf-8?B?QUJvYVNEamRnM2N1OEZZaDcrcGdoL01wTWtpaXlGMDF4VE5KdnNrR0o3SmZZ?=
 =?utf-8?B?WUxTK2xCcmJxYTlZdEtFMXBqQm04ZERIMlBsak85cWx2VWQrWmptOXc1eHZY?=
 =?utf-8?B?RFNJNmdsTGlaazd3K3orbUg1Qmh0Y2hYb3hFM2lzMlhzZ0RycnJEcnNCSjl1?=
 =?utf-8?B?SDVseUFLTXhkWW9SMnF4SXNtSGlSUFRWYlhGTmRjSkl0YTZXUnRCYm95OUNV?=
 =?utf-8?B?T0dqcEdJanNsM1FRQlNJbjRlM3Z6Tk9PN0RHanA1MnBDdllRM3YrNVdFZmtR?=
 =?utf-8?B?WlJKNUdtNU1YMlQ2c3RyNm9PZmk2OEl5RUsvbm13MXlQcmdHcGtmMm5qdGVK?=
 =?utf-8?B?TjU3VnhFWHFzSElOWU5FWG9ETDJXYy9vQVhyRG91YUN0WGpZUnJNK0k1Zndi?=
 =?utf-8?B?YVFTaFR3SWJSQURUYXREVi9lcjlVc0Q3SHc0NDFFZ2FjczFEdUI4eGVnK3pI?=
 =?utf-8?B?UGZRU0gzeHZocEtiaFNVZDdDTlFUdWFuQVErNS9qcElNbnhKVjk1MmEyZjUz?=
 =?utf-8?B?bS9lT1RrbUMxWHdxbTZFanQ1ZDZUNkVSWEJEenZxZGlDazFKdFJRK1N4ZWlp?=
 =?utf-8?B?RkFFSFM5bVpkQkVnUFdOM2dMZ1MwN0ZzdWw2WjluVVRWNmJVMU5Semg2SmUw?=
 =?utf-8?B?TlRZb20yMVBMYnZVaU9uRzdxUWRTY2xBM0dzUEdWSkxNclYwSVNxdnVTRlF4?=
 =?utf-8?B?dTVlQjhEam1qdkNMT1FQZFZhMG52bjkwalNieWNmTUVRTkJ0R01HNmZYaEFW?=
 =?utf-8?B?YXViSVZRdGQweUtoL0cxZ1VZSkRPRktHc3RxNG5UNjQvK0hUNzU0dm5rcEhv?=
 =?utf-8?B?ZXN0bWlpc0ZHTFpud1RsZ0hTN2l3OGZaK1QxeWtqVmY3ZGRNOHVCUHNXRDdT?=
 =?utf-8?B?UXNxZ0liRUFmZWVONnBHdjI2dm9lN3lkcG9tZWNVRm1JNVVGVjJrQkxxaHVS?=
 =?utf-8?B?RmprdjJpS2dBeVB6QTJmclF0a1lFUzBMdzF1UUxCTXZwYlBXVUZWM3A2bTJ2?=
 =?utf-8?B?R1RHbmk1a1NsOWdJWlVvenA4Z3V1Rlo0akUwUTRQWFVIeHJKT2hTRDlqMXE4?=
 =?utf-8?B?NFh5dDdiQi8zVmorYVNhWkx5N3U5K0xKQ2hma0JkSms2YldQMmtLcCt1c1V0?=
 =?utf-8?B?Qm1nbmhOVElibWRQWmtHNUJXMTBoZHZmejgxb2hUbUZVZFZZa2xCdFMxYi9U?=
 =?utf-8?B?Yk9GM0tRTUo1dUd5UW1JRUZuMDBVamRzSElkdTlZaVk0Nmo1UGtGYyswa2Fs?=
 =?utf-8?B?MDFuS1Y2ZmR5VGhKYTNxVnQ2RDdrekZIR1J2YTFwMGxiUUdWRnFidGxmR08y?=
 =?utf-8?B?ejdjL3VMMHNKVUo0RVFKOGVKTzNQenpCM2JQcnhhSk1JdHRzM2FlbEUrTXcr?=
 =?utf-8?B?VTBva1lZaC9hVllwNlZoUVNlUS9lSTJoV0lSNlR3OHB5WmR2YVNqeEgzdDN1?=
 =?utf-8?B?VXRPRlIySHdjbkExTlhoUTdrQTZ2MUxZdE5uSlphS1c4S0U0NnNtdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9159c99c-2b85-4a32-c893-08de643199ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 21:08:52.7123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hADIoXJEx9JsdKJuvU+0iMufs9Y1OQQnV9UPddxigI3tqzPMtf86lggThxjAgJmUcD5gfi5b2F/605ahmWvmEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8062

DQoNCj4gT24gRmViIDQsIDIwMjYsIGF0IDE6NTTigK9QTSwgTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IO+7v09uIFR1ZSwgRmViIDMs
IDIwMjYgYXQgMTE6MjXigK9QTSBBbGV4YW5kcmUgQ291cmJvdCA8YWNvdXJib3RAbnZpZGlhLmNv
bT4gd3JvdGU6DQo+PiANCj4+IFRodXMgZm9yIGFueXRoaW5nIG5vbi10cml2aWFsLCBJJ2QgbGlr
ZSB0byBrZWVwIGEgYC8vIENBTEM6IGAgaGVhZGVyDQo+PiBkZXNjcmliaW5nIHRoZSBpbnRlbmRl
ZCBvcGVyYXRpb24uIEkgYWxzbyBub3RpY2VkIHRoYXQgTExNcyBjaGVjayB0aGF0DQo+PiB0aGUg
Y29kZSBpcyBpbiBhY2NvcmRhbmNlIHdpdGggY29tbWVudHMsIHdoaWNoIHByb3ZpZGVzIGFuIGFk
ZGl0aW9uYWwNCj4+IGxheWVyIG9mIGNoZWNraW5nLg0KPiANCj4gWWVhaCwgaXQgaXMgdGhlIHNh
bWUgcmVhc29uIHdoeSBkb2N1bWVudGF0aW9uIGFzIHdlbGwgYXMgb3RoZXIgdGFnZ2VkDQo+IGNv
bW1lbnRzIGxpa2UgYC8vIFNBRkVUWTpgIGNvbW1lbnRzIGVuYWJsZSB0byBjYXRjaCBtaXN0YWtl
cyBldmVuIGlmDQo+IHRoZXkgbWF5IGJlIHJlZHVuZGFudCBpbiBhIGNlcnRhaW4gc2Vuc2UuDQo+
IA0KPiBJIHdvdWxkbid0IG1pbmQgaGF2aW5nIHRob3NlIHRhZ2dlZCBjb21tZW50cyBhZnRlciBh
IGNlcnRhaW4NCj4gY29tcGxleGl0eSAtLSBwZXJoYXBzIGl0IGNvdWxkIGJlIHBvc3NpYmxlIHRv
IGRlZmluZSBhIGhldXJpc3RpYyBmb3IgYQ0KPiB0aHJlc2hvbGQgd2hlcmUgc3VjaCBhIGNvbW1l
bnQgaXMgcmVxdWlyZWQsIGFuZCBnZXQgQ2xpcHB5IHRvIHdhcm4NCj4gYWJvdXQgaXQgKHdlIGFy
ZSB0cnlpbmcgdG8gZ2V0IG90aGVyIHRhZ2dlZCBjb21tZW50cyBpbXBsZW1lbnRlZCwgc28NCj4g
aXQgaXMgYSBnb29kIG9wcG9ydHVuaXR5KS4NCj4gDQo+IEkgZ3Vlc3MgYSBmYW5jeSBJREUgY291
bGQgcGVyaGFwcyByZW5kZXIgdGhlIG1hdGggZXhwcmVzc2lvbiBvbiBob3ZlciBhcyB3ZWxsLg0K
DQpBbGwgb2YgdGhlc2Ugc3VnZ2VzdGlvbnMgc291bmQgZ29vZCB0byBtZSENCg0KVGhhbmtzLA0K
DQpKb2VsIEZlcm5hbmRlcw0KDQoNCj4gDQo+IENoZWVycywNCj4gTWlndWVsDQo=
