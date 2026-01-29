Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010012.outbound.protection.outlook.com [52.101.85.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9288153BE9;
	Thu, 29 Jan 2026 08:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769673658; cv=fail; b=SZtNFLFIomhO0AlBt3+xtCM4UIBGNXQofIOcu7SFXoPwd8D0CHhvQos7A5VNADIqZoMhPA9sNLXzR50vurqTGVY1ooJ4mzDnGMA8daNecDDCpAV4qutn3tIp760YVMaVFR+zmniGOwJjFPvj5oY+SLL61YMOSW6hVCS24Z1wKMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769673658; c=relaxed/simple;
	bh=TMMg6f77W3rlZnuu3NXXJ6yd7JBiBv9my24Im2wyHaw=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=WZe1CRZbrUwYB29hGiWs4qejVcmWpQO/VtT7GpUMJpklhoSVW4SAdFrfu+ZjOz2Du8V/qzZi2X07lwkqH524yUzMTqYeVk+io53fvZjUQdxaE9DXPdBCXc3vhq5ukhS3pcDkxo8gP9Jw3d4EoxUJid9gyPBxqXUxWxwvyf6xhbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H4ChUzIc; arc=fail smtp.client-ip=52.101.85.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H4ChUzIc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFTnNIWDJbgkVYyMRGR9FzrTIPbKa5b4T2va5onyChfvyGnkfIXDnlHjx+tyIhFkmMEOrINi4twxq1HzvcUoaSopAwP6HYHzM9T/5aH6yPT9ZxOeDjSoQ9Y8Gmt5JkJnRJy3LF57RpP/XaWo7hrFomptVFoSxwygQEQO9Mqtg2oZy36nB6fvW8P7wjX68x7JnxQfP9weEO7r0y5R+2O98Wer1igYSnYmayIevNhL0RN9mP1iH6gi8DthMzE1ZVQnark+6TtOXY+ZZH0wRkAi+CI9Og2aDh1gU1MKP7QBZFd9Cqtzcq8aCASWUPBdL41jRRguh+IRdXEf6Vgg+TGJMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/um2F7ghXOVBNmAEjC0uUHgipeYdvNgL6jdraf6vzA=;
 b=eOw0HbiAqHHbNZhnwuOKDfhc64tH32AJu16U3LqrHc2dtbvYSfrNKlK/lelJuQA7XjwqNOEqH4d9tNXO42Hr/bcY/HIxaDjop7Y2Jt+/5O0SZZlnqdAaK6oaW2jrcOyoeH86uVFTxC2L5sjKd4pfQUoLS9mEeawQr01NA8DZn/Iiz8qq+tC/Gdk2rfZz4b+Qqqz3bBRufyvkaQjYcHtZXoFeLjIk43HENG8mVooTLn5xMt6tz/jCuqC1lsgEMIGsHCugJNIPANOXBpdrrm4agzSs84c5PXIFoIqovz7e3gej7zHvLjmUAMmY1Oxp//SF2pU2f8KzHKW34qB9bg6zLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/um2F7ghXOVBNmAEjC0uUHgipeYdvNgL6jdraf6vzA=;
 b=H4ChUzIc82wSiTInenXGu7vlAzz41D2Eey97vD6hxKcxjyyKix6RX4jf/03JuP5BPhvtYMFOjyHavhlVT+fxDvKuTbUIWLd5P5KoJaR7JQQM/jM3xUGX79hNXmO3947Y/Jr660mGw1ZN4/mTyR0dBRC1BMay7B/LcE7DZ9dHf0w+xjy8Xf6WcPEUGjaceBrtu6YlL9/J06wNwkqOdpxX4hKtt99OXbhgK8TKuLwz1yX6GZSgLp06lNv0mVArRq7O8hF2IK4S8iw1k68T1POcrNZ4Ljah7Q+nFYcROIeX+AQ9+xHQ4fwbiAGkD8B67zc9E+RbQGT4U8L3EEAcZ+fTzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8918.namprd12.prod.outlook.com (2603:10b6:806:386::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 08:00:46 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 08:00:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 17:00:41 +0900
Message-Id: <DG0WY7S2QPQM.37S6PROC464QI@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 5/7] rust: io: add `register!` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
 <20260128-register-v4-5-aee3a33d9649@nvidia.com>
 <DG0CVJN57L5F.2I6J4RXMJOGQ@garyguo.net>
In-Reply-To: <DG0CVJN57L5F.2I6J4RXMJOGQ@garyguo.net>
X-ClientProxiedBy: TY4P301CA0076.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8918:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eaaa985-4e28-402e-b855-08de5f0c819f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|10070799003|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmpYM2gzTVR4Y205emhlVXpSYk1ma0FIaG10aEVVYVpFeFRoYlo5TnhNM1hj?=
 =?utf-8?B?NGhRZTlCc2k5eTZDbEI5MkVXbkFEdWxMNXdBSUwyV01hWjNnRUxJcEs3c2xN?=
 =?utf-8?B?UVRQSDFMdVdzVEthaExCWHdIYkdXNDFGU1BzU21xeE1wZisvQnk0ZHVlNTlD?=
 =?utf-8?B?bEVCRldDZjZhZDJtSVhvU2NuS3lQc0dsZUFibTkwNUFlbjJHaDhCUUNoNGVO?=
 =?utf-8?B?amhtNVQ5cFloaWhNbnJlZ28vT2Ztakp5RktKdkRSazE3YkVRZ3Y4RDZFaC9s?=
 =?utf-8?B?ZGJqdnBTdnV4WHY0S1hNV2pFNi81c2Y5YU92RmhSZ2N0QlJUa2hWMmY5Y3cv?=
 =?utf-8?B?a0thWnFLOXVPRWVPTkYvQ1NhMGdab3VicjE5aEE3OW9XQVNOTFlDOXp6ZWtk?=
 =?utf-8?B?alVDcERkdDhIdGVhK0xDY1RlWTQ4ZEcvVHNReUQxNU9GbHM4T1RFV2JLV3dn?=
 =?utf-8?B?dklmMXZiRDZHaWUwZENpbnpzT0hpMEwxaVF5dCtOTlF4bjZoTmhBZlRTY0pr?=
 =?utf-8?B?QTRIRmJLYWZGdXUvUDlCb1ZJalErSWorL0VQdkFMakpKeWF6SEhnWC9MSkFQ?=
 =?utf-8?B?QzJhaVZvK1d6YU1ja3ppZVhEQXR4M2JwcWJ5eWkwLzhXWGJIemUzS0tVWjNM?=
 =?utf-8?B?akpxNUZGMm5tckM0TjZ4ekZjWnA5NEYvOG1zVUFYVlg3VXVlblh6ZkppRngz?=
 =?utf-8?B?NDBFYXZERnkzUnUrUTZHeW5ZOXJaaGZ3b3ZWdHJjRGZmNEZtNHc4NlphL2FQ?=
 =?utf-8?B?VkxRRXROdUowR3RJenBGaWs4RVE1eGRzSEt4L0RRa0RWV1prdk93aVVQRjZE?=
 =?utf-8?B?dDhESDArSkF2NzM4L280azQ1TjBmTlJXUTNnY3ZiYnNDaEVlUE5VUW1oQktI?=
 =?utf-8?B?NVJnbFpFVE9qbTNqNlZvcHZnV3VpSE83L1FKT29aSlJRdFV6US9pNVRZR2Vl?=
 =?utf-8?B?ZnpyVEVEVGVsZnAreFROWDdSK0R5V0hWdVpyL1g4MEtzdEcwbm5WeERiV0p2?=
 =?utf-8?B?aFJXemQ0RjV2bGp3ZGNqTmlVLy9teHpSNlN5ZkprTmVMZ0Noc0FTQmE4Z1Yr?=
 =?utf-8?B?YjZ6YVdNZE1ITGltSnp1dGdCaVBoaldTSDQ4ZGNiZ0cyNkl1OGlQMmI2dlFw?=
 =?utf-8?B?c25XTjhNQ1lMei9kSmQ2SHZhd1lzeGEvM1RIcVV2N2trR25yQzZlZnRSOW5F?=
 =?utf-8?B?L2Z4ZG1jVVFWV2RhWTVQOXVpMTdOTVZOWHpkblFEbTBPNUZ0bXdTR1RDazNK?=
 =?utf-8?B?WVB3ZjZtZGIyWXp6cWVzY2FBV1RNaVo5RHdTZVM1ckV4dngyWFNyR29TSU1v?=
 =?utf-8?B?T3pQdGxXWlY5OXpiaGN6Uzc4MUc4T0JqMFE1ZlNNRnFmclBwNUlLUHZTUEoz?=
 =?utf-8?B?dWl5YUZPOFBMRWpwK3p5L1lBZ3hib3Z0RXY0RUJRVFlkVDhUNHBIcXZUcXNR?=
 =?utf-8?B?dHYvM2lOVG5Yc2psQ3daR3ZwN1BEcFRxR1MwZlVndkhEejRPL0IxbCtuOGJu?=
 =?utf-8?B?WFZzSm5iVnpxclM3bmg1cDVvc0JzZVowV3RoNG5KZzU1ejNucXJ6dkh5WHFD?=
 =?utf-8?B?YUJ3MUdUMldIR2NwaU04NURkaXF6TFJrQUNOSFdEZytGZSt5cW9zUFNHNExI?=
 =?utf-8?B?bDVwZmduU29yS0kxMVFNT25LeStXLzh5VytzVnZGeDhpQ1lod0M5MDdsNzJn?=
 =?utf-8?B?ODZDckRnQmkybXpwNUNFZTVsR2Fid3FHMjdIRzQ2cDVNVGNvK0RFK3Rhc1U2?=
 =?utf-8?B?ZDRsTDl0eVN6azRqbnl5NCtMZGw3d0lnZGREazgzU1RvNXd5V2R3VUxTQjZP?=
 =?utf-8?B?eVhLTGZ4cHNuZW52N1ZweEtSM3k2eGdsZFFPUE96aG4zL0pWNGpqNkRSWlZV?=
 =?utf-8?B?b0FXZUw1TkVROFc4SUw0TEtUQ09nbE1ORllGYkg3YU44UTM2SGsyMlJFMDJO?=
 =?utf-8?B?ckRrMGNHWGl0aGQyUGxPL0dYZE8rSk5IVFNER3ZNN1lUcGJQUGxaMTFEdktG?=
 =?utf-8?B?UHFqS0xXU2xYVnd1bjdET1FGbWtGSlkzVXhQS2ZYcXpFaEhQOXNnYm1wcCtD?=
 =?utf-8?B?cGNuZzRrMWdYNHlnSE1xcE0xZjRneERoUG5XUnd6NHdGZ2szVGd5M0srMmVM?=
 =?utf-8?Q?8GjU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(10070799003)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1E5TW1RWUp1SzNhTDJoSHBWZk4vWkM3anJmRjd3b0ZncGQ2UlpvZStIM2Fx?=
 =?utf-8?B?eW9XY05Ra0tLYmVNY2NZeGRXWlk0aGRibmZQblY4TGZrMWVnNi9iMEdNV1M2?=
 =?utf-8?B?ZjBmWnB4eC9DS3dTT0JuanV3c1kxSE00K2w2RTBrM1NXaGJzMi80MjU2RlVH?=
 =?utf-8?B?QTBuTENESU94TjJkaExqVUoybFBXK3Ztd0tJWExsdlU2MlJESDBTZmlNYWh6?=
 =?utf-8?B?V0cyTG9VV28xL1I0dU5PakRmRWRJdDExRFc2dHE3Y3drcU41Y0g1UitjZ1VH?=
 =?utf-8?B?VTRiTWFJKzlqeThJa1A4bG11bFFqOWZ0c2tZTHFyUVM1VzJ0WlFJb0FBT25J?=
 =?utf-8?B?RjJiaDV1NTlXSzdlTWJqRjlzaTduWlVkT2ZaTHhNTnVaTmxaUGlTNTdBT29X?=
 =?utf-8?B?WGV5WTJCZ2FibUJ0M3JjWG1PN0QwN0VweWdJV1IyYmVqaXU5ZGxSYVFOYldi?=
 =?utf-8?B?YlMwcVYwNDlGMUducFpBdzQ0aGpHbUVGRm1xSzF1SDgrckVtNHpoSFlzV3kw?=
 =?utf-8?B?OXV4cVRFM2lkUjZVdkIyTk9KUTRFaEhwQWFyS3FFYmV4Y3ZJZG9aQkNZb3kx?=
 =?utf-8?B?a3YwemZCWEpJOERSWkJRSGJBeVpHdC9WMDRLSzZNYzd1OFNsTmFzcHBydHlw?=
 =?utf-8?B?dG9YMHgzdUxFVnMwL1RpcjR5QWFxaTZBWFZkN1ozSlA4bVBaZmMrSkJ2N3pN?=
 =?utf-8?B?citHVjFVRy9pNmx4U3JaY0lDajFTQ2dlRCtpb3RLL1I4NU5wSk1tOG9RU3cy?=
 =?utf-8?B?R045bXo3N1hLdmYyZ0JNMldvMjlMVkl2bDVERGxRYkZtRGpvQnNQeVFpWWVa?=
 =?utf-8?B?YkdhbEpicmhrV2NrbmxsZzJuMG1WV3BoWXNneTJjTys5TEZuNUtBd0hQOGsz?=
 =?utf-8?B?b2dJaUVTK0JybWxLaFlGZGdhQWNnRExlZWE1WDkyQ2RzWHRFQ0I3T1pNWm5W?=
 =?utf-8?B?YkZuU0ZmZzJOU3BmeE9tMUM4Q0w0QjFzQ0Y3V21oeVNZWUsrSU5CUzNOcHBj?=
 =?utf-8?B?TFFCZ2lxcUtKcmZibERIUnkwaDExd003S1RoNmZod1pRRHhtNmNoUCtXYk5J?=
 =?utf-8?B?aFZiUCs3ZHFJUUppeXFLczNrVlVoV3Q5Y0xDWm10ejV0dUpQalVSbE5xYU5E?=
 =?utf-8?B?YnlCL0JnbE9PK0l6MlRnazVRbGdodE1yMHR0d1dLQkNHUEVZWWdwRWRoQk9h?=
 =?utf-8?B?ZVVIZlFwV3NzZEtoZ1NQS0ZjNUl6Z2tvMklHdndGRjBlZjRuQTZDVEZ1ZjFM?=
 =?utf-8?B?VFJQN1EyMkl2ekVTYXo0VGZiMzJ0bnErUVlFV1A5SHdlUWZJQVVDL1pGSyt2?=
 =?utf-8?B?NGZWUjhlY2E0Z01WdWRHTHFvZGw2cnFzMFMvN01IeGpLcDYwN21WTXBWSUdB?=
 =?utf-8?B?b0lyYlMvVkpEUGtKNW1RSi8rYm9jdEJzOHNJQm16TG8vaGpCWEthSENGWTlO?=
 =?utf-8?B?ZHBjQ1dFTUVDQVlNc3kxNXN2U2xFTDVjWXo4bjI4d3kxeGhqT1kzazNncUlG?=
 =?utf-8?B?MEsvME41eFJzZWVUdk1jT2VtTG8wS1lZV0lma2JRRUg3Y2M5ZkREcHcvcndx?=
 =?utf-8?B?ZVlLd2QrcjhtV2lTL3lWT2V6WHFmREdLTGVqMUlHK0xnSUJsQWxBSFZvYXNn?=
 =?utf-8?B?bEVveDlBYTB1ck1EY2RsSkpRb253N0VQNTgremNoNDlXUGx1cmZVaStacFJI?=
 =?utf-8?B?b0k3dVN5bGQ4QUx0NWVnR0wvbEthRVhYdmZRcXNBaEhCWEV6b2RuM0VGWXNN?=
 =?utf-8?B?ZU9wY1hWMTlMMC8rMko4cGg5VDIweUpSV1dtejNsMENSbktBVkdKWEhtNDlS?=
 =?utf-8?B?bnBTa2pOQlhOSE1jdXo4SmVINTdWcWVOLzhsVmdOcEZ2U0ZzSUFsWW5oNXNC?=
 =?utf-8?B?dVVGaUxwOGNXa2cvU0xPdnFZR3NPZDdNa0oxUUN1eEc1L1RlMlQ5Y2lvQnBm?=
 =?utf-8?B?L1N4Zm5BZVRNVFB6bTJnR2oyQzc3WC9IaC9NbjhBd2VTRnp6WDZ2WnlOejA2?=
 =?utf-8?B?dTZtL1BWRnhNSjMrM1BRK01oNkx1cXRlNTZmVVFoR1BWTkxROUpMTDhRZ2o2?=
 =?utf-8?B?UFh1MlFLQjM0MmVqR2w0bkd1cHR4MGtkeUpOUEZwU0k5STduNFZlQmV2OERK?=
 =?utf-8?B?eXAxS3h5VGpzRkUzN3lmbjNiUVVuTzJwT3ZKL0I5ZnVDM1VHSTYrSW82Nkc1?=
 =?utf-8?B?dVg1K0Y0U0t3SnI5eEh0RUdaM0ZKTUZqdzZnRUxtcXRqTElaRGdwWVNnZHZC?=
 =?utf-8?B?d0M3MGV3MUZseG9tMHVhYXdLZzFmclQxMFVuejY4OUhTZWlFRlY0MnZRSENB?=
 =?utf-8?B?UHFGcFluejZJYUdVREhBTWl4SGh1bTBYUkNnSVFQTUdDclF3TXUrTmhlZkhD?=
 =?utf-8?Q?qxaY5JWWJdgDodA0SorL4E2CYpCRbFKvlCNzXb/WCfPKp?=
X-MS-Exchange-AntiSpam-MessageData-1: eFwlSluiw4ofGQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eaaa985-4e28-402e-b855-08de5f0c819f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 08:00:45.6218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w8gRI5NESzupSbj/Gn8sjaKMcILaO2I/a/GyCmBHzt/Arlmbbla/GZiLqc7Qsrd7wDWAqL5s/mdxo5DfZiHdiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8918

On Thu Jan 29, 2026 at 1:16 AM JST, Gary Guo wrote:
> On Wed Jan 28, 2026 at 2:37 AM GMT, Alexandre Courbot wrote:
>> Add a macro for defining hardware register types with I/O accessors.
>>
>> Each register field is represented as a `Bounded` of the appropriate bit
>> width, ensuring field values are never silently truncated.
>>
>> Fields can optionally be converted to/from custom types, either fallibly
>> or infallibly.
>>
>> The address of registers can be direct, relative, or indexed, supporting
>> most of the patterns in which registers are arranged.
>>
>> Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  rust/kernel/io.rs          |    1 +
>>  rust/kernel/io/register.rs | 1287 +++++++++++++++++++++++++++++++++++++=
+++++++
>>  2 files changed, 1288 insertions(+)
>>
>> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
>> index 056a3ec71647..112f43ecbf88 100644
>> --- a/rust/kernel/io.rs
>> +++ b/rust/kernel/io.rs
>> @@ -11,6 +11,7 @@
>> =20
>>  pub mod mem;
>>  pub mod poll;
>> +pub mod register;
>>  pub mod resource;
>> =20
>>  pub use resource::Resource;
>> diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
>> new file mode 100644
>> index 000000000000..fc85dcd1f09a
>> --- /dev/null
>> +++ b/rust/kernel/io/register.rs
>> @@ -0,0 +1,1287 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! A macro to define register layout and accessors.
>> +//!
>> +//! A single register typically includes several fields, which are acce=
ssed through a combination
>> +//! of bit-shift and mask operations that introduce a class of potentia=
l mistakes, notably because
>> +//! not all possible field values are necessarily valid.
>> +//!
>> +//! The [`register!`] macro in this module provides an intuitive and re=
adable syntax for defining a
>> +//! dedicated type for each register. Each such type comes with its own=
 field accessors that can
>> +//! return an error if a field's value is invalid.
>> +//!
>> +//! [`register!`]: kernel::register!
>> +
>> +use core::ops::Deref;
>> +
>> +use crate::io::{
>> +    IoCapable,
>> +    IoKnownSize, //
>> +};
>> +
>> +/// Trait providing a base address to be added to the offset of a relat=
ive register to obtain
>> +/// its actual offset.
>> +///
>> +/// The `T` generic argument is used to distinguish which base to use, =
in case a type provides
>> +/// several bases. It is given to the `register!` macro to restrict the=
 use of the register to
>> +/// implementors of this particular variant.
>> +pub trait RegisterBase<T> {
>> +    /// Base address to which register offsets are added.
>> +    const BASE: usize;
>> +}
>> +
>> +/// Trait providing I/O read/write operations for register storage type=
s.
>> +///
>> +/// This trait is implemented for all integer types on which I/O can be=
 performed, allowing the
>> +/// `register!` macro to generate appropriate I/O accessor methods base=
d on the register's storage
>> +/// type.
>> +pub trait RegisterIo: Sized {
>
> Is this trait intended for public usage or just internal detail of `regis=
ter!()`
> macro?
>
> If it's the former, then we should probably just put the method into `IoC=
apable`
> and allow generic-read in Io. If it's the latter, let's `#[doc(hidden)]` =
this so
> it won't get abused.

It is an internal detail of `register!()` and not supposed to be used by an=
yone
else.

>
>> +    /// Read a value from the given offset in the I/O region.
>> +    fn read<T, I>(io: &T, offset: usize) -> Self
>> +    where
>> +        T: Deref<Target =3D I>,
>> +        I: IoKnownSize + IoCapable<Self>;
>
> I think generally `Deref` bound shouldn't be exposed to user. What smart
> pointers are involved here, and can we implement forwarding impls of `Io`=
?

Removing the requirement for `Deref` in the `RegisterIo` trait is simple - =
we
can just call `Deref` in the register IO accessors.

But I suspect you mean that we should also remove it from the register
accessors themselves? The problem if I remove it there is that things like
Nova's `Bar0` do not implement `IoKnownSize` and `IoCapable` (but rather de=
ref
to something that does), which would require all callers to do the deref op
itself as deref coercion doesn't seem to be usable here.

>
>> +
>> +    /// Write a value to the given offset in the I/O region.
>> +    fn write<T, I>(self, io: &T, offset: usize)
>> +    where
>> +        T: Deref<Target =3D I>,
>> +        I: IoKnownSize + IoCapable<Self>;
>> +}
>> +
>> +impl RegisterIo for u8 {
>> +    #[inline(always)]
>> +    fn read<T, I>(io: &T, offset: usize) -> Self
>> +    where
>> +        T: Deref<Target =3D I>,
>> +        I: IoKnownSize + IoCapable<Self>,
>> +    {
>> +        io.read8(offset)
>> +    }
>> +
>> +    #[inline(always)]
>> +    fn write<T, I>(self, io: &T, offset: usize)
>> +    where
>> +        T: Deref<Target =3D I>,
>> +        I: IoKnownSize + IoCapable<Self>,
>> +    {
>> +        io.write8(self, offset)
>> +    }
>> +}
>> +
>> +impl RegisterIo for u16 {
>> +    #[inline(always)]
>> +    fn read<T, I>(io: &T, offset: usize) -> Self
>> +    where
>> +        T: Deref<Target =3D I>,
>> +        I: IoKnownSize + IoCapable<Self>,
>> +    {
>> +        io.read16(offset)
>> +    }
>> +
>> +    #[inline(always)]
>> +    fn write<T, I>(self, io: &T, offset: usize)
>> +    where
>> +        T: Deref<Target =3D I>,
>> +        I: IoKnownSize + IoCapable<Self>,
>> +    {
>> +        io.write16(self, offset)
>> +    }
>> +}
>> +
>> +impl RegisterIo for u32 {
>> +    #[inline(always)]
>> +    fn read<T, I>(io: &T, offset: usize) -> Self
>> +    where
>> +        T: Deref<Target =3D I>,
>> +        I: IoKnownSize + IoCapable<Self>,
>> +    {
>> +        io.read32(offset)
>> +    }
>> +
>> +    #[inline(always)]
>> +    fn write<T, I>(self, io: &T, offset: usize)
>> +    where
>> +        T: Deref<Target =3D I>,
>> +        I: IoKnownSize + IoCapable<Self>,
>> +    {
>> +        io.write32(self, offset)
>> +    }
>> +}
>> +
>> +#[cfg(CONFIG_64BIT)]
>
> This cfg should be removed.

