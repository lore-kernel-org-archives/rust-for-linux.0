Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011055.outbound.protection.outlook.com [52.101.62.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA56346A19;
	Thu, 19 Feb 2026 15:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771515101; cv=fail; b=GFEYkQ57rIEXZeC5SM9YfNVYb/K5yC+o2PQ1Pkxe1n7mFj0Yw1Bnvp6M8NkLciOXpIBC8/a073ME5M+BOAs7sEVDrLjreLGZygZPG4OF+VQYBN9wDN9uhYE+ZdWoJEPGNEcZwxI6n1MTgy804lSVVNAYGOsaU49KXT10Lkwj/G4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771515101; c=relaxed/simple;
	bh=eRCT4DRn4JBbtfXQTBJeK3gkTll6/88n9a1shznJsI4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Message-ID:Date:
	 Content-Type:MIME-Version; b=VH7vkDBuun0mPtrW7ahBotrvI08CHffzNYeykvoz0w0fAKQ7QkgzDzEUgftpkd0a0jf+ZnSGgpXusIg35hiQ0mUVlPqyXgkpBYsUSPu23H6q4E5hjHk0wQ7AEc7uLF51KyLJmJeSkmoh+3QeFMSR/oS54WNGkWWMCs6xYHym/F8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cR7++woO; arc=fail smtp.client-ip=52.101.62.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cR7++woO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/t0x/RhvgkXIxmeOTKr7p1gv7ZatCYACFy5Znth9Gw7Rb48hGnm3MftTTO/CDhF0OZn81ksD4DB0STySkXE9pHumUxrr/e5bC39fOzLJNubCIIA/bOtB8Repe+srsH61G6eX6Lk9EyGcAe0Yk/yW0+9U7cEL64oFGJLjFBgrnGhRlfI6TbaCW+9EBIsqLhDa+/3nRfKKdbHmdQpIw6lcIY01NmJnUIqXsf3bIl+PkOfPKnyPjN4TRbEuIsQgj4hEMQBTJybYxD8fP3scYjPkKraXDHkqBZl5jSVEl5VYngbvLAtSRsZVhDzSkfxmfz6sM2hOoo58PUY6Qx16O5riA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRCT4DRn4JBbtfXQTBJeK3gkTll6/88n9a1shznJsI4=;
 b=gv+n1F6HG7WkXHTzxgfnswVuclWoQTIBGo9EKx+bmr4xthzbJHOU6h+lOAGTW8U5hTjAcJRZ7DhZmNxRSQv0hXB5XU6PhjNgqtwuWYYsyOHrKFoKpIVFzW/tZDEdmjkfj/Ujv7AyDiQ649PLeh1jjm4xtbbFGCL5T/5C6PmPd6eROZqDL6DfXBQ9Bvm4+8raWNi+QLJHQPq4e7fjffRUXVy1RUUVN1wHvdFvfXrBrAKthZX6n3rmC8PQA3HqX60aqsktacZUXMdjD3Sqs5aswgM5ZGtEMADR/+8CL1P86Sy3kg9zDMz0xdJVFYEtZfcHktxT+u4DIq1w0weCbKWFig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRCT4DRn4JBbtfXQTBJeK3gkTll6/88n9a1shznJsI4=;
 b=cR7++woO/NReeiopR8kpSMx0BFLoajV952Yx2pIjA1+KzuxOipn6B4UsrCDPfVFDG2K70WRI827mrvfE71gtnQxstP/bmfAWUgNYU8/hwgEeybbKISEiR2MPRaQBzcjSLtsqiTBH3lbETULkOqbKobVZWhW7G87xRhX6vi1B35nbTor60MdvXGk+lMO8bSEIs2NAekj2p46X+Kecv+uEziaBG3HdW03GB87SefqcEPagx2LrHYIWGrdDd1mebapWILTP7QAkIdF5f+Yd0kjlx+gEp9Jzc7mITByL1BAOB2qTdLsiH69H75Ws/JaxTMdNBz9SDYca7+/krQr2SmC0JA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SJ0PR12MB6989.namprd12.prod.outlook.com (2603:10b6:a03:448::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 15:31:35 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 15:31:35 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Dave Airlie <airlied@redhat.com>, Daniel Almeida <daniel.almeida@collabora.com>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>
Subject: Re: [PATCH v10 6/8] rust: gpu: Add GPU buddy allocator bindings
In-Reply-To: <CANiq72mH=sCfO8+HnVp=m219b3drWZbqUWE=NJn=M3y4ng3qXA@mail.gmail.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com> <20260218205507.689429-7-joelagnelf@nvidia.com> <DGIOJQC5HEAT.262OM2KS7C2HE@nvidia.com> <CANiq72mH=sCfO8+HnVp=m219b3drWZbqUWE=NJn=M3y4ng3qXA@mail.gmail.com>
Message-ID: <edb5bd481d43fecdc626256579caee41@nvidia.com>
Date: Thu, 19 Feb 2026 10:31:34 -0500
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:408:ee::16) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SJ0PR12MB6989:EE_
X-MS-Office365-Filtering-Correlation-Id: 9935aae0-bd50-4be1-9a98-08de6fcbf795
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ell5RlI3Q2lINzRiaEJSQ2ZJWXBNSG4vNVZqbzVUY25hNHZXVmd1K2pmWDkr?=
 =?utf-8?B?RkRDWjVBVlVYRS9GbUc0akt1NThJbHYxUmFHVWVQd0lhZHR3Umtna0pwR1Qy?=
 =?utf-8?B?K2NGVHQyQXM5K1ZHMjU1WjkzWDNnVmdlUklmbkRYTmFtNE1HYndDNnpYRGRJ?=
 =?utf-8?B?ZCt0eHFDdDNIRHYvTTR6SjgzOTl3NWxGbVRNeUdCK2hsYzBvMXU4SmpvRDFs?=
 =?utf-8?B?ODBnZm9IRHAvVytBcWg1NjhNV2owOFV3Y0RTQ2JxdXF1S1k0cHdEV1dqdERt?=
 =?utf-8?B?bHpwSUVJWG1ZZ1JBYmZjNjBDcm1ycXlBYU1tNkZiQ01WbldmNE1NVzEyYWxs?=
 =?utf-8?B?anJBWTBlZGhOT3Vwd1Nrb2NId3NSS1FhWklFc2JNeHp5UXJvNXdwS2ZxUzFH?=
 =?utf-8?B?c2RGakg0TTFYTFJHUlNweHc1M1lXV1JqZ2MzT0NVRTR5eW4yNmIzUisycFA3?=
 =?utf-8?B?MjhHQWowandaTnZ1RFhqdENhenBBZ3RZRlUyaytKK0dNVEpTSGs5ZXdITXZv?=
 =?utf-8?B?M2tOTTlnTndVeFF1ZGIwQVY5VWlGa0RCUWZQRi9jeExlV3JHUTNvV3Q3QWNo?=
 =?utf-8?B?UHozbWV4OHhvcTlFeTBxTXpuOUEzdGpVYWFzR1psNWlaYjRwWUQ3RlJ2Mkg2?=
 =?utf-8?B?L0N3dzZQTmhEYmprN3lNZzVQOGdrN0VpdUNpQzVma1k5L2VyckNJMWYrYUFz?=
 =?utf-8?B?dlZLNmJkbExBNUVDTE4wQUtJeElFQ3JBL0NSQk5nbmw5bGE0TndqWnVVTTRZ?=
 =?utf-8?B?Ull4bS9NcWQ5dHVyRFd2dWU5YzVGMElnL0lXR0tMcXhMM0Z4cy96bzU1clp2?=
 =?utf-8?B?K1p0YXdCcUI0VWJENVRUVEp0UWdzako2QW4vWVRmL3EwTlROdnYvWlh1UHYz?=
 =?utf-8?B?ZEJKUW9PVW53aTFybjZhVWpMbUJlTVk1VXlnK093OGxwOURzTTd5UEJqUkxa?=
 =?utf-8?B?WW03THQwMVVxVWcvNmFzZ1N0aEM4R1JaME1yRVpSVG9zY3QzTzA2cit0cGJ1?=
 =?utf-8?B?OHhBd3hWOUdva0xIY2txRW9Xd1hjeXNZNXcySSthMThGZFlsRHFmazZya0I0?=
 =?utf-8?B?VnROaWNzaTAvUWJKa25McVBmZGl3RzQ0N3AyUThDYjFiUGRRejh5b3U1blZI?=
 =?utf-8?B?RUZFY25pdmhjVy9iMGc0ODVvUlh3MzljVDh6NHRDZ212dVVxRlNGanVZMnpU?=
 =?utf-8?B?VGNQT0xxb3pEQU9jeE1qaUdqWGRlS3lqSUR2ZWhORjh2ZDRMNjZmWStFTGl4?=
 =?utf-8?B?aWphOTZPRTVXRFJRU2ljT08xQkl6cnhxOXpQOHppK2h5RzNhdkllRW9NQTc2?=
 =?utf-8?B?WGZPaEJ3REVvaWtYbU5oTkFaMFA2U0FQUFV1V00raEVJTUJXY2hjbkt0SnR3?=
 =?utf-8?B?QVlWY1dYcllQcjQwczE2RlJSUDBQQ3lKd05GQ2dXN2hUc25xSXU0dWF0M0ZU?=
 =?utf-8?B?QVhqNjREMENwcVdxWUNjcUhWb1ovQjFKSEFodEdLRHQ1L2ozZDZkZmVXNUp1?=
 =?utf-8?B?OHRGaEpKTVBlRXhIMlkvSVJWMVNjTnZ1d1RsVUlFOWc5aE9hQldaM3JLWDlj?=
 =?utf-8?B?MXV3aWo0Q2J2UnFZSjZZWk8rR2hsYU9ZSStEUWt0QkZzN2xOd3BqL3pNb21W?=
 =?utf-8?B?dXlXTTdCY0U3eXhwc0lZUDFxRkwrV0I0YTJoblQ5UnlPOFNvbXNuaGhFU3Y0?=
 =?utf-8?B?QTUwbVlBek1JZHJuV1E4VzA3Y1lkcDJlVXR6V3dzNnJjN1FCc1Z0aUtETmM5?=
 =?utf-8?B?L3BXVXM4eU5DQVMzSmxUeGtRc3RXZmdxL1hOQnNuSmhReThxM1hxdkxqS1Fo?=
 =?utf-8?B?b2N2Umg5MVp3YnFYRDJoWjZjbkJlRjAyK0ZlOWpUc2JJUlE5cDVSREsxT0dC?=
 =?utf-8?B?QXNqL2dtTzFQUGxOSkRCQllxSXBzSi9EWWxmdFd6cXVWN0drYm1MUm4zejlx?=
 =?utf-8?B?OW1YSWw3Z3k3cDNEbW84QXp3QnlvZDRNTzlRRXhoK0drcTFTem9GZGkyU09H?=
 =?utf-8?B?a1JybUlucVZvRnhGTnVscFBJNTZNUWxOaEhVSHd5WmcyY2txMUdteHFTdXBn?=
 =?utf-8?B?MWQrQjhYUnlwUkpvU1hCODZPMWRxeVNCcmwxbjlveFJQZjl2NU9URzYwc1Rs?=
 =?utf-8?Q?ksas=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3VpbkM0RktKWUY3VkFuaHB0bU5rR1VmT1RRMkhGdUtlNGkzV1VoSzlVSkFm?=
 =?utf-8?B?emlnSkZhQjByTG55Vmtqb1NpREg1bUtuVnJJQTdyVlJKVnU4MHd2Y1lEUWgw?=
 =?utf-8?B?Ui9BWDlCNVN1VFRoanM1Z3BDVlJDVEpnaW91WWFhUzVwczU0Qm1LSHBWaERN?=
 =?utf-8?B?ZEozTkhrMUUxMXRUdkFJaXZyczBneHpnZHZqbFgwMk90SUtVb1JocEVVdGxk?=
 =?utf-8?B?MDdIR2l3SHdIOXdMdUVUWU56cFh4S056b3M3M1JQTGlhZGt4UVdpcHZQOW0x?=
 =?utf-8?B?ZTgycWlEcDAyMjRuL214SU92cTJBb2x1SHpWZkZDMm5RMWJnL1drY0RRTUYv?=
 =?utf-8?B?OVdkakxCaFdBTi9oNjdYc2Y1Z05rR2VScEd1U1BvUGRQUTNBdGFqQkZkUFJo?=
 =?utf-8?B?bXEwd3pRbTBCc29udmR5ektkS0FMQk5PYk5VU3FFY1g4cnNJNEpTdTlMMlY1?=
 =?utf-8?B?SENmb0dMRVZhSjFld2VMZFpzZ1J4OENEalFFWEx1cW1EWlY3WXdVMDgzRFJj?=
 =?utf-8?B?TXdDK2hiaXFQVExYTlZrTXZCbUxsR1AyMWx4SDdzb1FoTHZiSHJqcTlnellH?=
 =?utf-8?B?TEhSbm5yZGFMWjN6RWNuWmpUVXhlZFJBZklDOVA0dlR3UW5mMExuQnJMaVkr?=
 =?utf-8?B?YXc5V25iSnpCV2VZZ01CclBZVnlienIzUnFkeG1EaHlUS0o1TnI2bkRObGF1?=
 =?utf-8?B?MjVLTEtCRFRuVVMvcDZjWW02ZVFWeGtsNHdhUG56TnJKTDBpdmtKaXlkRkxW?=
 =?utf-8?B?L3o0SFBpU2oxc21nTExESmt0YmVSekV1QVdJdFlPbjBLQ2JHMVE1dkRiZld6?=
 =?utf-8?B?MmwzMjZrR0JXRDlxSTlHQjkwbUpiUU9TeDZtR2I1OGh6VWdrbVlsd0ExelMv?=
 =?utf-8?B?b1YyUDQ1VVJGSVR6MTNIeGRuT09Gd1krUDVNUDl4Rm5xZkVWazhWRU1SZGhs?=
 =?utf-8?B?a2NTTTdUYkxSNXhwT3ppdDJMeHRKWnVPMWMzQ3pheElCUnh6TlpLYVpXUlNw?=
 =?utf-8?B?S2RiQm9qWjhkVUljUXMzbW9EQVV3aDdzVGo4aDdybEJQRkpxakZxR3FRNm1i?=
 =?utf-8?B?TWtJSzI5UDhISThXUXZOMjdMK2J0YStzTUlubWZNaDFFQUVEci9uMG1rdWVU?=
 =?utf-8?B?ZFNZb002QVRJUWNlYmY4ZHFOalRJaW1CTG1NdzVPYnNHZVJKdzdvZWFvNjlO?=
 =?utf-8?B?czZKcXpVaktQeFR1VGI0YWdsdmFqYVhBeFpkWjIwVW1JYS90VTN1VU56UVNU?=
 =?utf-8?B?eEZyeUk2cHBJc0VJd2ZWV3RxWTRFYm1nUzcvVDVlUThvUG1CVUxWY1lSL1Qv?=
 =?utf-8?B?TzVsai9SbCt5TWdkMDZEd3d5c1pSU1RIU1dVb296cmhpcXhHMm9Xdm1LKzhi?=
 =?utf-8?B?TGFDNEtlcHp2YmtpS3lBYURIcE1ZeFA3bVRGSjZwSlhWL3h6bFZLNXdMVy9B?=
 =?utf-8?B?dkRZYzdLazMvdEd2bE03dGxGS3JOS2gyRllaTzBtV1IxYWNzeVZraUxCYUNI?=
 =?utf-8?B?SXVXd01LTmZ5QzhraWpHUkdlL24rN0kvcTIxR1Y0b0h4MWZGK1JsRnBTRXpV?=
 =?utf-8?B?NFZ1OE5hVVFGUlVqWEw4VTVGZkxlNEVKSmhwTWxvUVNKL3JDbDEzSE1EQlN3?=
 =?utf-8?B?Z3NUckR1WG53bS8vaXgvYU9pSjl4SVB6eXFvU0s5a2RGZkxZOXAyakdHbWhS?=
 =?utf-8?B?OTdsdGRkSi9DSTNwc2F0ZXlhQmhhZmE3cVk5QWUvR3RTeUJwVGFISXlkVklS?=
 =?utf-8?B?NWExMjBBcDFVQ2o1SWdPZ1Y2b0k5SExWTG5uUGFEQXlETk1kL0JJWjNIL1Q3?=
 =?utf-8?B?RFBPVzFPNlFiVmJDMnFocHk0NGhMQWlldXlMV2EzcU1BU21vTUlwTUI0UTA5?=
 =?utf-8?B?ZTVDYXlya1RkZUV4eE1UUmRaNEYzVDBLMFBwMjRZVys2UE9DTDFLTHEvRGdV?=
 =?utf-8?B?aFZjbkFSVW55MllJc2l1WnV5SXVZWmt3ZnNXaUdFbE5kRE9RcUI2VHFYTTYv?=
 =?utf-8?B?SXpoR1haRlphNFlYOWpNdVo2WHdRK0l1WnQ1RXJObFo2WEhzdmNaQmtxVm42?=
 =?utf-8?B?QkVGRTRZN0pITXN5cWdiMGZNaDRqZjR4aGtPWjZDQVdENDlPSzVpb1RrMGd2?=
 =?utf-8?B?L2Z4Z0t3MnQ5OHFaY21vU0NZRGdYK1VSVklXRTF1QmwzUzhUZVJVajNlQUF2?=
 =?utf-8?B?RC9BODVwSm9iUFVKQXhILzZ6cDAvL0ZHMEtibm5kVHZ1YXBOV1ZlOS9IZThZ?=
 =?utf-8?B?L3pPYzQxMnZGTkprUjIvRjVOUzlId0hNcGNKK1N1RTNPY1pqYTZMcUd1cGFN?=
 =?utf-8?B?NkV4bW5VRnJROEtMRklZWnlCeU4wMFZXWlhyTktkRXBOYlFEZ3RiQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9935aae0-bd50-4be1-9a98-08de6fcbf795
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 15:31:35.7281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00VVPv7+K1j11bMUE0jFIAPl+PpUHwCgnLDYjcrYMAuGEMxn2jqDIzz6UUiPLcU60VOvRK6VpERZ2cNkbKjHPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6989

On Wed, Feb 19, 2026 at 09:54:27AM +0100, Miguel Ojeda wrote:
> If you all think something should be mentioned for practical reasons,
> then please don't let `rustdoc` force you to not mention it, i.e.
> please feel free to remove the square brackets if needed.
>
> In other words, I don't want the intra-doc links convention we have to
> make it harder for you to write certain things exceptionally.

Thanks Miguel, that's helpful! I've kept the GpuBuddyInner mention in
the invariants but removed the square brackets to avoid the rustdoc
warning while still providing the reference for readers.

Joel
