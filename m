Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012067.outbound.protection.outlook.com [52.101.43.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB96192B75
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 20:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765483553; cv=fail; b=RmM5kM/Qr0WtbV7YsuqoVAfDRkrt6Uem6W+u6vTcriPPNG99Nr8EkUqBEXclQNxm/FkRt6Exq0bMOaT34/rljM6I6KS9It1ak/Oja7O4ZY0tddCVVHoR4hpGD1R0bIxF8S92aHywMvf5qXZDtL9s11FI4JiIlgTOunCKZniKwpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765483553; c=relaxed/simple;
	bh=aG/vvjBYTBs5r6b7q/lxNYy6XecZkAYpySaKL6sKy2U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=edTyxCVpUpeZLU/7MCkV+UFJ9cwnZDxdx8q5FPwss4OXbO8gYtYRMY+TsllRXefECadJAwWuN0ffn+jbrGpdF0pEsMPQcmdtdwy+Q73r8PV7Gq0uZnpY8Yme5Hsaw9yK75UmUtBZ2dapt6c+psjJKRSdzALGFCkQgAhqm+1HO1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SFtQrgEB; arc=fail smtp.client-ip=52.101.43.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SFtQrgEB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qp3HSNXQq1FqnXYxbwvKpp0kTfj4HNiEXQyxruA19Rxr1CA6iBTflwlwpAIOgPpbsiwRMRv20slPhMFgN4PE7n2trs4zISjqICjyHWhkPqrFZa7vGleJs9H9G7htEvVxQDjdlhKwFlESHgZ/9uL83orFkkfp0BpyKLbjqizu/ObjV+aIVLwvWBdpGIOVoVRbxaCPw4Gz4L5RF/GZSlg0rcj68giHDH8sF/JOVM/nhefR1c+h10MZdUCSXuNJ66k/QLpDFsWd4Lh+/OYElCxuVdb+d2AT1xsgkbH8XXQL4N0GJKS/VsEzPAj3LGQ7RrqryeCn30A7am8NW/Gk8xFIFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aG/vvjBYTBs5r6b7q/lxNYy6XecZkAYpySaKL6sKy2U=;
 b=qUqCAXCDcOFNfS5hgOhljznVvAMJ+Va5OOT8Ak+QSfzbTPQkZWu32BZZ4skt1+9Xh3/PumE54Y8y+xhDZozp2pTZa5oKNoS8fwLBGr7Mtv4mj99mATppj4N6hLrCRhOe7g89IQg7N4qq9KUbX5XGqcc7YpRCsz/NR2Vutf/fjnsfUAziX5jXMUQCAkCw0nOM+RvT4e8ejY1d3fsd+BVP/OPrEvOU4m+ciXcVXFLcUtdkI8Inr5keizNlsF98dxneFTNAHBFC0Czc5AQg97oQjsf/Zv4/BvB5YOvAcVUiacvh+iED46RT/BzmyukfvpFsd3LoG04Y4lrf/L509CCTQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aG/vvjBYTBs5r6b7q/lxNYy6XecZkAYpySaKL6sKy2U=;
 b=SFtQrgEBNHU18exAf0+22bL96aqPVilfaRixn52yIcrT4lFI4FrSPfzQnHQs+0kAYlvg1ozjmhYHfxxTvUkrtvvlcCQQSqRu764N3Z88APyyRlmOy4I02FF/Nnm+qgKoUjU4qLy/5fmsZQLoykkFaKNwu3lxGb37KRDiftbiW0HNt4Jbry6l4z1F8sqwcO8qScdU1o9bRLFTurWdVtauLQX/fyI7EfWKjXnglz+odsV5UsmZ9mwPjZI4AtrumIqxi6bDRaITu+WmLCmexCz/nlpbHbItKNX72qGlc/UflXm9nEOB6v/Kf3yO2pCFfY3vGBLwQpjwVgX3VhwY8NIo2Q==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB7913.namprd12.prod.outlook.com (2603:10b6:510:27b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Thu, 11 Dec
 2025 20:05:48 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 20:05:48 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Gary Guo <gary@garyguo.net>
CC: Tomonori FUJITA <fujita.tomonori@gmail.com>, "boqun.feng@gmail.com"
	<boqun.feng@gmail.com>, "ojeda@kernel.org" <ojeda@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>, "will@kernel.org"
	<will@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
	"a.hindborg@kernel.org" <a.hindborg@kernel.org>, "aliceryhl@google.com"
	<aliceryhl@google.com>, "bjorn3_gh@protonmail.com"
	<bjorn3_gh@protonmail.com>, "dakr@kernel.org" <dakr@kernel.org>,
	"lossin@kernel.org" <lossin@kernel.org>, "mark.rutland@arm.com"
	<mark.rutland@arm.com>, "tmgross@umich.edu" <tmgross@umich.edu>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 0/4] rust: Add i8 and i16 atomic support
Thread-Topic: [PATCH v3 0/4] rust: Add i8 and i16 atomic support
Thread-Index: AQHcapPIF9FrJZ4CFE+69rbaTpcU6rUcxVAAgAAYncE=
Date: Thu, 11 Dec 2025 20:05:47 +0000
Message-ID: <C582E51F-7457-4846-B865-E13789F3776D@nvidia.com>
References: <20251211113826.1299077-1-fujita.tomonori@gmail.com>
 <20251211173742.199ace36.gary@garyguo.net>
In-Reply-To: <20251211173742.199ace36.gary@garyguo.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|PH7PR12MB7913:EE_
x-ms-office365-filtering-correlation-id: 760063db-dd6d-408f-f061-08de38f0ad0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?akxRZC9wQkVpTVAyOS9uTmw2eUNYMXZhWCs1cTJ3cDdpK2NqV3dwL0xoVGUv?=
 =?utf-8?B?UG10NlpBaVFHYUlKQnJHSnpUalZZV0c2ZEJFaHp0RkFYZzkzaHBhK2dvK0JW?=
 =?utf-8?B?Um81akhwcUEyS0lEL1J5bTRxWHRDcUxjNkZkdGNTZWw4S1FFRnQ3bUcyUHFs?=
 =?utf-8?B?d2g0Y1BHMUNldy9yTTlha0hnQmhxRUlWeDkvWW1rN3NlZGNodXB5VnBzYVRq?=
 =?utf-8?B?Z3BYcWtlQzBjTWZORWZZMnZjSWFFNXZXT3VvZ3VhRTNmSnNKeDJXNUNIVTlW?=
 =?utf-8?B?ZEtvQWd5Tkc0VHgzSEVOckFzZGxtNzdDWUxhYkllV0FOWUh6WXBkUGZRR3dh?=
 =?utf-8?B?MnZMM1FFaDQxNVZlRVVwYmxIc3BjbFN1Ym1EcFlrSnA1cVNKUEZrMUI5cEla?=
 =?utf-8?B?bFl6NkNMUmcxMHgxNlFDbmZ6aTZxMUpSeEdPZlNRYnk2WlREM0N2MW5QYS9w?=
 =?utf-8?B?cDFrd0MxR0ZNRWNEOEp3VFZ0R0Q1TGt6OHdGWmYxYXlkK0hBRU80U2R5YTY1?=
 =?utf-8?B?KzYraURZczRaZGdOTmxtNEtzRmhMNnovSlJGeHBiNHBhQ3NVS1ByR1ptb2dO?=
 =?utf-8?B?d0kzZnQzWmZWVkF0Qy9veTg3Q1AwN1kwRXRBV3I4M2d1UGJEYml2QldzZmo0?=
 =?utf-8?B?eXlRdlFMWDB3WEs5dUxIeEt5aVl2TnFtRWUrT3FIOWVhYndDRzNlaU1BR0F4?=
 =?utf-8?B?VFZEeUVJUEFmSUpsczJNd3F5U0Rha2hKdXFBbFl4cEM0ODNHMXBvL3pjdXV2?=
 =?utf-8?B?U2ZDRWlBQTRLcHNxdUgySys5bmk3OFZYTUNLbzU3bnl6YzIvTnc0ZmN0TU1Z?=
 =?utf-8?B?RFhDclBadk96am52U0ErVHU1QlFSQXRnTzM4K1pkaVVMbUF2ay9STHBTSlRH?=
 =?utf-8?B?aERUdDhrZm4zUlZwQ1NRbW1mZGV2ai9tMDgrMXU2eW1jMk5STFZTeXoybVdD?=
 =?utf-8?B?VmsrdjN5OVd0WndIUHZyeXQrSXlqMGlCb3Bac0pYNk4xTkNpdHM2U3grRWt2?=
 =?utf-8?B?SDBWZFNVb256UWVGUnFiUE1tYVF3cU5WeUVKQWlGRWJLWCthTXZZVnlyc3lF?=
 =?utf-8?B?N2NoWGxQMUc1WVN4U0NtSnJ4MEVjV3F3eVFuQVY1UnY0VG15VkhrYXRTWHc4?=
 =?utf-8?B?cTZzYXpDSVErS3V0QVlHb0FRL2lCQWRjWFJQeGRqNXVUVnhrTFA1emNnalVG?=
 =?utf-8?B?aVhCcjRtUVBsVnlqUE1rSy9CS3hHRmVML2hZeWlFVERxU28yRy92cEtJTi9J?=
 =?utf-8?B?RDVha01YOXhSYmpMSE1aTWlGSCs4UVJKd2xUTlpyeXVWVVdjZEhhRmlHSmZG?=
 =?utf-8?B?aTkyaVZ6WnpVZGNzLzc3K0NVTUQ5N0tjWXFXOHFDZnB1UjVJR004aHU5ZEtE?=
 =?utf-8?B?MDhkMjkrcm1FWEhzSE1BcjVoV0VpbWZLRUE1amJRbGZTeEFhcXVTaTFma2da?=
 =?utf-8?B?cXJrWVRYekR6MjdJZHNoemFwM3dxaC92TndWZUc5RUE1cDFzWjN6ZmI2UUFZ?=
 =?utf-8?B?M1lJZEhTQkt2MjVGQmpMdUVtTGNBRzlXcytVbjVubUsrV2h5LzV6VGpyaThr?=
 =?utf-8?B?b0M2UG9HNmQxZGkwR0dFSmNFS2ZJMnBPMWJJOHNQSmVyWHc2NWpRbXhpT0Yy?=
 =?utf-8?B?ZFl0K0ZvOFZmMTVHYStGYlR0ZjBMU1ROK2JyZ3dBdnhoZVdIYlhzOWd3cnhX?=
 =?utf-8?B?eDZVS3dPSTQ2d3g4NitWRDA0L3FJSkxHMGlicjBTMEo4TkZyR2YvK0RJRlhB?=
 =?utf-8?B?SGlKMm1IOTB1eFNtODV6enpuUU9ja0NQMlk3VXdsdmNFRnptMm9xUm9zRDRo?=
 =?utf-8?B?czdwNlJ6MDExU1FTZG5pdFpJK1Axd0Z6RkVWL0pLTlFsY2RpOEpvQmF4OTNz?=
 =?utf-8?B?QlBrYm04ZnRwbWx2ZHpKOVpBcjIwVTZ4ayt5TmY5OUxDUFpuWjR6azJLdVNN?=
 =?utf-8?B?azV5V3RydTFrTXo2T202U1Jhek9EZzU5dFdkb2hJRDdQeXF3SXl5NElkdnJq?=
 =?utf-8?B?a2JMZE1MMzc5YnVpNlVqOWc5aGpGOUFwM01kZDdUTFV3ZnYyV2hxQU1NaU9R?=
 =?utf-8?B?bEVSQXVtcm5vRk5RMEV0WklQZ1ZzS3VkKy9vQT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UWdRYUJQVzBxejZCUjhKdlJ0cWVVQlg1OVhtRU1ZYmhQY1hPTjVDb09KVCtk?=
 =?utf-8?B?enpFWnB0N0R2TVFpUU5obnQvV0FJeDlDNTdYZkRIc3lEN2pNQXFDQWpONkpW?=
 =?utf-8?B?UGJOd0NEVis5WlhUbk5wNGdocGh0dzhyYjYzd2sxak1Qd2o3cTFEaHRabERG?=
 =?utf-8?B?cWh2dkk2MkJnUXJLdlVNRDlpU09nNWp1NzZwMzIzN2hNNWdzc0l5UWM1b0RG?=
 =?utf-8?B?bGFFMmh3Y3hLUCtPbHpmNzljZ0RYMmppMVZHUzRnV1VZNXdaVER3QmdlbU82?=
 =?utf-8?B?eUMxOVhjbmtjcWtIdzJIeFhETmFpbXhqN2JSWUlCMlhnblBmQ2FmRTdxdjRv?=
 =?utf-8?B?bzk3M21nRlVMd0EwQm1mMHdWeEZPWWVqN3lqZHpKU1MrT2dQLzNXMFpkSkJS?=
 =?utf-8?B?UzBnVmpvTW1uQjluNnR6UWlQWFpQNUdtZU11UTdVZkswVHM2WFNLNEVkR2c1?=
 =?utf-8?B?TVMzQytPNno1RjhpZXNsNjZWRVV1Z1U5RXpsTjZIeVl5V1dhQituWmxTUXk1?=
 =?utf-8?B?TVc4OWFJZDdhRWxEcVZGdUpWQjIrQjNST2N6eXdvRnlydE1tZS9jcEhKRC93?=
 =?utf-8?B?UXUrMVB5S2ZiMFZnYm5ONkRlL3pxVVRzdWpBNEhndlUvOHhZWlQyblRoelBK?=
 =?utf-8?B?a3pZMlFJNXhrVHpzblplWFlWNVZKV1JpOHpRRzYySzk3ZXpwTHd6K3FCUkdv?=
 =?utf-8?B?OFRvd0hCR2h6OHg3MElnc2V2aGpzS28xSWN4SHJqOFYyVFIyeVc0dlFvK0Jz?=
 =?utf-8?B?blVybERxM0NHdklXZEk3UmdJZkVIZ3BvVEJEUW9iYldiV2VFQW56dndnNWR2?=
 =?utf-8?B?Z1dNTTZNcWZBWnlndjJtVm9TVXVIOGNRaHFXVjZ3cEhiWVVsK2s5Y2hrd1U5?=
 =?utf-8?B?ODBRSHdYM05lTUwxNERlODBaQjRRK3lZblUzZk5HS3pzakFNTjB0bHpjaW5x?=
 =?utf-8?B?S1l3ZW0rLzhJRkM0WnFRb0VwWmRKbVJXY1I1UmNaYXdFRFdTai9rajQ3QXVY?=
 =?utf-8?B?OG80dHpNMU9lRTd3eE8wQnQ4K0swLzJsMEMvSXgza0kvYWFxMlo0S0VtM2hG?=
 =?utf-8?B?K0dwYzBOTkQ3aEc3Nk9rYmpWWTR2SXFQV0JYbnBwRmlnTHB5N3U5V0x2R2do?=
 =?utf-8?B?S09iYVhnWVJyTG1XZU5jTk5OWkFwNHBjYXNoYnZRL1JENk11b0ZkTXlrNFpG?=
 =?utf-8?B?eGp2Q1FzdDJRUjk5TFI2TWtWYWVvZ3VHUmFmTlRnUGg3WXZjV2N3NW5vcjFH?=
 =?utf-8?B?SlBzS2hqRVc1TFoyZnZqS3c4NXdCUCsyeXpEOVJ0ZFJ2azdDTzhvZGFJTjQz?=
 =?utf-8?B?aWVieVFkL2c2bm9tNnBReTBES1FyWTRmSXBqeFU5REhpNmkvcWx3UFNORkp6?=
 =?utf-8?B?MnNCdUVTWWUvVUNTZ3JYeDVCa3Y0Qm8wZEJFTE5ZSUZCSUE3RHdUZ3pNMXRs?=
 =?utf-8?B?cWF4VFRERldQaEpNbmtIc0pPbW9sVStFay94NnpqNTdIMVVvU1JuQW5BN3o2?=
 =?utf-8?B?dkV1VkZQdU40bEFhNXlaTTAycmRicnRXSFN3bWlBYWh2aXJPQ2Q1T2NaL3ZY?=
 =?utf-8?B?OS9qdG1UUGZtVFFjYTJ6Wlh1MWgvVHhIY0x1OWZXd09pbTQwUDNKM1pMNW1C?=
 =?utf-8?B?ZUJERkxrWXl5RmFmV1lTbVU1QnhrcUFWckdPbU9CS3ltZ0RJK1JNUFRISkxE?=
 =?utf-8?B?cHZDcnZIUnl0aURxdHN3ZmZnZXN0amdhVWdsdHNNYlJVUDRKaHVpTVUvbXNJ?=
 =?utf-8?B?Z2VEU1ZXNHFkZUE5RnFPYWF1ZUU5M1hVd3BnUDR3R3B5dmhKSkZOQTg0Mzc0?=
 =?utf-8?B?NUR2YUYxdW5LRHc1ajd0WWFqU1gvR2cvZFIxb1VPR1dPQ2pVVGZwNU5wMnds?=
 =?utf-8?B?K0dVdFB2TFM5dmh6WFhySS80N2diQ2d5V096aFcyQkp3aXIrWFpoVmVEMGJZ?=
 =?utf-8?B?eVVpQWlSVGpXdy9LNVJJaUVyNXFiNDEzUVMyQ3AySnlYYjhNR0xzazliaC9D?=
 =?utf-8?B?N3BRNnU1S0FFaTZLVWNxdzBOeGsvbGowa2hoM3ZBaDRaSVl6ekRhZDJBVFla?=
 =?utf-8?B?UGtQQ0RiWHNjWFNPN1o1czkrcG51SFFxcWI0WVplUEMybFFBSkNXbmh5bFRL?=
 =?utf-8?Q?HSAeed6HqSr4Yd26lGfmlMck/?=
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
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 760063db-dd6d-408f-f061-08de38f0ad0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2025 20:05:47.9114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vTEm/QZUIDqcWTR7VNKV8A3C8Zr5NTmt/YdCGCL3Cp9wBXUlSA7WIzsX0CdtoAL4nJYIKF/SeW+K0OkaDjQdPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7913

DQoNCj4gT24gRGVjIDEyLCAyMDI1LCBhdCAyOjM34oCvQU0sIEdhcnkgR3VvIDxnYXJ5QGdhcnln
dW8ubmV0PiB3cm90ZToNCj4gDQo+IO+7v09uIFRodSwgMTEgRGVjIDIwMjUgMjA6Mzg6MjIgKzA5
MDANCj4gRlVKSVRBIFRvbW9ub3JpIDxmdWppdGEudG9tb25vcmlAZ21haWwuY29tPiB3cm90ZToN
Cj4gDQo+PiBUaGlzIGFkZHMgQXRvbWljPGk4PiBhbmQgQXRvbWljPGkxNj4gc3VwcG9ydDsgaW5j
bHVkaW5nDQo+PiBsb2FkL3N0b3JlKFJlbGF4ZWQpIGFuZCBsb2FkKEFjcXVpcmUpL3N0b3JlKFJl
bGVhc2UpIG9wZXJhdGlvbnMuDQo+PiANCj4+IFJlbGF4ZWQgb3BlcmF0aW9ucyBhcmUgaW1wbGVt
ZW50ZWQgaW4gQydzIFJFQURfT05DRSgpIGFuZA0KPj4gV1JJVEVfT05DRSgpIG1hY3Jvcy4NCj4+
IA0KPj4gbG9hZChBY3F1aXJlKS9zdG9yZShSZWxlYXNlKSB1c2UgQydzIHNtcF9sb2FkX2FjcXVp
cmUoKSBhbmQNCj4+IHNtcF9zdG9yZV9yZWxlYXNlKCkgbWFjcm9zLiBUaGV5IGludGVybmFsbHkg
dXNlIHRoZSBhcHByb3ByaWF0ZQ0KPj4gYXJjaGl0ZWN0dXJlLXNwZWNpZmljIGluc3RydWN0aW9u
cy4NCj4+IA0KPj4gdjM6DQo+PiAtIE1vdmUgaTgvaTE2IEF0b21pY0ltcCBuZXh0IHRvIGkzMi9p
NjQgd2l0aCB0aGUgY29tbWVudHMgdXBkYXRlZA0KPj4gLSBBZGQgYSBjb21tZW50IGFib3V0IGxl
YXZpbmcgdGhlIGV4aXN0aW5nIG1hY3JvcyB1bnRvdWNoZWQNCj4+IC0gQWRkIF9fcnVzdF9oZWxw
ZXIgZm9yIGhlbHBlcnMNCj4+IC0gVXBkYXRlIGNvbW1pdCBtZXNzYWdlcyBhYm91dCBhdG9taWNf
ZXh0LmMgaW5zdGVhZCBvZiBhdG9taWMuYw0KPj4gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3J1c3QtZm9yLWxpbnV4LzIwMjUxMTE3MDAxMDM1LjQwNjg1MDctMS1mdWppdGEudG9tb25vcmlA
Z21haWwuY29tLw0KPj4gLSBJbXBsZW1lbnQgcmVsYXhlZCBvcGVyYXRpb25zIGJ5IHVzaW5nIEMn
cyBSRUFEX09OQ0UvV1JJVEVfT05DRQ0KPj4gLSBSZW5hbWUgc21wX2xvYWRfYWNxdWlyZSgpIGFu
ZCBzbXBfc3RvcmVfcmVsZWFzZSgpIGhlbHBlcnMNCj4+IC0gU2ltcGxpZnkgdGhlIG1hY3JvIHRv
IGdlbmVyYXRlIGF0b21pYyBtZXRob2RzDQo+PiB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
cnVzdC1mb3ItbGludXgvMjAyNTExMTUwNTAzMDUuMzg3MjQxMi0xLWZ1aml0YS50b21vbm9yaUBn
bWFpbC5jb20vDQo+IA0KPiBUaGFua3MgZm9yIHRoZSB3b3JrLiBJIGRpc2N1c3NlZCB3aXRoIEJv
cXVuIG9mZi1saXN0IGFib3V0IHdoZXRoZXIgdGhlDQo+IFJBRURfT05DRS9XUklURV9PTkNFIHNo
b3VsZCBiZSBoZWxwZXJzIGFuZCBoZSBjb252aW5jZWQgbWUgdGhhdCB3ZQ0KPiBzaG91bGQgc3Rh
cnQgd2l0aCBoZWxwZXJzIHRvIGJlZ2luIHdpdGguIFNvIHRoZSBzZXJpZXMgTEdUTS4NCj4gDQo+
IFJldmlld2VkLWJ5OiBHYXJ5IEd1byA8Z2FyeUBnYXJ5Z3VvLm5ldD4NCg0KSW5kZWVkLCBJIGFs
c28gdmVoZW1lbnRseSBhZ3JlZSB3aXRoIHRoZSBub3Rpb24gb2YgcmV1c2luZyBDIGFyY2hpdGVj
dHVyZSBzdXBwb3J0IC8gbWVtb3J5IG1vZGVsIGZvciB0aGVzZS4NCg0KdGhhbmtzLA0KDQogLSBK
b2VsDQoNCg0KDQo+IA0KPj4gDQo+PiBGVUpJVEEgVG9tb25vcmkgKDQpOg0KPj4gIHJ1c3Q6IHN5
bmM6IEFkZCBpOC9pMTYgYXRvbWljX2xvYWRfYWNxdWlyZS9hdG9taWNfc3RvcmVfcmVsZWFzZQ0K
Pj4gICAgaGVscGVycw0KPj4gIHJ1c3Q6IGhlbHBlcnM6IEFkZCBpOC9pMTYgcmVsYXhlZCBhdG9t
aWMgaGVscGVycw0KPj4gIHJ1c3Q6IHN5bmM6IGF0b21pYzogQWRkIGk4L2kxNiBsb2FkIGFuZCBz
dG9yZSBzdXBwb3J0DQo+PiAgcnVzdDogc3luYzogYXRvbWljOiBBZGQgc3RvcmVfcmVsZWFzZS9s
b2FkX2FjcXVpcmUgdGVzdHMNCj4+IA0KPj4gcnVzdC9oZWxwZXJzL2F0b21pY19leHQuYyAgICAg
ICAgICAgIHwgNDQgKysrKysrKysrKysrKysrKysrDQo+PiBydXN0L2hlbHBlcnMvaGVscGVycy5j
ICAgICAgICAgICAgICAgfCAgMSArDQo+PiBydXN0L2tlcm5lbC9zeW5jL2F0b21pYy9pbnRlcm5h
bC5ycyAgfCA2OSArKysrKysrKysrKysrKysrKysrKysrKysrKy0tDQo+PiBydXN0L2tlcm5lbC9z
eW5jL2F0b21pYy9wcmVkZWZpbmUucnMgfCAyNCArKysrKysrKystDQo+PiA0IGZpbGVzIGNoYW5n
ZWQsIDEzMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPj4gY3JlYXRlIG1vZGUgMTAw
NjQ0IHJ1c3QvaGVscGVycy9hdG9taWNfZXh0LmMNCj4+IA0KPj4gDQo+PiBiYXNlLWNvbW1pdDog
ZDM1OGU1MjU0Njc0YjcwZjM0Yzg0NzcxNWNhNTA5ZTQ2ZWI4MWU2Zg0KPiANCg==