Done.

>
>> +impl RegisterIo for u64 {
>> +    #[inline(always)]
>> +    fn read<T, I>(io: &T, offset: usize) -> Self
>> +    where
>> +        T: Deref<Target =3D I>,
>> +        I: IoKnownSize + IoCapable<Self>,
>> +    {
>> +        io.read64(offset)
>> +    }
>> +
>> +    #[inline(always)]
>> +    fn write<T, I>(self, io: &T, offset: usize)
>> +    where
>> +        T: Deref<Target =3D I>,
>> +        I: IoKnownSize + IoCapable<Self>,
>> +    {
>> +        io.write64(self, offset)
>> +    }
>> +}
>> +
>> +/// Defines a dedicated type for a register, including getter and sette=
r methods for its fields and
>> +/// methods to read and write it from an [`Io`] region.
>> +///
>> +/// Example:
>> +///
>> +/// ```
>> +/// use kernel::register;
>> +///
>> +/// register! {
>> +///     /// Basic information about the chip.
>> +///     pub BOOT_0(u32) @ 0x00000100 {
>> +///         /// Vendor ID.
>> +///         15:8 vendor_id;
>> +///         /// Major revision of the chip.
>> +///         7:4 major_revision;
>> +///         /// Minor revision of the chip.
>> +///         3:0 minor_revision;
>> +///     }
>> +/// }
>> +/// ```
>> +///
>> +/// This defines a `BOOT_0` type which can be read from or written to o=
ffset `0x100` of an `Io`
>> +/// region. For instance, `minor_revision` consists of the 4 least sign=
ificant bits of the
>> +/// register.
>> +///
>> +/// Fields are instances of [`Bounded`](kernel::num::Bounded) and can b=
e read by calling their
>> +/// getter method, which is named after them. They also have setter met=
hods prefixed with `set_`
>> +/// for runtime values and `with_` for constant values. All setters ret=
urn the updated register
>> +/// value.
>> +///
>> +/// ```no_run
>> +/// use kernel::register;
>> +/// use kernel::num::Bounded;
>> +///
>> +/// # register! {
>> +/// #     pub BOOT_0(u32) @ 0x00000100 {
>> +/// #         15:8 vendor_id;
>> +/// #         7:4 major_revision;
>> +/// #         3:0 minor_revision;
>> +/// #     }
>> +/// # }
>> +/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>(=
bar: &T) {
>> +/// # fn obtain_vendor_id() -> u8 { 0xff }
>> +/// // Read from the register's defined offset (0x100).
>> +/// let boot0 =3D BOOT_0::read(&bar);
>> +/// pr_info!("chip revision: {}.{}", boot0.major_revision().get(), boot=
0.minor_revision().get());
>> +///
>> +/// // Update some fields and write the new value back.
>> +/// boot0
>> +///     // Constant values.
>> +///     .with_major_revision::<3>()
>> +///     .with_minor_revision::<10>()
>> +///     // Run-time value.
>> +///     .set_vendor_id(obtain_vendor_id())
>> +///     .write(&bar);
>> +///
>> +/// // Or, just read and update the register in a single step.
>> +/// BOOT_0::update(&bar, |r| r
>> +///     .with_major_revision::<3>()
>> +///     .with_minor_revision::<10>()
>> +///     .set_vendor_id(obtain_vendor_id())
>> +/// );
>> +///
>> +/// // Constant values can also be built using the const setters.
>> +/// const V: BOOT_0 =3D BOOT_0::zeroed()
>> +///     .with_major_revision::<3>()
>> +///     .with_minor_revision::<10>();
>> +/// # }
>> +/// ```
>> +///
>> +/// Fields can also be transparently converted from/to an arbitrary typ=
e by using the bitfield `=3D>`
>> +/// and `?=3D>` syntaxes.
>> +///
>> +/// If present, doccomments above register or fields definitions are ad=
ded to the relevant item
>> +/// they document (the register type itself, or the field's setter and =
getter methods).
>> +///
>> +/// Note that multiple registers can be defined in a single `register!`=
 invocation. This can be
