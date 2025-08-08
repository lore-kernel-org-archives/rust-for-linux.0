Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC89DDAD
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Aug 2025 03:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754624279; cv=fail; b=QgxXxd6oyAfcPXl6WfoZ1CceBQw+nT9yoVRvGdZbXyT5KTWAxG2es8ch1rj4D+tcdLhKUsWGuwIHqmJ0NUGP/mCWN/ij1gBjr8V2X76gy/50iVgwKUNNW3X0LhBIbhcDFDCyvC8FSuYbBXUtkMezfEq4Kw7kM1tOO7dDzKD/vsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754624279; c=relaxed/simple;
	bh=9o/lPpMNRRMj3VSynqzWrH4N1NbHQPCFOh4ZKcFatqk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=IZpy1ec1Yvqa1JIMKUkIOvG+1w4ufr/2dyq1rdXg9dIT/BpgulAd0c2FCt75sUOev8u035VdzCvTtMEqNoO4TP9l0nriHQe8m8dt6/vcLcYfyKuh1+s7vtKyIq2TlDCIO8xXJsvfwA+ENT4YhVkFo12Ei5r9uxFs+oG8sDTAnmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ANRZKjHy; arc=fail smtp.client-ip=40.107.94.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ANRZKjHy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfq+tjhTDz7IqCuk4MctlFXEcZrjV7GfNM+h0ysRgUqMlaM1xHGe/epduDX/7eFWIiw/vZzV13cGz9QwVW1UhwuSXDuwko2W0vgfQvZeUoK4aA5lDdmtRgigZI7OhG/Dx3IWuxxLCJ+nabG+waMG4bDetATpIq3F1XOmEvJtKcGUAoNj7wdutp6XpzW0kpR6bz2hAGkSGwyY4dnhh2uUhts3qgO+tyTNwve7Yxg0s0AVQcJd/YigaKrMYcAKqKy9MtEBfYQO9oC4rtglUUN4jx5hq0k1w0w4Zr/l73a9OWunXIJYlAIWZR49Md0K2sLWvWaLfTDS8/J/FTU660coUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ETRxP24yzlbiieleDhklhuU0wa+V0HY2xXvEcly2P4=;
 b=JYwdc2xGbA5w6go/yyNSYsN02TlgHqCmTF2XRAsYlb37iVdPXxXadQ+rQpBdvwyvKjTf2WCvoZDqMAVWKR5Lw0GNf3F3kbEniXz1ZXADDPk0M3iSXmwc2s1SH4pqb8PgMY1XiNymX/PwOt9aPDPNFQltfpaSh6ZQ6kSB19rma/gE6YRr0c5Kqb+spg39nexXkS6HZBUgPWMDmQp4fJH6dG8lNqCMA5+SbPhn8wUy9t4AZTHf887zAHQr/K5I+/5iJOi6ZJMzpDb/56MBd0yZTQ9D49d3TN58Etdl6Yz8sCbGzcARJ+tw6UUJmIaqJub/xJh2W8IUYAAewJ9P9XnWmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ETRxP24yzlbiieleDhklhuU0wa+V0HY2xXvEcly2P4=;
 b=ANRZKjHyrvUniluesVLMm4iIVBhGucQ5bMUnr+5fnT/1l7xjN/PJETM4EHZmpktblGIEsHMlZHkGr7utg1vOynTI/ia24iTt/9mn2QRNsLBBnqs8Qxq/Ak+3R0y/Lyp+y04FgUNpzV+milvztpxrpM1j9q5a75Jb3vdcWbtOe+Em+TcMKjwWkyuoAATQcNt/e4P8u4z0pIOkpVa35rSCo5wpFtoYuLepZLOH1HIQDpGbbNOXgNQJCDkCXWIN5+gazRVg7GIcxCYSI8OgrF4osHRx0W6riR0Fgimi9no0Y4FoZEMvYmmYkeJHKsaWnm/jV03p6x88EIKqkMoS+2rV8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYXPR12MB9279.namprd12.prod.outlook.com (2603:10b6:930:d5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.17; Fri, 8 Aug
 2025 03:37:55 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 03:37:55 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 Aug 2025 12:37:51 +0900
Message-Id: <DBWQE6N80493.16MSUYZOR2AFX@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 3/6] rust: alloc: vmalloc: implement
 Vmalloc::to_page()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <lorenzo.stoakes@oracle.com>,
 <vbabka@suse.cz>, <Liam.Howlett@oracle.com>, <urezki@gmail.com>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <abdiel.janulgue@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250806205044.85085-1-dakr@kernel.org>
 <20250806205044.85085-4-dakr@kernel.org>
