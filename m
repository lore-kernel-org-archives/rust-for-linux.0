Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012047.outbound.protection.outlook.com [52.101.53.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBEA3595D;
	Sat, 21 Feb 2026 01:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771636036; cv=fail; b=ro3Jb1MnSm0iT3KRbEnC1z68hcGr8PUEt+NHf5s62NnQRuQGJgxTYHrls7DneuJY72AVc1JGQHU1oBdzDtwRYPg9JoAg8BA3wQJjMy3DFBXaOeB/lyyE0cG2KDhZHKf7ETa+ItiFBmeyBrfmuw/utWwFCC6ObHZnV9uoxkAuhJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771636036; c=relaxed/simple;
	bh=/cTzZEyNrj1RVkHGQWSjxy0r+mwMocP89yFDBe/5Eeg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sngyzTVgRetAVN7e/hevtpfWJPlCyumMIqjyGQyMyQezjuvt+xdOSjBb1xe21QO5aoQdD0dWEy3oNmKLvpkeMsgApqOydvQRng1rRH0CKJ4pdJgWOpUIb2SrocY59pnYTklzHZfzNacAUBrDob5QtAR7Mcd0UqK1IBHgc1AX65Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SI6vcgYp; arc=fail smtp.client-ip=52.101.53.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SI6vcgYp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOdyP8MjTIc/elLM/uW56QluY+yTquT/ebwMBlDKv7cXNPq49T3dVSiE8onQiDlRWaAq3Ju+zAzinZl2Ne98bq4qQ1QQY6nKJPXhA+I+/UaNA9eBBAjJkyHBseVJADBJg6DTUxiB8pO1vEWoa443yZPGDxogl7KHly3pjMyLctpZKC1NCUAw3+PTTDNEUTlmgrmwf1p/ioqUsheF6Ok/GvFY1jnqoVtrbfb6hqU/Ft98Q+ClVFhCVDkmqUu0R0KAgwk19DcSSdzAFRx7gUm6lGaNZhW9qIaJbgr3P2H3pZw39uhXTlr7tCE35rp6bYNZpag6l/UQKPoWthb93z0RWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SIVfdhq32Tx8UWxl1W/GMsHLpHRZQrxFOZxt2kV208=;
 b=BC/1cln0+bPxuP74D2ivH09YdRYoA2/SOCKvj3suMD+bMSFhkt7HnprvqeV+VVZteTb9yTle1DiaxNWFpNLaS+FLtnl0lkJXPyn0Sp/SEOUHMuRN3XeQe2KiafD84osJ/mCofHehnf7Iq1eO15giFWuFuv5LAnYy0ilYGo5ufHSVrJH6vyVRcEbVpK3hYcFQPoTSRNheGcWJBOWvGB5816nP3qbIZEG8pJ4jnBYRG4aZSRRZ+Fd4ZWW258TU4XfDEBLfV98YTViTp7znBVrD9P2u4MjmBNsqMDRamI2V9MQO0mHLYKiK4mvgCv6GvfJW6IE+Z04lr7rYwnOBYBBf7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SIVfdhq32Tx8UWxl1W/GMsHLpHRZQrxFOZxt2kV208=;
 b=SI6vcgYpaflOkDCI26hsLYD13JWmhMVQD+scMOhaaImsOiKdaWVu4YOGLy5UbaygmoZsQgy5DdAey5F7TlnJWxT1Sz5MuKc/CBFRlKWguFf7xsod/6gyGo1lsWgu3MDkXKp4Bit8LrEeUtl6mvS5WmNCKDYsaU67peRwMCMHyrNZojlJwuhFC4kXLn2L2HCeInVs46ecamdmU/PliACDoDKpEDExLBAIyTjqvCL+2S7IjZYa8/pz+rjU7Zbunnlr9MqbmF4QrVNNK8U+z0TWhUHGsz2GZR2/fbfUuF9Ms8omNEQG7AJipDZeAEUZ95lP1Rdlz7/c7HTddxWylq63iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB9457.namprd12.prod.outlook.com (2603:10b6:610:27c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.17; Sat, 21 Feb 2026 01:07:06 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 01:07:06 +0000
Message-ID: <5f896265-8be7-4843-9ce6-8ebc5c121c8f@nvidia.com>
Date: Fri, 20 Feb 2026 17:06:56 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 29/33] gpu: nova-core: Hopper/Blackwell: add GSP
 lockdown release polling
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-30-jhubbard@nvidia.com>
 <DGHIKZW0M7DB.2JVQUP5C27J3Z@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGHIKZW0M7DB.2JVQUP5C27J3Z@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0050.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB9457:EE_
X-MS-Office365-Filtering-Correlation-Id: ce97d557-05ea-44db-9ea8-08de70e58784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tzl3VTdmc1NuMlB1bk1LWUh1RDFQYzc2WW1lNTRraEU4cTZMK0t0Z2FsNnhO?=
 =?utf-8?B?Mkh6UEo0SVhJVE9MTEpOREJ5eU9IMklsU0VUOUZXRzYyNjhpYWxsNFhtQ2Na?=
 =?utf-8?B?b2RMazEzNVB1cVVGeXNJREVQM08ydWNoRVc3dnhSOHA4WHZPK0dDNm5IZTdx?=
 =?utf-8?B?aDEvUzkySmFpdlFQL0VNWXVVVVJXZElFL1hBWndOS2djaENiZ085cSt3ellK?=
 =?utf-8?B?aTAxTWU4QmRJWEF6WFlDQXppSkFlbGM2SytYY1h0U2wyTUVwY0RHZGlXd3Uy?=
 =?utf-8?B?NDlSV3I4eFFSbnBieFFVZW5QMmFQWGhGVGdKcURvcVVBaDVCYkdWNjF1eGh5?=
 =?utf-8?B?Y0tkVy9zNCthTGZxTkYzZm5PaUpvK0M2Tkp3eXpqZnc2V3RNaXFkME80VEQx?=
 =?utf-8?B?VUxBT3NIekJuT3E3WjU0N09tTllFVytZbm4xZVM5Nzh1ckduVUFEY0x1WkpP?=
 =?utf-8?B?K0MrSGtzVkIrUEx4Vyt1cG1kYVJXZWtKd3dGL0k0NVZCcXhva0NiSElaS2g2?=
 =?utf-8?B?bGwzeHlkTVZoZ0N4RURuMkF3WHpEZkJVWWE0SFNWZEhjckNtVzRXbngrdERJ?=
 =?utf-8?B?eU1TS3NlWVFiSEQrQW9nall3cCt6QkJteWg5N3lvUnRFSEEvUFlGQ0RITDlY?=
 =?utf-8?B?WkUya1J6QkJjSUVwU2JjWnl5TlBLRW1uSlE2VkFmZWxlSWpWa0xYYTB3Q2Mr?=
 =?utf-8?B?bU04NkNoN1N1Q2ZBYXdqQVkyditJa1RweFNxamg5Vm5USFMrQUdKdGpRS2M5?=
 =?utf-8?B?WHR3MHRvMmF6SFRZNUtaTnFJZnJEWHcvOTM4a1BvR2V4dnUxSXBld1pnMjhU?=
 =?utf-8?B?ZVAwZXBhTXhaZlZxeFlMVnMxUUxkWC9TQ1plL0FJTDVWcmF3RGFJdHQ3RTlV?=
 =?utf-8?B?dFpZNENrNHRqaFBJZ3Q3T0xHMWc2MXlWbFN4Q095cDY4NWFncFBpRzJaWitW?=
 =?utf-8?B?cHBtOHpYNzE4RHQyM0hYWHdrU0hwYmZORjNONjAyWG52b1NCNkRrSCtqMGVB?=
 =?utf-8?B?a2t2SlBnemMzQ0phSERGNzJvMFFnQnhWL0l4SGhCRmovQUJwaWIvb1V5bXdM?=
 =?utf-8?B?aS9BTXh5OUd1OUVObzZNbUxmSnB0Vk1tWFgzL3ZCMlVNaUZZM1duMG1hQmI5?=
 =?utf-8?B?elZQc0xNWEtPc1hsNHFoZWVYOTNWWkh3NWpkNlhRcDRKRlhOYkdDRHRvT25Z?=
 =?utf-8?B?RUZPdHFvTCt5aURUTkZXVFRsZjdWcEd3b2cvcVkyWlBLUlVZQ2hZM01aaktZ?=
 =?utf-8?B?dEFkQTc5TVYwNXdPVDl1c09zWnhvNW00V285VEN2aHY0VDJOaHR2UEVpcHdz?=
 =?utf-8?B?Z2hGRWhnTXJkVkg2bUJwUkpkYWZDWE5DM2Y4R2FGRkRTc2Q2Y3pBalM4akRR?=
 =?utf-8?B?TFF2SUYyaFJmZE1DTjV4NjdFRll0Sy93OWYzS20rbVEvQTY2NGxQT1RDTVVM?=
 =?utf-8?B?U1dJbTAzVENSWDltbEZTZ21UTk53dFZtMXlBcE9ENTNwSEJnbFhweU94SWlC?=
 =?utf-8?B?K3h4RlFZak9ZZHVJNHZtcU81OER3bWh4ZmhTRlozUlZVOWg4cTZoemxDSWR1?=
 =?utf-8?B?STNaMG8xNTBNTWgyQS90MjcrZU5Tak5pY1F6Y1ZZb2NxWWRxZG9xUmpMN0R0?=
 =?utf-8?B?VTZpNTVJQVFueVZydkxsYXJTa08vR2lhT3FxVEVQUUhEWjZCWE11RFAwWDNv?=
 =?utf-8?B?UWl0dS9kQTdtazY0SlpIMVJTT2dmR1lIczFtQmVSWitzQVVaVGhOdDNFSXJM?=
 =?utf-8?B?NTJyUmNiOHNzTThKaGpJWnFiZ3p3SFpKM1FYZUdOU0xSZHhQUlNoVEx1Q0I0?=
 =?utf-8?B?OWZSR3J1MFpJWWhOV1dOUHpUNk9kZHVjWFFCSGQzck9mTXNxaEJwSXRJSGFB?=
 =?utf-8?B?Y2NXQ3k4SG9ET2tnSHVvWXFHR0RVQ3FaNHBYSXRsZ3IzL2g3VEROWkN5L2h3?=
 =?utf-8?B?V0RobFovM2RvZktFMjJGQXg3VTlLOFpCMkpjQWF6RmprSGY2UnA5NkJJQnds?=
 =?utf-8?B?ajZWYm9KOC85QWd6RFhub0QyNExVaU9Lb2tieWRUOGZwWUtSVnU5VHd4Z0do?=
 =?utf-8?B?akkzZ0t4YmFzdDdnamZKSEwyb2ozRHFZL1cxV2tKc3BROGtLSnlMNjlsVVZ3?=
 =?utf-8?Q?cm3k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUwxa2hnS05odHNtODVmNTVHQk5VeDRNcWxEbURHamtHb3RuZWVNeUttc3Iw?=
 =?utf-8?B?UHcydlNCL1NuTWtMTVE0cEhqVTRZdlVKRHNab2JUTGZiMHlKb29BcHFYNGtx?=
 =?utf-8?B?MXFDdE5PTmdXYTk0Q2F1ZWtkZHBYWS81S2lKZnBvbm5WaTB0K05CV29VQ2Iy?=
 =?utf-8?B?alMrOWY4Qkg3M3dKc1Y5RVNmR3ZueG9hME52R0ZTT3BpUTVmbTdiaURRVHps?=
 =?utf-8?B?TDhzbUtnc2lqQWp5Y0tSMHZOZGU5RGJ0dHRDb2gwRnV4UE5rVUNOVTBCNG5U?=
 =?utf-8?B?WFNYNXZucUZtcnZEZENUT2hFZnRrK0QrVXJNLzVGeXZOcm9xdDh4Q2ltTy8v?=
 =?utf-8?B?TWxaMmN2M0FaSW02R25XWFRZYWpDVVV6UkM4OGZxSHdrZWdQY3NhcG1SNUJS?=
 =?utf-8?B?dG8zMHdaeUwxaXlBMzZJdExwMEdqMS81cHlFWWZwbGpJLytwZUhiMnMrM3hk?=
 =?utf-8?B?K2xyamFKUDl6TThLU1ZTUzRqb0RZN24zMkJ6UlliNk01WDRZamU2RStXcE5r?=
 =?utf-8?B?S2d2cEF1amt5UTQzVC83K0VSYWJ0UHRDVzFkTVVXck82aXo3V3NkTi9nYmZ5?=
 =?utf-8?B?dXI4QmJJVi9GOElXQlNYUU50TFgvSG9sb1FmWlc5SnZoNEx1L0Y2eGdoRkZi?=
 =?utf-8?B?Y2pQVVA2R2dvdnF6Q1dFSnZoK1FucnpRWEVrbVlDcXJGTWg5Smt4cFlORFNQ?=
 =?utf-8?B?dHZmQStSQXlFbzhEemFBZzdwbjhxYXlXSXNtcWx5cFI0OG9YTGlxTGR3Wkpu?=
 =?utf-8?B?Q2lFSUlibGJXblRKaEpXcTcyMFVNWlRza0dRR25iLzlOeEt0SEtvTWsxVW9N?=
 =?utf-8?B?TVMzWmcvdDRDV2dha1FUZVRKcDUyRFRITDRGbGdpVG43aSszaW1nSkJXY3Fv?=
 =?utf-8?B?dHRWOHdLTDNWbGpzT2xFdG5GOEpocmVkT1YvaElOb3V2bEl4djBCT3MvSjRN?=
 =?utf-8?B?dDdMb1l2V2xCVWdKTk5KWUc2VldJaDRDUDNIeHJRNlBuUGVEa0ZXWkJvNmZv?=
 =?utf-8?B?amdVK1JPUlh6RzhIbkxOWWVQM0tDeUJjSnlkL1FJblFLUk1BUjVlb0I5blFQ?=
 =?utf-8?B?WEswV0RIMTdtSDNpZHRYdklqcmJNUG91R1JUWVlwekE3aklGVmRxNlRrZ1ZF?=
 =?utf-8?B?SVRuU3k1QUdKV3lWWWlwRnQzdis0TXF3SXdtbXczeDNTU1RybEYzWnd2QVBa?=
 =?utf-8?B?RGFWVkNFUEEyUll5dlQvblFuY2dOd29sQXNGcHBCTEptNDJ3L1JSRXlMUStT?=
 =?utf-8?B?T0xPOGxWUlkxSklZUk9td2pPcW5lTGpSaDBiL2FOVUxMRWZ1RWtEVlVCSEVD?=
 =?utf-8?B?cEdCd2RNYUZ4a21xdmRrNzBvekV5RGtBUlE0bU5QeTlTRjZJRzVRdVBkeTBo?=
 =?utf-8?B?Y1VJYkJjSFhqNVF0aVpQZStFQlR0UHNaeDB6R0JXRWUrSFYxMEVkdTE5K3o4?=
 =?utf-8?B?TGIyZnZpQldFOHBUdEU5QUIvODBlblpYTnBxT2FrRENlLzFKRWRtRy9PTWQr?=
 =?utf-8?B?TGhUZnY5bVBaT0hHUTkyZ0R5MWVqWGk3RjgxT21JOVVRMkRCOGorcnlkek9o?=
 =?utf-8?B?WkcyRUZqYUhJSUFLdXpTRld3OFhpVEtlZWk0ZUpaNDdmWHRVTEd4cTBQV3JB?=
 =?utf-8?B?L0drMU5FdDFxZ3lKdlN3dk44c3JhN2RwZW5UMHVKcjh5WGFYZzdNWXI0Tk1O?=
 =?utf-8?B?dUVkK0E4T0xQM3lxUktESW0vaUVrS3FpenQwQ2lDOEltNk9mUFhXL0NSZjlu?=
 =?utf-8?B?bkduQ3JJRjRQNldWaTBTN1I0SjRmUWZEMkE1ZmJWWlI1VFE2OXVQc3lLUisr?=
 =?utf-8?B?R3FwMlZVWFg4d3dIZ0NackJVSzdod3hTWTUrekNPVnFsVUx6UEJGeDFDUUxy?=
 =?utf-8?B?cktSM0hJMEwzWndXaDYrQng0cVh2TmtSWDk5a0hPM3N1d3FlN0dVYlErdDBM?=
 =?utf-8?B?TFgrVnRFbzlvZkRNR0ZZelN3UWpOK0IyeEJQKzUwWWdockVBZm5mQnpmY0E3?=
 =?utf-8?B?TDhwdUpMZW1GYnZLZ1pERVdwN1MxdHp0RkpuOVZTcXB4ekxmR1lRKy9kVnh3?=
 =?utf-8?B?Znk3a2ZsUGN4eC9ZZWpMUXVFMGRLa3FsQ1Fxdm5IdlRvUm56bzhkWWl2MDhu?=
 =?utf-8?B?VUV0UlZzb2pxZHlXdFYyVGN4MVdrSnFoVitHZlljVHFKK01vT1pKZkthcjJw?=
 =?utf-8?B?WThBQmE4Ukw0QVNwbjRQZnNLVkZxMDMrcVZqUStxOVc0Zjk4cUJLYk5LZ3hX?=
 =?utf-8?B?VXM1KzFwdnFpQllsVzlTZittWmlkdDZTcXdFWmxhOHJjR1R5VXZOaWpSekRs?=
 =?utf-8?B?UmtsZURCK2Zhays0czd4WUZYWWZiVFlWNnNPZ0ttMjRtZzZjdlYyUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce97d557-05ea-44db-9ea8-08de70e58784
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 01:07:05.9295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zou/mfge+XHO0VynwVribOAnhoM/hjEj6lmHLnYBC0TWbcOCqOR94FPWh3FWwSZXFtVT1sRtlvSoN+sYgLBKnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9457



On 2/17/26 12:20 PM, Danilo Krummrich wrote:
> On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
>> +    /// Check if GSP lockdown has been released after FSP Chain of Trust
>> +    fn gsp_lockdown_released(
>> +        dev: &device::Device,
>> +        gsp_falcon: &Falcon<Gsp>,
>> +        bar: &Bar0,
>> +        fmc_boot_params_addr: u64,
>> +        mbox0: &mut u32,
>> +    ) -> bool {
>> +        // Read GSP falcon mailbox0
>> +        *mbox0 = gsp_falcon.read_mailbox0(bar);
>> +
>> +        // Check 1: If mbox0 has 0xbadf4100 pattern, GSP is still locked down
>> +        if *mbox0 != 0 && (*mbox0 & 0xffffff00) == 0xbadf4100 {
>> +            return false;
>> +        }
> 
> Hm...we could create a tiny type wrapper around this value, and do the check
> with a method, such as Mbox::is_locked_down(&self).

OK, done in v5.

> 
>> +        // Check 2: If mbox0 has a value, check if it's an error
>> +        if *mbox0 != 0 {
>> +            let mbox1 = gsp_falcon.read_mailbox1(bar);
>> +
>> +            let combined_addr = (u64::from(mbox1) << 32) | u64::from(*mbox0);
> 
> This could also be part of the type.

Yes.

> 
>> +            if combined_addr != fmc_boot_params_addr {
>> +                // Address doesn't match - GSP wrote an error code
>> +                // Return TRUE (lockdown released) with error
>> +                dev_dbg!(
>> +                    dev,
>> +                    "GSP lockdown error: mbox0={:#x}, combined_addr={:#x}, expected={:#x}\n",
>> +                    *mbox0,
>> +                    combined_addr,
>> +                    fmc_boot_params_addr
>> +                );
>> +                return true;
>> +            }
>> +        }
>> +
>> +        // Check 3: Verify HWCFG2 RISCV_BR_PRIV_LOCKDOWN bit is clear
>> +        let hwcfg2 = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &crate::falcon::gsp::Gsp::ID);
>> +        !hwcfg2.riscv_br_priv_lockdown()
>> +    }

thanks,
-- 
John Hubbard