>> +/// useful to group related registers together.
>> +///
>> +/// ```
>> +/// use kernel::register;
>> +///
>> +/// register! {
>> +///     pub BOOT_0(u8) @ 0x00000100 {
>> +///         7:4 major_revision;
>> +///         3:0 minor_revision;
>> +///     }
>> +///
>> +///     pub BOOT_1(u8) @ 0x00000101 {
>> +///         7:5 num_threads;
>> +///         4:0 num_cores;
>> +///     }
>> +/// };
>> +/// ```
>> +///
>> +/// It is possible to create an alias of an existing register with new =
field definitions by using
>> +/// the `=3D> ALIAS` syntax. This is useful for cases where a register'=
s interpretation depends on
>> +/// the context:
>> +///
>> +/// ```
>> +/// use kernel::register;
>> +///
>> +/// register! {
>> +///     /// Scratch register.
>> +///     pub SCRATCH(u32) @ 0x00000200 {
>> +///         /// Raw value.
>> +///         31:0 value;
>> +///     }
>> +///
>> +///     /// Boot status of the firmware.
>> +///     pub SCRATCH_BOOT_STATUS(u32) =3D> SCRATCH {
>> +///         /// Whether the firmware has completed booting.
>> +///         0:0 completed;
>> +///     }
>> +/// }
>> +/// ```
>> +///
>> +/// In this example, `SCRATCH_BOOT_STATUS` uses the same I/O address as=
 `SCRATCH`, while also