In-Reply-To: <20250806205044.85085-4-dakr@kernel.org>
X-ClientProxiedBy: TYCP286CA0259.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYXPR12MB9279:EE_
X-MS-Office365-Filtering-Correlation-Id: a299074a-aaff-4a5b-f1ad-08ddd62cf5f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkVEM1BvNTBpQkZrQ014ckVMY3YxOGNMdHlqakxPMlY2UFd0MU12Sm9pT0No?=
 =?utf-8?B?MFIyblNxWk91cnhtN1JZVnlBOEdBOXdyZGV4VnpzZWkrM3d1TERFenNRVk00?=
 =?utf-8?B?ZDFuZzhhSFZTZXhWRytGUm94RXBOYWFzTWpBUmoxSnQ5WE8wQ2Y0L2lEbGJI?=
 =?utf-8?B?eS9tUHZKUzVVTFNDN2cyRnVxVkY2aGdDTDlrOHB1bGdkcWd3ajBWTHpWQS9u?=
 =?utf-8?B?QVZ6Z1RISE5yZDlUMkh3R1R3S3Z4eFh6bm02TFNwdjI3YzQrbStNVVdlL01I?=
 =?utf-8?B?N241NjdxaFM5c2pMY1N2bWVmUFhxQ2lKdlN4c1Bic2JGdzBzcHF6NzBkNHo1?=
 =?utf-8?B?NFpUeUNZazNoMWpjWFlLNHlqMVpOeGxoUmRaeXMyR24zSDk1N2hqVDRLTWY0?=
 =?utf-8?B?amtCMmJnNWUzUnJxcnk5RFdZNFFRR2d4QkxlL1NGSmIzaFNObTZ0dnBoYmpj?=
 =?utf-8?B?MVp6Y1Q4dUVWclpCdStOdTkxT25wOWNDNmpjeEk0RUFicXF3VzJMRjVrYUsr?=
 =?utf-8?B?UkVCc1lmSWtEa0VjVExBek9hY3AxLzBSUkJQNGxHS3ZXOUVOVkVpQTRpYTdK?=
 =?utf-8?B?TjRJTTNRRTlRbGx1OXdRTGFJY3dkY0ZTSUFNN01sZ3J4bGxkRXFBbWhKdWhn?=
 =?utf-8?B?NHpsQnlKWFdXZHZyMVF0aGRLK2RuWVJtMWU5ZHVwblNPU1NCbjR0S0ZTTUhC?=
 =?utf-8?B?Q3RpdmErdkRLVkVoS3E2RjNCVk5mZUd5b0NhaTl2d2k5U09Oa2Rmbk44MTJQ?=
 =?utf-8?B?dUJVWE0ybE01Mm10QVp4RXk1c1BpZWZuNE1SOVg1WFhoVG5pRjkyeGdSYW1U?=
 =?utf-8?B?b1liSWpLMUdhMGtMSkhVcUlMWldZazNKQklQU1JpWWxUMnNneDZHNnIvcjgz?=
 =?utf-8?B?WVJuekxnZTlLTEFMWmNQeFliT3Fad2wyN0pMMDhiNFBWNFI1WTZtbE5qUUl1?=
 =?utf-8?B?clFLU0RVQ0l4eDVrZXJyTXlLU1BlWks3MkdEVkNpN3g1VmlZbVZpL1FCYkUr?=
 =?utf-8?B?NHQ2RmpRRUVNS1ZwUnR6eGtmeG96dkxsaUV3bUxJWmxlMEJTTGU4WFZEdmFK?=
 =?utf-8?B?TFV0QWI1N1pqK1RRVUIwaTZpMUJPUkordlhUeGpFSWJWSmdBYk9jbmFqNTdC?=
 =?utf-8?B?NkxoeGJrSjh5TFVmWnJjVFJBY3FMdlJUaGVTdDJzMnR6Y2RXdzFCUmZTSlVV?=
 =?utf-8?B?THFFL1cxVks4TUZHUWFvZ3A2ZGJ2RHNlU0M1cEFrNjZON0NQTjFwTnhwZTZV?=
 =?utf-8?B?NDZTRUZycXJvWWlzZ3VVVTlTL0NzL0ZOLzIwdHJGcXBRMWV2RUVzYWFuZkY0?=
 =?utf-8?B?a0lHTnlybjBxUGpycjcyckQvRmxmYXFHM0ZxRnJtb0IvWDBPSm85T0pHaUl0?=
 =?utf-8?B?cGFxaE9HODg2TTBLQ3FKTDNnZUhtM2FkRENMK2J5bUF3ZkMzeXFjdDhteW5n?=
 =?utf-8?B?VDc5Q040Z1J6SGRleHdmZElDYll0Q2kvbzdqS2tHdm9ZZDBMWkFaRWVoM252?=
 =?utf-8?B?UzNJVHk4eUhlQldrakc5SlQ0VFJXcHM0czZtR3Vsa1laS3diWCs3VUxHV3RQ?=
 =?utf-8?B?ZHFJMmliaGovRVV4cVVUeU1Ya1hsOXJhbzdOYStFWGUvcUlLdjk2b1VNVTVQ?=
 =?utf-8?B?MG9XTGpOTU80SmhTNkNySzlTWkpsaTU5MW04NkljTkt5MFdwY0RsSnQzNEpC?=
 =?utf-8?B?YkhLdTc5aCs0NjkzWW1jY1lLYWgwVXBtdmpDQUI3TTJEQmRYb0hOWWlOL3hv?=
 =?utf-8?B?NmYzcTZTS2NxQmNQeHhVT2psa0RwUFZlVTdydWl6N05uMVJTZlpETVJlZFZs?=
 =?utf-8?B?Z2VvcXN0VjJnNnhvSjh2cGtWeExkMUJFWVdTSFN5cllIU0Q2SzdVMFplSFcr?=
 =?utf-8?B?RUpvenNuQ25sK1drVjliWTlnMTU1aFBVV1o4cWl3OHk2VXZ3cHB5cVRiRFBX?=
 =?utf-8?B?Z3ZxZ0JRMUQ5NURHejBJeFZuSzBJZzhjV3B5ZU0wSnByRGxpRW5heXd0Qmw2?=
 =?utf-8?B?Mnp5VXhGaEJnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjE1UGJNbTBlcXROcHplaUhCakd2K2YzNVFYd2xLSlN4NnB5WlB5bFYyZkRM?=
 =?utf-8?B?N0lYRHRzUW5ncXFRTzVVTnVVMk5tcXBrbFFIb3dqU1ZLcVNQWkxzMUIzWldy?=
 =?utf-8?B?cU9zb2VZUDNjQzFCY0EzYWU4MmlaUk8yV2hnUkJTMWZjYWJVVFltMkphZFpP?=
 =?utf-8?B?RWNzZm4rTEhBT2hLOTFGcTdrOStlRTBCdklDcGQySnVNVlFQTHI3SVpadkVz?=
 =?utf-8?B?UG95eFVRZnVjUEZQZGlpRjJDQXRvWW1ST282TlpZSmQydElRSkRRaVE5Nkg2?=
 =?utf-8?B?aTM0VlNiVytLbk9LY0o0NGIwbkZNV1FndGxKM29UOEVkaGRlZ2VRbVpGYzVl?=
 =?utf-8?B?YVZmaFlidmdTRGN4c3lNaEJlVHhIZzVKdTk4Ymd2WkJzUmgzOFIweE9VR1JQ?=
 =?utf-8?B?cWlyOHk2blVGVEE0NG5DZE1iRDhIK052MUo5WGJZRVVMNURGK0hFTlhzaktm?=
 =?utf-8?B?RjRVYlE0elNLQi9sak42T2ljK0cxQTRkS0ZPcW9McDdyRGpqL2FRSWthc09W?=
 =?utf-8?B?K0M4bWY1bjNpa2pDVm52Ulpib1dETEpjSWpnb3RPNm1ISXFUM0dkSWpuOWlQ?=
 =?utf-8?B?RUF1eWZya0gwYmFSaDh1bFhuaVhFZ2h0SC9rWHpZMTRRZVZaNi9CblBGVEY2?=
 =?utf-8?B?TlFBNUttaGxyUFdCZTNtK2x1a1lMK2JnRFhxWkJGSkZaZ0IwdXM5TkFCZS9F?=
 =?utf-8?B?N0h2MktFd0xyS3AzVU5uYVJzOU9HTUpyM2FVKzZYUWh0OE9zdjVIdVlnQUxG?=
 =?utf-8?B?M2NWdTgyREN1TjJ3KzV5OXEyZ0xXN1Z0aW5NbXlzb1ZsRzVqTTd0WEFrRyti?=
 =?utf-8?B?dHFkM3dWVmNXWU50aHVHYVR2TENaZ1l3dWVIT1pOT3J3ZWE0Zk5WUCtydG1C?=
 =?utf-8?B?RXRrdUluL0d1N3JPandSQ25SbEFFY2g3VWlVQkRGa3B6akVQTk51c2N6citS?=
 =?utf-8?B?bVJTRjBYcFNwZE9JNWZWQzM2aUcxUW85YnBheG53MmtmQk1xcDBkcWVWTXhI?=
 =?utf-8?B?ekI4RTc3bVB5WStzb1F3N1UxNjM5Q09ob0doMGdxK0pMbWJJdUp0OWkyd2pZ?=
 =?utf-8?B?a3p5WXM0QWVRYS9zUGc2RzMvWmtQSmtkdW15a2RjZTdHT1QzbHVYa0xVdFJF?=
 =?utf-8?B?ZmtRY3V3OStYVXA4cGYyeXlCS2Y0aDRvdVFnK21sRkoyWUE0T2dHMm5CbnY0?=
 =?utf-8?B?T25LU2ozMCt0UDFKdnNLazV6VDQ0aHg2Z2dEQk5ieVpiL1NqdEZYVkwvNnls?=
 =?utf-8?B?UHNkdTdOdmkxN1pjUXBvSHA5SE5JNU9WTThWWnUwWjFRWFJSaTJyWFUzUWpJ?=
 =?utf-8?B?OWhPeTdQOFFxbUEyU29vOHBDUmtVdEtoeGMzMnpQUkNsamY1WUQrZXNCUit5?=
 =?utf-8?B?eG9GUVVESGhNMkpBR2Z5N2x4TkZBOTlOZGhGOGY1NWFaYjhFUGkxcHF0YUd0?=
 =?utf-8?B?N0VMcVl4MG9YdnNMZTFySkhOTU1YU1NyR0VOakVrRXlnSEZjWE9XdlRVcC9v?=
 =?utf-8?B?WFh1NVJrSVpGcGE0TTVjb2hxN3gyQkN1dnBXVGJJWlNNbTBpeFFwb0FSSEhG?=
 =?utf-8?B?cG5OTmNXU3RMMmpRRXA0Y3ZQMno0bjl2YzY2SnRoc1Juck1lZ0hLN0JkbVY0?=
 =?utf-8?B?cHlpS3FNcEFlZE14M2NyV204cytCTVgybkVFaXp3dVhhRjI4RUhaRXQ5MjJ0?=
 =?utf-8?B?eUpnZEZmdWUyOXZldXRVVVlkVXFTYmYyY1dsOFZtQmNBaFdEYUlIUHhiOXIw?=
 =?utf-8?B?WDdacGJtMndVb05iZ2FWMVBxeHRRemdaYjc2V2FVdXhYM1pXOWI2S3VZc2l5?=
 =?utf-8?B?ODREaDlJTlBiYzQydlNtcUtqeWVidWc2R1pOdDdtbHcyYUdnNnR6Y2ZJMFhE?=
 =?utf-8?B?TDdxZ0FUSUh5bklaWEsxeUs5aGJuYzVQeE1pNnJha1pYYTJFMDRZMTY2czFq?=
 =?utf-8?B?Ky94cSttNWorMENFeithaXhqZ1MyN2hiVGhmNzBYT1pUVmN6TEticDlQTWVF?=
 =?utf-8?B?WXBWSUxrSE12QlAvMFk1eThrN3B4WERFZDl4U1JKZ285d3pDTzF2MGttK1FV?=
 =?utf-8?B?NjZvZ05tT0RUcHZONUUrWXQxL0hlNEpiUmNXQXE3Y1hxZ3VvQm0wZVR4ajdC?=
 =?utf-8?B?Z2hsSHdaZVVZMDNkOEJ5UTd1a1AxMGVUZGJBRzBmVnlPWWxoTm9jcUlzZUZU?=
 =?utf-8?Q?enMpYitY3VSANkPYKx3yHlimwKAaIF4773kIDriBqpUB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a299074a-aaff-4a5b-f1ad-08ddd62cf5f9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 03:37:55.1285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uh6It6Lpgnc0Qbm6/xumCwwQWUei4m5aBj18W1xIYfH2Xmdy36JKEfMc7Qx+LlycWPyU8U/Zfy109SDPSHM1eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9279

On Thu Aug 7, 2025 at 5:50 AM JST, Danilo Krummrich wrote:
> Implement an abstraction of vmalloc_to_page() for subsequent use in the
> PageOwner implementation of VBox and VVec.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

One minor nit about the example below.

> ---
>  rust/kernel/alloc/allocator.rs | 49 ++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator=
.rs
> index aa2dfa9dca4c..2315f5063011 100644
> --- a/rust/kernel/alloc/allocator.rs
> +++ b/rust/kernel/alloc/allocator.rs
> @@ -15,6 +15,7 @@
> =20
>  use crate::alloc::{AllocError, Allocator};
>  use crate::bindings;
> +use crate::page;
>  use crate::pr_warn;
> =20
>  /// The contiguous kernel allocator.
> @@ -140,6 +141,54 @@ unsafe fn realloc(
>      }
>  }
> =20
> +impl Vmalloc {
> +    /// Convert a pointer to a [`Vmalloc`] allocation to a [`page::Borro=
wedPage`].
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use core::ptr::{NonNull, from_mut};

Maybe make these imports visible, as otherwise the reader might wonder
where `from_mut` comes from (I did :)).