>> +/// providing its own `completed` field.
>> +///
>> +/// ## Relative registers
>> +///
>> +/// A register can be defined as being accessible from a fixed offset o=
f a provided base. For
>> +/// instance, imagine the following I/O space:
>> +///
>> +/// ```text
>> +///           +-----------------------------+
>> +///           |             ...             |
>> +///           |                             |
>> +///  0x100--->+------------CPU0-------------+
>> +///           |                             |
>> +///  0x110--->+-----------------------------+
>> +///           |           CPU_CTL           |
>> +///           +-----------------------------+
>> +///           |             ...             |
>> +///           |                             |
>> +///           |                             |
>> +///  0x200--->+------------CPU1-------------+
>> +///           |                             |
>> +///  0x210--->+-----------------------------+
>> +///           |           CPU_CTL           |
>> +///           +-----------------------------+
>> +///           |             ...             |
>> +///           +-----------------------------+
>> +/// ```
>> +///
>> +/// `CPU0` and `CPU1` both have a `CPU_CTL` register that starts at off=
set `0x10` of their I/O
>> +/// space segment. Since both instances of `CPU_CTL` share the same lay=
out, we don't want to define
>> +/// them twice and would prefer a way to select which one to use from a=
 single definition
>> +///
>> +/// This can be done using the `Base + Offset` syntax when specifying t=
he register's address.
>> +///
>> +/// `Base` is an arbitrary type (typically a ZST) to be used as a gener=
ic parameter of the
>> +/// [`RegisterBase`] trait to provide the base as a constant, i.e. each=
 type providing a base for
>> +/// this register needs to implement `RegisterBase<Base>`. Here is the =
above example translated
>> +/// into code:
>> +///
>> +/// ```no_run
>> +/// use kernel::register;
>> +/// use kernel::io::register::RegisterBase;
>> +///
>> +/// // Type used to identify the base.
>> +/// pub struct CpuCtlBase;
>> +///
>> +/// // ZST describing `CPU0`.
>> +/// struct Cpu0;
>> +/// impl RegisterBase<CpuCtlBase> for Cpu0 {
>> +///     const BASE: usize =3D 0x100;
>> +/// }
>> +/// // Singleton of `CPU0` used to identify it.
>> +/// const CPU0: Cpu0 =3D Cpu0;
>> +///
>> +/// // ZST describing `CPU1`.
>> +/// struct Cpu1;
>> +/// impl RegisterBase<CpuCtlBase> for Cpu1 {
>> +///     const BASE: usize =3D 0x200;
>> +/// }
>> +/// // Singleton of `CPU1` used to identify it.
>> +/// const CPU1: Cpu1 =3D Cpu1;
>> +///
>> +/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>(=
bar: &T) {
>> +/// // This makes `CPU_CTL` accessible from all implementors of `Regist=
erBase<CpuCtlBase>`.
>> +/// register! {
>> +///     /// CPU core control.
>> +///     pub CPU_CTL(u32) @ CpuCtlBase + 0x10 {
>> +///         /// Start the CPU core.
>> +///         0:0 start;
>> +///     }
>> +/// }
>> +///
>> +/// // The `read`, `write` and `update` methods of relative registers t=
ake an extra `base` argument
>> +/// // that is used to resolve its final address by adding its `BASE` t=
o the offset of the
>> +/// // register.
>> +///
>> +/// // Start `CPU0`.
>> +/// CPU_CTL::update(&bar, &CPU0, |r| r.set_start(true));
>> +///
>> +/// // Start `CPU1`.
>> +/// CPU_CTL::update(&bar, &CPU1, |r| r.set_start(true));
>> +///
>> +/// // Aliases can also be defined for relative register.
>> +/// register! {
>> +///     /// Alias to CPU core control.
>> +///     pub CPU_CTL_ALIAS(u32) =3D> CpuCtlBase + CPU_CTL {
>> +///         /// Start the aliased CPU core.
>> +///         1:1 alias_start;
>> +///     }
>> +/// }
>> +///
>> +/// // Start the aliased `CPU0`.
>> +/// CPU_CTL_ALIAS::update(&bar, &CPU0, |r| r.set_alias_start(true));
>> +/// # }
>> +/// ```
>> +///
>> +/// ## Arrays of registers
>> +///
>> +/// Some I/O areas contain consecutive registers that can be interprete=
d in the same way. These
>> +/// areas can be defined as an array of identical registers, allowing t=
hem to be accessed by index
>> +/// with compile-time or runtime bound checking. Simply specify their s=
ize inside `[` and `]`
>> +/// brackets, and add an `idx` parameter to their `read`, `write` and `=
update` methods:
>> +///
>> +/// ```no_run
>> +/// use kernel::register;
>> +///
>> +/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>(=
bar: &T)
>> +/// #     -> Result<(), Error>{
>> +/// # fn get_scratch_idx() -> usize {
>> +/// #   0x15
>> +/// # }
>> +/// // Array of 64 consecutive registers with the same layout starting =
at offset `0x80`.
>> +/// register! {
>> +///     /// Scratch registers.
>> +///     pub SCRATCH(u32)[64] @ 0x00000080 {
>> +///         31:0 value;
>> +///     }
>> +/// }
>> +///
>> +/// // Read scratch register 0, i.e. I/O address `0x80`.
>> +/// let scratch_0 =3D SCRATCH::read(&bar, 0).value();
>> +/// // Read scratch register 15, i.e. I/O address `0x80 + (15 * 4)`.
>> +/// let scratch_15 =3D SCRATCH::read(&bar, 15).value();
>> +///
>> +/// // This is out of bounds and won't build.
>> +/// // let scratch_128 =3D SCRATCH::read(&bar, 128).value();
>> +///
>> +/// // Runtime-obtained array index.
>> +/// let scratch_idx =3D get_scratch_idx();
>> +/// // Access on a runtime index returns an error if it is out-of-bound=
s.
>> +/// let some_scratch =3D SCRATCH::try_read(&bar, scratch_idx)?.value();
>> +///
>> +/// // Alias to a particular register in an array.
>> +/// // Here `SCRATCH[8]` is used to convey the firmware exit code.
>> +/// register! {
>> +///     /// Firmware exit status code.
>> +///     pub FIRMWARE_STATUS(u32) =3D> SCRATCH[8] {
>> +///         7:0 status;
>> +///     }
>> +/// }
>> +/// let status =3D FIRMWARE_STATUS::read(&bar).status();
>> +///
>> +/// // Non-contiguous register arrays can be defined by adding a stride=
 parameter.
>> +/// // Here, each of the 16 registers of the array are separated by 8 b=
ytes, meaning that the
>> +/// // registers of the two declarations below are interleaved.
>> +/// register! {
>> +///     /// Scratch registers bank 0.
>> +///     pub SCRATCH_INTERLEAVED_0(u32)[16 ; 8] @ 0x000000c0 {
>> +///         31:0 value;
>> +///     }
>> +///
>> +///     /// Scratch registers bank 1.
>> +///     pub SCRATCH_INTERLEAVED_1(u32)[16 ; 8] @ 0x000000c4 {
>> +///         31:0 value;
>> +///     }
>> +/// }
>> +/// # Ok(())
>> +/// # }
>> +/// ```
>> +///
>> +/// ## Relative arrays of registers
>> +///
>> +/// Combining the two features described in the sections above, arrays =
of registers accessible from
>> +/// a base can also be defined:
>> +///
>> +/// ```no_run
>> +/// use kernel::register;
>> +/// use kernel::io::register::RegisterBase;
>> +///
>> +/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>(=
bar: &T)
>> +/// #     -> Result<(), Error>{
>> +/// # fn get_scratch_idx() -> usize {
>> +/// #   0x15
>> +/// # }
>> +/// // Type used as parameter of `RegisterBase` to specify the base.
>> +/// pub struct CpuCtlBase;
>> +///
>> +/// // ZST describing `CPU0`.
>> +/// struct Cpu0;
>> +/// impl RegisterBase<CpuCtlBase> for Cpu0 {
>> +///     const BASE: usize =3D 0x100;
>> +/// }
>> +/// // Singleton of `CPU0` used to identify it.
>> +/// const CPU0: Cpu0 =3D Cpu0;
>> +///
>> +/// // ZST describing `CPU1`.
>> +/// struct Cpu1;
>> +/// impl RegisterBase<CpuCtlBase> for Cpu1 {
>> +///     const BASE: usize =3D 0x200;
>> +/// }
>> +/// // Singleton of `CPU1` used to identify it.
>> +/// const CPU1: Cpu1 =3D Cpu1;
>> +///
>> +/// // 64 per-cpu scratch registers, arranged as a contiguous array.
>> +/// register! {
>> +///     /// Per-CPU scratch registers.
>> +///     pub CPU_SCRATCH(u32)[64] @ CpuCtlBase + 0x00000080 {
>> +///         31:0 value;
>> +///     }
>> +/// }
>> +///
>> +/// let cpu0_scratch_0 =3D CPU_SCRATCH::read(&bar, &Cpu0, 0).value();
>> +/// let cpu1_scratch_15 =3D CPU_SCRATCH::read(&bar, &Cpu1, 15).value();
>> +///
>> +/// // This won't build.
>> +/// // let cpu0_scratch_128 =3D CPU_SCRATCH::read(&bar, &Cpu0, 128).val=
ue();
>> +///
>> +/// // Runtime-obtained array index.
>> +/// let scratch_idx =3D get_scratch_idx();
>> +/// // Access on a runtime value returns an error if it is out-of-bound=
s.
>> +/// let cpu0_some_scratch =3D CPU_SCRATCH::try_read(&bar, &Cpu0, scratc=
h_idx)?.value();
>> +///
>> +/// // `SCRATCH[8]` is used to convey the firmware exit code.
>> +/// register! {
>> +///     /// Per-CPU firmware exit status code.
>> +///     pub CPU_FIRMWARE_STATUS(u32) =3D> CpuCtlBase + CPU_SCRATCH[8] {
>> +///         7:0 status;
>> +///     }
>> +/// }
>> +/// let cpu0_status =3D CPU_FIRMWARE_STATUS::read(&bar, &Cpu0).status()=
;
>> +///
>> +/// // Non-contiguous register arrays can be defined by adding a stride=
 parameter.
>> +/// // Here, each of the 16 registers of the array are separated by 8 b=
ytes, meaning that the
>> +/// // registers of the two declarations below are interleaved.
>> +/// register! {
>> +///     /// Scratch registers bank 0.
>> +///     pub CPU_SCRATCH_INTERLEAVED_0(u32)[16 ; 8] @ CpuCtlBase + 0x000=
00d00 {
>
> I discussed this with Alex off-list and we agree that this'll better be
>
>     pub CPU_SCRATCH_INTERLEAVED_0(u32)[u16, stride =3D 8] @ CpuCtlBase + =
0x00000d00
>
> spelling the full intention out rather than have a special syntax, as thi=
s isn't
> the common case.

Implemented it and it indeed looks much better.

>
>> +///         31:0 value;
>> +///     }
>> +///
>> +///     /// Scratch registers bank 1.
>> +///     pub CPU_SCRATCH_INTERLEAVED_1(u32)[16 ; 8] @ CpuCtlBase + 0x000=
00d04 {
>> +///         31:0 value;
>> +///     }
>> +/// }
>> +/// # Ok(())
>> +/// # }
>> +/// ```
>> +/// [`Io`]: kernel::io::Io
>> +#[macro_export]
>> +macro_rules! register {
>> +    // Entry point for the macro, allowing multiple registers to be def=
ined in one call.
>> +    // It matches all possible register declaration patterns to dispatc=
h them to corresponding
>> +    // `@reg` rule that defines a single register.
>> +    (
>> +        $(
>> +            $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
>> +                $([ $size:expr $(; $stride:expr)? ])? $(@ $offset:liter=
al)?
>> +                $(@ $base:ident + $base_offset:literal)?
>
> Does `$(@ $($base:ident +)? $offset:literal)?` not work?

It does! I was trying to match the `+` in the right-side expression and
obviously couldn't, but it didn't occur to me to do it the other way. :)

>
>> +                $(=3D> $alias:ident $(+ $alias_offset:ident)? $([$alias=
_idx:expr])? )?
>> +            { $($fields:tt)* }
>> +        )*
>> +    ) =3D> {
>> +        $(
>> +        ::kernel::register!(
>
> $crate::register!()

Updated throughout the file (I am not sure to understand the difference tho=
ugh?).

>
>> +            @reg $(#[$attr])* $vis $name ($storage) $([$size $(; $strid=
e)?])?
>> +                $(@ $offset)?
>> +                $(@ $base + $base_offset)?
>> +                $(=3D> $alias $(+ $alias_offset)? $([$alias_idx])? )?
>> +            { $($fields)* }
>> +        );
>> +        )*
>> +    };
>> +
>> +    // All the rules below are private helpers.
>> +
>> +    // Creates a register at a fixed offset of the MMIO space.
>> +    (
>> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ $of=
fset:literal
>> +            { $($fields:tt)* }
>> +    ) =3D> {
>> +        ::kernel::register!(
>> +            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fie=
lds)* }
>> +        );
>> +        ::kernel::register!(@io_fixed $name($storage) @ $offset);
>> +    };
>> +
>> +    // Creates an alias register of fixed offset register `alias` with =
its own fields.
>> +    (
>> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) =3D> =
$alias:ident
>> +            { $($fields:tt)* }
>> +    ) =3D> {
>> +        ::kernel::register!(
>> +            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fie=
lds)* }
>> +        );
>> +        ::kernel::register!(@io_fixed $name($storage) @ $alias::OFFSET)=
;
>> +    };
>> +
>> +    // Creates a register at a relative offset from a base address prov=
ider.
>> +    (
>> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ $ba=
se:ident + $offset:literal
>> +            { $($fields:tt)* }
>> +    ) =3D> {
>> +        ::kernel::register!(
>> +            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fie=
lds)* }
>> +        );
>> +        ::kernel::register!(@io_relative $name($storage) @ $base + $off=
set );
>> +    };
>> +
>> +    // Creates an alias register of relative offset register `alias` wi=
th its own fields.
>> +    (
>> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) =3D> =
$base:ident + $alias:ident
>> +            { $($fields:tt)* }
>> +    ) =3D> {
>> +        ::kernel::register!(
>> +            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fie=
lds)* }
>> +        );
>> +        ::kernel::register!(@io_relative $name($storage) @ $base + $ali=
as::OFFSET );
>
> Would this generate error messages if $name and $alias are of different b=
ase, or
> would such case be a bug but silently compiles?

You would get an build error when trying to use the alias as the bases
are dedicated types and the types would be incompatible.

>
>> +    };
>> +
>> +    // Creates an array of registers at a fixed offset of the MMIO spac=
e.
>> +    (
>> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
>> +            [ $size:expr ; $stride:expr ] @ $offset:literal { $($fields=
:tt)* }
>> +    ) =3D> {
>> +        static_assert!(::core::mem::size_of::<$storage>() <=3D $stride)=
;
>> +
>> +        ::kernel::register!(
>> +            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fie=
lds)* }
>> +        );
>> +        ::kernel::register!(@io_array $name($storage) [ $size ; $stride=
 ] @ $offset);
>> +    };
>> +
>> +    // Shortcut for contiguous array of registers (stride =3D=3D size o=
f element).
>> +    (
>> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) [ $si=
ze:expr ] @ $offset:literal
>> +            { $($fields:tt)* }
>> +    ) =3D> {
>> +        ::kernel::register!(
>> +            $(#[$attr])* $vis $name($storage) [ $size ; ::core::mem::si=
ze_of::<$storage>() ]
>> +                @ $offset { $($fields)* }
>> +        );
>> +    };
>> +
>> +    // Creates an alias of register `idx` of array of registers `alias`=
 with its own fields.
>> +    (
>> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) =3D> =
$alias:ident [ $idx:expr ]
>> +            { $($fields:tt)* }
>> +    ) =3D> {
>> +        static_assert!($idx < $alias::SIZE);
>> +
>> +        ::kernel::register!(
>> +            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fie=
lds)* }
>> +        );
>> +        ::kernel::register!(@io_fixed $name($storage) @ $alias::OFFSET =
+ $idx * $alias::STRIDE);
>> +    };
>> +
>> +    // Creates an array of registers at a relative offset from a base a=
ddress provider.
>> +    (
>> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) [ $si=
ze:expr ; $stride:expr ]
>> +            @ $base:ident + $offset:literal { $($fields:tt)* }
>> +    ) =3D> {
>> +        static_assert!(::core::mem::size_of::<$storage>() <=3D $stride)=
;
>> +
>> +        ::kernel::register!(
>> +            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fie=
lds)* }
>> +        );
>> +        ::kernel::register!(
>> +            @io_relative_array $name($storage) [ $size ; $stride ] @ $b=
ase + $offset
>> +        );
>> +    };
>> +
>> +    // Shortcut for contiguous array of relative registers (stride =3D=
=3D size of element).
>> +    (
>> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) [ $si=
ze:expr ]
>> +            @ $base:ident + $offset:literal { $($fields:tt)* }
>> +    ) =3D> {
>> +        ::kernel::register!(
>> +            $(#[$attr])* $vis $name($storage) [ $size ; ::core::mem::si=
ze_of::<$storage>() ]
>> +                @ $base + $offset { $($fields)* }
>> +        );
>> +    };
>> +
>> +    // Creates an alias of register `idx` of relative array of register=
s `alias` with its own
>> +    // fields.
>> +    (
>> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
>> +            =3D> $base:ident + $alias:ident [ $idx:expr ] { $($fields:t=
t)* }
>> +    ) =3D> {
>> +        static_assert!($idx < $alias::SIZE);
>> +
>> +        ::kernel::register!(
>> +            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fie=
lds)* }
>> +        );
>> +        ::kernel::register!(
>> +            @io_relative $name($storage) @ $base + $alias::OFFSET + $id=
x * $alias::STRIDE
>> +        );
>> +    };
>> +
>> +    // Generates the bitfield for the register.
>> +    //
>> +    // `#[allow(non_camel_case_types)]` is added since register names t=
ypically use SCREAMING_CASE.
>> +    (
>> +        @bitfield $(#[$attr:meta])* $vis:vis struct $name:ident($storag=
e:ty) { $($fields:tt)* }
>> +    ) =3D> {
>> +        ::kernel::register!(@bitfield_core
>> +            #[allow(non_camel_case_types)]
>> +            $(#[$attr])* $vis $name $storage
>> +        );
>> +        ::kernel::register!(@bitfield_fields $vis $name $storage { $($f=
ields)* });
>> +    };
>> +
>> +    // Generates the IO accessors for a fixed offset register.
>> +    (@io_fixed $name:ident ($storage:ty) @ $offset:expr) =3D> {
>> +        #[allow(dead_code)]
>> +        impl $name {
>> +            /// Absolute offset of the register.
>> +            pub const OFFSET: usize =3D $offset;
>> +
>> +            /// Read the register from its address in `io`.
>> +            #[inline(always)]
>> +            pub fn read<T, I>(io: &T) -> Self where
>> +                T: ::core::ops::Deref<Target =3D I>,
>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<=
$storage>,
>> +            {
>> +                Self(<$storage as $crate::io::register::RegisterIo>::re=
ad(io, Self::OFFSET))
>> +            }
>> +
>> +            /// Write the value contained in `self` to the register add=
ress in `io`.
>> +            #[inline(always)]
>> +            pub fn write<T, I>(self, io: &T) where
>> +                T: ::core::ops::Deref<Target =3D I>,
>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<=
$storage>,
>> +            {
>> +                <$storage as $crate::io::register::RegisterIo>::write(s=
elf.0, io, Self::OFFSET)
>> +            }
>> +
>> +            /// Read the register from its address in `io` and run `f` =
on its value to obtain a new
>> +            /// value to write back.
>> +            ///
>> +            /// Note that this operation is not atomic. In concurrent c=
ontexts, external
>> +            /// synchronization may be required to prevent race conditi=
ons.
>
> Given the non-atomicity, how much value does it provide compared to havin=
g the
> user write read and write themselves? I feel that people reading the code=
 may
> assume the atomicity without reading docs if they see `FOO::update`, whil=
e it's
> less likely that they do so if they read
> `FOO::read(io).with_bar(baz).write(io)`.

It is just a convenience method. I cannot pretend it is widely used, but
it allows to turn multiple-step ops into one-liners.

>
>> +            #[inline(always)]
>> +            pub fn update<T, I, F>(
>> +                io: &T,
>> +                f: F,
>> +            ) where
>> +                T: ::core::ops::Deref<Target =3D I>,
>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<=
$storage>,
>> +                F: ::core::ops::FnOnce(Self) -> Self,
>> +            {
>> +                let reg =3D f(Self::read(io));
>> +                reg.write(io);
>> +            }
>> +        }
>> +    };
>> +
>> +    // Generates the IO accessors for a relative offset register.
>> +    (@io_relative $name:ident ($storage:ty) @ $base:ident + $offset:exp=
r ) =3D> {
>> +        #[allow(dead_code)]
>> +        impl $name {
>> +            /// Relative offset of the register.
>> +            pub const OFFSET: usize =3D $offset;
>> +
>> +            /// Read the register from `io`, using the base address pro=
vided by `base` and adding
>> +            /// the register's offset to it.
>> +            #[inline(always)]
>> +            pub fn read<T, I, B>(
>> +                io: &T,
>> +                #[allow(unused_variables)]
>> +                base: &B,
>> +            ) -> Self where
>> +                T: ::core::ops::Deref<Target =3D I>,
>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<=
$storage>,
>> +                B: $crate::io::register::RegisterBase<$base>,
>> +            {
>> +                let offset =3D <B as $crate::io::register::RegisterBase=
<$base>>::BASE + Self::OFFSET;
>> +
>> +                Self(<$storage as $crate::io::register::RegisterIo>::re=
ad(io, offset))
>> +            }
>> +
>> +            /// Write the value contained in `self` to `io`, using the =
base address provided by
>> +            /// `base` and adding the register's offset to it.
>> +            #[inline(always)]
>> +            pub fn write<T, I, B>(
>> +                self,
>> +                io: &T,
>> +                #[allow(unused_variables)]
>> +                base: &B,
>> +            ) where
>> +                T: ::core::ops::Deref<Target =3D I>,
>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<=
$storage>,
>> +                B: $crate::io::register::RegisterBase<$base>,
>> +            {
>> +                let offset =3D <B as $crate::io::register::RegisterBase=
<$base>>::BASE + Self::OFFSET;
>> +
>> +                <$storage as $crate::io::register::RegisterIo>::write(s=
elf.0, io, offset)
>> +            }
>> +
>> +            /// Read the register from `io`, using the base address pro=
vided by `base` and adding
>> +            /// the register's offset to it, then run `f` on its value =
to obtain a new value to
>> +            /// write back.
>> +            ///
>> +            /// Note that this operation is not atomic. In concurrent c=
ontexts, external
>> +            /// synchronization may be required to prevent race conditi=
ons.
>> +            #[inline(always)]
>> +            pub fn update<T, I, B, F>(
>> +                io: &T,
>> +                base: &B,
>> +                f: F,
>> +            ) where
>> +                T: ::core::ops::Deref<Target =3D I>,
>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<=
$storage>,
>> +                B: $crate::io::register::RegisterBase<$base>,
>> +                F: ::core::ops::FnOnce(Self) -> Self,
>> +            {
>> +                let reg =3D f(Self::read(io, base));
>> +                reg.write(io, base);
>> +            }
>> +        }
>> +    };
>> +
>> +    // Generates the IO accessors for an array of registers.
>> +    (@io_array $name:ident ($storage:ty) [ $size:expr ; $stride:expr ] =
@ $offset:literal) =3D> {
>> +        #[allow(dead_code)]
>> +        impl $name {
>> +            /// Absolute offset of the register array.
>> +            pub const OFFSET: usize =3D $offset;
>> +            /// Number of elements in the array of registers.
>> +            pub const SIZE: usize =3D $size;
>> +            /// Number of bytes separating each element of the array of=
 registers.
>> +            pub const STRIDE: usize =3D $stride;
>> +
>> +            /// Read the array register at index `idx` from its address=
 in `io`.
>> +            #[inline(always)]
>> +            pub fn read<T, I>(
>> +                io: &T,
>> +                idx: usize,
>> +            ) -> Self where
>> +                T: ::core::ops::Deref<Target =3D I>,
>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<=
$storage>,
>> +            {
>> +                build_assert!(idx < Self::SIZE);
>> +
>> +                let offset =3D Self::OFFSET + (idx * Self::STRIDE);
>> +
>> +                Self(<$storage as $crate::io::register::RegisterIo>::re=
ad(io, offset))
>> +            }
>> +
>> +            /// Write the value contained in `self` to the array regist=
er with index `idx` in `io`.
>> +            #[inline(always)]
>> +            pub fn write<T, I>(
>> +                self,
>> +                io: &T,
>> +                idx: usize
>> +            ) where
>> +                T: ::core::ops::Deref<Target =3D I>,
>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<=
$storage>,
>> +            {
>> +                build_assert!(idx < Self::SIZE);
>> +
>> +                let offset =3D Self::OFFSET + (idx * Self::STRIDE);
>> +
>> +                <$storage as $crate::io::register::RegisterIo>::write(s=
elf.0, io, offset)
>> +            }
>> +
>> +            /// Read the array register at index `idx` in `io` and run =
`f` on its value to obtain a
>> +            /// new value to write back.
>> +            ///
>> +            /// Note that this operation is not atomic. In concurrent c=
ontexts, external
>> +            /// synchronization may be required to prevent race conditi=
ons.
>> +            #[inline(always)]
>> +            pub fn update<T, I, F>(
>> +                io: &T,
>> +                idx: usize,
>> +                f: F,
>> +            ) where
>> +                T: ::core::ops::Deref<Target =3D I>,
>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<=
$storage>,
>> +                F: ::core::ops::FnOnce(Self) -> Self,
>> +            {
>> +                let reg =3D f(Self::read(io, idx));
>> +                reg.write(io, idx);
>> +            }
>> +
>> +            /// Read the array register at index `idx` from its address=
 in `io`.
>> +            ///
>> +            /// The validity of `idx` is checked at run-time, and `EINV=
AL` is returned if the
>> +            /// access was out-of-bounds.
>> +            #[inline(always)]
>> +            pub fn try_read<T, I>(
>> +                io: &T,
>> +                idx: usize,
>> +            ) -> ::kernel::error::Result<Self> where
>> +                T: ::core::ops::Deref<Target =3D I>,
>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<=
$storage>,
>> +            {
>> +                if idx < Self::SIZE {
>> +                    Ok(Self::read(io, idx))
>> +                } else {
>> +                    Err(::kernel::error::code::EINVAL)
>> +                }
>> +            }
>> +
>> +            /// Write the value contained in `self` to the array regist=
er with index `idx` in `io`.
>> +            ///
>> +            /// The validity of `idx` is checked at run-time, and `EINV=
AL` is returned if the
>> +            /// access was out-of-bounds.
>> +            #[inline(always)]
>> +            pub fn try_write<T, I>(
>> +                self,
>> +                io: &T,
>> +                idx: usize,
>> +            ) -> ::kernel::error::Result where
>> +                T: ::core::ops::Deref<Target =3D I>,
>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<=
$storage>,
>> +            {
>> +                if idx < Self::SIZE {
>> +                    Ok(self.write(io, idx))
>> +                } else {
>> +                    Err(::kernel::error::code::EINVAL)
>> +                }
>> +            }
>> +
>> +            /// Read the array register at index `idx` in `io` and run =
`f` on its value to obtain a
>> +            /// new value to write back.
>> +            ///
>> +            /// The validity of `idx` is checked at run-time, and `EINV=
AL` is returned if the
>> +            /// access was out-of-bounds.
>> +            ///
>> +            /// Note that this operation is not atomic. In concurrent c=
ontexts, external
>> +            /// synchronization may be required to prevent race conditi=
ons.
>> +            #[inline(always)]
>> +            pub fn try_update<T, I, F>(
>> +                io: &T,
>> +                idx: usize,
>> +                f: F,
>> +            ) -> ::kernel::error::Result where
>> +                T: ::core::ops::Deref<Target =3D I>,
>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<=
$storage>,
>> +                F: ::core::ops::FnOnce(Self) -> Self,
>> +            {
>> +                if idx < Self::SIZE {
>> +                    Ok(Self::update(io, idx, f))
>> +                } else {
>> +                    Err(::kernel::error::code::EINVAL)
>> +                }
>> +            }
>> +        }
>> +    };
>> +
>> +    // Generates the IO accessors for an array of relative registers.
>> +    (
>> +        @io_relative_array $name:ident ($storage:ty) [ $size:expr ; $st=
ride:expr ]
>> +            @ $base:ident + $offset:literal
>> +    ) =3D> {
>> +        #[allow(dead_code)]
>> +        impl $name {
>> +            /// Relative offset of the register array.
>> +            pub const OFFSET: usize =3D $offset;
>> +            /// Number of elements in the array of registers.
>> +            pub const SIZE: usize =3D $size;
>> +            /// Number of bytes separating each element of the array of=
 registers.
>> +            pub const STRIDE: usize =3D $stride;
>> +
>> +            /// Read the array register at index `idx` from `io`, using=
 the base address provided
>> +            /// by `base` and adding the register's offset to it.
>> +            #[inline(always)]
>> +            pub fn read<T, I, B>(
>> +                io: &T,
>> +                #[allow(unused_variables)]
>> +                base: &B,
>> +                idx: usize,
>> +            ) -> Self where
>> +                T: ::core::ops::Deref<Target =3D I>,
>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<=
$storage>,
>> +                B: $crate::io::register::RegisterBase<$base>,
>> +            {
>> +                build_assert!(idx < Self::SIZE);
>> +
>> +                let offset =3D <B as $crate::io::register::RegisterBase=
<$base>>::BASE +
>> +                    Self::OFFSET + (idx * Self::STRIDE);
>> +
>> +                Self(<$storage as $crate::io::register::RegisterIo>::re=
ad(io, offset))
>> +            }
>> +
>> +            /// Write the value contained in `self` to `io`, using the =
base address provided by
>> +            /// `base` and adding the offset of array register `idx` to=
 it.
>> +            #[inline(always)]
>> +            pub fn write<T, I, B>(
>> +                self,
>> +                io: &T,
>> +                #[allow(unused_variables)]
>> +                base: &B,
>> +                idx: usize
>> +            ) where
>> +                T: ::core::ops::Deref<Target =3D I>,
>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<=
$storage>,
>> +                B: $crate::io::register::RegisterBase<$base>,
>> +            {
>> +                build_assert!(idx < Self::SIZE);
>> +
>> +                let offset =3D <B as $crate::io::register::RegisterBase=
<$base>>::BASE +
>> +                    Self::OFFSET + (idx * Self::STRIDE);
>> +
>> +                <$storage as $crate::io::register::RegisterIo>::write(s=
elf.0, io, offset)
>> +            }
>> +
>> +            /// Read the array register at index `idx` from `io`, using=
 the base address provided
>> +            /// by `base` and adding the register's offset to it, then =
run `f` on its value to
>> +            /// obtain a new value to write back.
>> +            ///
>> +            /// Note that this operation is not atomic. In concurrent c=
ontexts, external
>> +            /// synchronization may be required to prevent race conditi=
ons.
>> +            #[inline(always)]
>> +            pub fn update<T, I, B, F>(
>> +                io: &T,
>> +                base: &B,
>> +                idx: usize,
>> +                f: F,
>> +            ) where
>> +                T: ::core::ops::Deref<Target =3D I>,
>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<=
$storage>,
>> +                B: $crate::io::register::RegisterBase<$base>,
>> +                F: ::core::ops::FnOnce(Self) -> Self,
>> +            {
>> +                let reg =3D f(Self::read(io, base, idx));
>> +                reg.write(io, base, idx);
>> +            }
>> +
>> +            /// Read the array register at index `idx` from `io`, using=
 the base address provided
>> +            /// by `base` and adding the register's offset to it.
>> +            ///
>> +            /// The validity of `idx` is checked at run-time, and `EINV=
AL` is returned if the
>> +            /// access was out-of-bounds.
>> +            #[inline(always)]
>> +            pub fn try_read<T, I, B>(
>> +                io: &T,
>> +                base: &B,
>> +                idx: usize,
>> +            ) -> ::kernel::error::Result<Self> where
>> +                T: ::core::ops::Deref<Target =3D I>,
>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<=
$storage>,
>> +                B: $crate::io::register::RegisterBase<$base>,
>> +            {
>> +                if idx < Self::SIZE {
>> +                    Ok(Self::read(io, base, idx))
>> +                } else {
>> +                    Err(::kernel::error::code::EINVAL)
>> +                }
>> +            }
>> +
>> +            /// Write the value contained in `self` to `io`, using the =
base address provided by
>> +            /// `base` and adding the offset of array register `idx` to=
 it.
>> +            ///
>> +            /// The validity of `idx` is checked at run-time, and `EINV=
AL` is returned if the
>> +            /// access was out-of-bounds.
>> +            #[inline(always)]
>> +            pub fn try_write<T, I, B>(
>> +                self,
>> +                io: &T,
>> +                base: &B,
>> +                idx: usize,
>> +            ) -> ::kernel::error::Result where
>> +                T: ::core::ops::Deref<Target =3D I>,
>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<=
$storage>,
>> +                B: $crate::io::register::RegisterBase<$base>,
>> +            {
>> +                if idx < Self::SIZE {
>> +                    Ok(self.write(io, base, idx))
>> +                } else {
>> +                    Err(::kernel::error::code::EINVAL)
>> +                }
>> +            }
>> +
>> +            /// Read the array register at index `idx` from `io`, using=
 the base address provided
>> +            /// by `base` and adding the register's offset to it, then =
run `f` on its value to
>> +            /// obtain a new value to write back.
>> +            ///
>> +            /// The validity of `idx` is checked at run-time, and `EINV=
AL` is returned if the
>> +            /// access was out-of-bounds.
>> +            ///
>> +            /// Note that this operation is not atomic. In concurrent c=
ontexts, external
>> +            /// synchronization may be required to prevent race conditi=
ons.
>> +            #[inline(always)]
>> +            pub fn try_update<T, I, B, F>(
>> +                io: &T,
>> +                base: &B,
>> +                idx: usize,
>> +                f: F,
>> +            ) -> ::kernel::error::Result where
>> +                T: ::core::ops::Deref<Target =3D I>,
>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<=
$storage>,
>> +                B: $crate::io::register::RegisterBase<$base>,
>> +                F: ::core::ops::FnOnce(Self) -> Self,
>> +            {
>> +                if idx < Self::SIZE {
>> +                    Ok(Self::update(io, base, idx, f))
>> +                } else {
>> +                    Err(::kernel::error::code::EINVAL)
>> +                }
>> +            }
>> +        }
>> +    };
>> +
>> +    // Defines the wrapper `$name` type and its conversions from/to the=
 storage type.
>> +    (@bitfield_core $(#[$attr:meta])* $vis:vis $name:ident $storage:ty)=
 =3D> {
>> +        $(#[$attr])*
>> +        #[repr(transparent)]
>> +        #[derive(Clone, Copy, PartialEq, Eq)]
>
> You can derive `Zeroable` and save you an unsafe impl.

Unfortunately this happens if I try to do it:

    error: no rules expected `(`
		    --> ../samples/rust/rust_driver_pci.rs:74:9
		    |
	    74 | /         ::kernel::register! {
	    75 | |             VENDOR_ID(u16) @ 0x0 {
	    76 | |                 15:0 vendor_id;
    ...    |
	    86 | |         }
		    | |_________^ no rules expected this token in macro call

Not quite sure why to be honest.

>
>> +        $vis struct $name($storage);
>> +
>> +        #[allow(dead_code)]
>> +        impl $name {
>> +            /// Creates a bitfield from a raw value.
>> +            $vis const fn from_raw(value: $storage) -> Self {
>> +                Self(value)
>> +            }
>> +
>> +            /// Creates a zeroed bitfield value.
>> +            ///
>> +            /// This is a const alternative to the `Zeroable::zeroed()`=
 trait method.
>> +            $vis const fn zeroed() -> Self {
>> +                Self(0)
>> +            }
>
> All types that impl `Zeroable` automatically have the `::zeroed()` fn pro=
vided
> via the trait.

Yes, but that method from the trait cannot be used in const context, and
`zeroed` is the starting point for building register values from scratch (a=
nd
thus constant values).

>
>> +
>> +            /// Returns the raw value of this bitfield.
>> +            ///
>> +            /// This is similar to the [`From`] implementation, but is =
shorter to invoke in
>> +            /// most cases.
>> +            $vis const fn as_raw(self) -> $storage {
>> +                self.0
>> +            }
>> +        }
>> +
>> +        // SAFETY: `$storage` is `Zeroable` and `$name` is transparent.
>> +        unsafe impl ::pin_init::Zeroable for $name {}
>> +
>> +        impl ::core::convert::From<$name> for $storage {
>> +            fn from(val: $name) -> $storage {
>> +                val.as_raw()
>> +            }
>> +        }
>> +
>> +        impl ::core::convert::From<$storage> for $name {
>> +            fn from(val: $storage) -> $name {
>> +                Self::from_raw(val)
>> +            }
>> +        }
>> +    };
>> +
>> +    // Definitions requiring knowledge of individual fields: private an=
d public field accessors,
>> +    // and `Debug` implementation.
>> +    (@bitfield_fields $vis:vis $name:ident $storage:ty {
>> +        $($(#[doc =3D $doc:expr])* $hi:literal:$lo:literal $field:ident
>> +            $(?=3D> $try_into_type:ty)?
>> +            $(=3D> $into_type:ty)?
>> +        ;
>> +        )*
>> +    }
>> +    ) =3D> {
>> +        #[allow(dead_code)]
>> +        impl $name {
>> +        $(
>> +        ::kernel::register!(@private_field_accessors $vis $name $storag=
e : $hi:$lo $field);
>> +        ::kernel::register!(
>> +            @public_field_accessors $(#[doc =3D $doc])* $vis $name $sto=
rage : $hi:$lo $field
>> +            $(?=3D> $try_into_type)?
>> +            $(=3D> $into_type)?
>> +        );
>> +        )*
>> +        }
>> +
>> +        ::kernel::register!(@debug $name { $($field;)* });
>> +    };
>> +
>> +    // Private field accessors working with the correct `Bounded` type =
for the field.
>> +    (
>> +        @private_field_accessors $vis:vis $name:ident $storage:ty : $hi=
:tt:$lo:tt $field:ident
>> +    ) =3D> {
>> +        ::kernel::macros::paste!(
>> +        $vis const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive=
<u8> =3D $lo..=3D$hi;
>
> Is this used by anything?

Not yet. This is intended for user code that wants to know which bits are u=
sed
by a specific field. I don't mind removing it though.

Thanks for the review and ideas!
