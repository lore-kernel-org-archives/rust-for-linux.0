Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021086.outbound.protection.outlook.com [52.101.95.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7E23BB9F5
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 11:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768996024; cv=fail; b=JCxUg7ljKMDLZwTxIiNIWGoe3lFnaARFjho7dRS1rvXohXs9iqqpDLgAgdj2D1KPx6lI9e94e/5gkkrZq/BGEP+wf9d9XC3831qOsqYfd23xlaifsy0npIqqBWFktB55qxUeJp3dWjVDsv2/eZAL6sV+5drLridYCbOFxYtrMck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768996024; c=relaxed/simple;
	bh=C12FKEZ0aQBbDKuG0e2SaqXRQbw2t/g2tM0jBt3G8no=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=nDTCJR0O8MZvPYkBo6KvBvsaFKsZt9qGgAhHNf2y2jYVY6yuGcV4j2S9gr10KqfgPtiXWzKtk78FpiNBciK0s99Xgp0ZpQnfl30ske38C+mqrCKrjRhzkccReKx5IVKW+ZiMItmbywnTMeX0zFfam5STHhC8CgGkLsiBtMn0PJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=a3zwBb4L; arc=fail smtp.client-ip=52.101.95.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="a3zwBb4L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IjoOqQFp9m8gXmSIWiO0Lcp7bqmpxYxCHWEBvb17DfX19ISBWWPdwnbBTLVw2+YqUNkAFoEtxcOgmUzeH6me3ZrYLZnC3oN8Skax5ooaVSG2MqA5BP2Mn6Wzy7gAwRcPUZ+PsXqvhIWRk0he64dv/ya6GCa1kjreMaXgZd2R2RZcdm/gbssFagraFBVb0IvZ0lw/Q73hrrgehqSqrQPtShDPHuwS+TCkIvG1od1Z7AcsBzUc3hbTQCkXp3FBGoajQ3KosHfzMhEqrqV9FzPCEWRP0JlT857DECpfvu8mmwHYbMr4/ZHGSFCB3pIEQE1PDdv8F2YmBEKlkt1D+lHjQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5izUSruuxhLI0M+mj/c7Z6sP5QhYI9S0pMK5L8OTuhY=;
 b=dbnxZ7UQMg3MojjT+hRMSiklR1wtncsCvRE+hGCwB/kr7yXHMzltXyVbNDUHN3VUlz6sBL+6s3FdqM08AWKXIvsmnYY3GR3mMXvFI9aY4UzJDIbbv3TQSincsuq7XJOFQ2/K2378Ko9DHgKU605UQKk3oNigWB33w9ECa3i2rC6Rgx2+a494yDYRTuiYCpTbAkp2TbRo6ztPpbuX3FGD6FYpFsk621GtxI2AARVYF7XitUl2LiBkA0EQhe/ovZ3x5IL+IkoAdLKyqeTKNTsJieIC5VrZmp90yf6jn+uE5g0HnHn1dI7uEcsTr6hB5x93G4ZlLV4cYmPs5hFjkttJ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5izUSruuxhLI0M+mj/c7Z6sP5QhYI9S0pMK5L8OTuhY=;
 b=a3zwBb4L3jwgQ7MuYteftg/qYctOVJGE7hRu5+4tMQ9vFaJ8dqfCC01W7ZEenhF8VMuuez1LoApfcTXIXmSeAYtF+YRx8LtWa6MmZp9ndjjGzX3M2JdTNjmFoBkscn6lu2jDntHZ1z0BgKB4MIOpDg0Op09qu1DAsAfeBP3HvlY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6303.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:181::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.14; Wed, 21 Jan
 2026 11:46:56 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 11:46:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 11:46:53 +0000
Message-Id: <DFU8R1U4X9IM.DS5S82YYN4X0@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 <ojeda@kernel.org>
Cc: <aliceryhl@google.com>, <anna-maria@linutronix.de>,
 <bjorn3_gh@protonmail.com>, <boqun.feng@gmail.com>, <dakr@kernel.org>,
 <frederic@kernel.org>, <jstultz@google.com>, <lossin@kernel.org>,
 <lyude@redhat.com>, <sboyd@kernel.org>, <tglx@kernel.org>,
 <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v1] rust: time: Add Delta range constants for time units
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260119233621.3465304-1-fujita.tomonori@gmail.com>
 <KPB3FIcVMpT7PQ-Zg-0bQVF4nSfqiVuhuzot88r7jK8LruVydZSqJRtFsvpBazN7-iJV8NL6ZLPzK_RnQMHV5A==@protonmail.internalid> <DFTJPKIWK06S.3J0C75Z4RHUY3@garyguo.net> <87sebzti6x.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87sebzti6x.fsf@t14s.mail-host-address-is-not-set>
X-ClientProxiedBy: LO6P265CA0030.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6303:EE_
X-MS-Office365-Filtering-Correlation-Id: bc6eef6f-e47b-4b2c-6595-08de58e2c642
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2VIdlAyS0MyS1FnWXBzeTNlK01KNFlZR241VEtvU3FmYjd0NUFZRENGOWU5?=
 =?utf-8?B?TWlUVTh3VWp3ZHlEV0pjc3p5TTZYSUEvWEV4VG1zdVN0NWNKejNwdmZwUlVp?=
 =?utf-8?B?Um5wenBFMDFnc2lXcVVCL0RveERFSzRVTVg2dStqZjhwV1pqemd6WEpNVXdl?=
 =?utf-8?B?U3VHVzlCaXJnT0ZtUlZkNUZVM1E3VE9tNUxpR3lUcmNDZGVzNXliV1hXT0hS?=
 =?utf-8?B?YkIxSGI4bXBpUE51RE5kUVppUU41TjMxVGlZaGUySkZ5MU9abmltSGMwSytu?=
 =?utf-8?B?VnYvN2tJR2Z6eVczaXBoVWF2TmtGVXZGNkpXWFRFdW9jNCtRcC8raEI0bTds?=
 =?utf-8?B?cFl2cFZMdXdIZWRNN3lqc0FRbG1uU1pjTlJ2d0hkRDBJYWYwOFhNd3VhK2Na?=
 =?utf-8?B?K21EOUhSMmdIV1RtYU8wSnR1aDU5NjM0MTVDYnRxR085ZjcvRmw0V001UWwy?=
 =?utf-8?B?SjlqMFIyN0lNc1d6d01EMVRqSWNwNzdwazM5QUVKL3h6Y1J0ajBTdFg0OWNT?=
 =?utf-8?B?QUFBa3NOeEVienNJMmVqeHJrMkdOcm1zMExKRGhWNnpoYXRBV0V5aE5jdks4?=
 =?utf-8?B?bS9oVHNPeUZiNGg0NVg4dDRqOEMyQURnWHZDMmE2cTJvaTNJa3hKWVdHZzZT?=
 =?utf-8?B?cTg5K2cvclRLYnFCUmhRSUpwV1JyWEVoK0w4Q0duMTJRdnNja09MSE16aExu?=
 =?utf-8?B?b25vcXk0M00rQTBGOTdGMzlEMnVscU9wYkZwcUhIRFJyNHMrVlhkZ0hmb1NY?=
 =?utf-8?B?SEpKOXpiRnRYdis1TEFQYmFwVUwrSnFHTXhiaExYRG9NVzgxTzVEdlJKVFRu?=
 =?utf-8?B?a1kxNVBJSmM1MzcvRFVLODNqQ2RIazNOQUtPNW8xbHE5RUNVRmJUOENkbXlE?=
 =?utf-8?B?SUIwL0h1U1FxN0J4MXBJYWdFeU85bUpySUJBeWNkaGRtY1hzMDkxZmxvNkI4?=
 =?utf-8?B?YnhFVXJwajJ6OHFtdVFvcU5CK1VHWE1uN3h3VUJoUDU3eVgxWTlQOUZ0RFVj?=
 =?utf-8?B?T0JWT0xmempwQjlHejRvSEwxS2dEZ29sbDNQRWlwOTZDSlVpY2VjM21LUU1Q?=
 =?utf-8?B?MlgrVmhURit4ZktneVorbDR5VVBtWWZ1aTJVQXovRWVvcThlQm16WDFEQ1lL?=
 =?utf-8?B?bXRYUmVpMWJFMUJCVmZ4My8vc2RDRnV2cUhRaW5Sa3BDajNtbGhMaFBsb245?=
 =?utf-8?B?a3A1cU5FNE84MEhSVDA1eUdCcWpqSjZKL0VjQ0JMaG50WXAyRDVleVBUQmo3?=
 =?utf-8?B?UHVGNW03N2pFa0xzbXdlMXQ5SXgxS3BUajFIRDBBRE9Gc2cvWVA5SHM5Mkhk?=
 =?utf-8?B?dHc2aGVnKzNlbHlnYmN0aEZUakZqVEUxMjlyMy9CMWRocmRiUFJhZVk0b2pD?=
 =?utf-8?B?UUhyY0FRT2ZIZXh0bTIrMFlkK25nMkRnRjhTNUhGK2NZdXJ2ZUJ1bGdoekhm?=
 =?utf-8?B?ei8yZkx1NHFJSUhHcTV2NDdOWS9JVzlRVGlVaUdHblZscE4vNU5TWGZrR3Zr?=
 =?utf-8?B?MTZPVGMrWk5za0VZOFZMWHFFOVh3Nmo5MUVXYmJvWUc1UklodkVXTHRIWDNu?=
 =?utf-8?B?Q2l4MWdsa0hEU1VDUnlxZEhmQ2VuS09RUDhxQXA4b0ZhMG9rUDA4dWpyOWs3?=
 =?utf-8?B?UzdMU2xDZlJpRGRjTFRmdlk1ZFFjQkxyb0lCdG9BMmNkSWNXalBoZGFQNDJk?=
 =?utf-8?B?TWszNVRrNnNPMkdwMEdPVi94MytWNW5XS0M1bm1WU3NqQUs5RXpqUGkxQk8w?=
 =?utf-8?B?VlJEcDVJNDhIWE9zbFpCWGtrd2EwOTBrczhtTi8rK0xiQkNTVU5BOWFaNnlJ?=
 =?utf-8?B?VzlTWFFUZklld2oxZUZPdlNsRU1GVXAyaGNpQ3NYdXBvQWZiNTZRN0s3bDVI?=
 =?utf-8?B?bWo2K083a0R6MzgwNDFoUGMwSStlTmRMQ040YlFOR3FIdmdkelpwd2MzaUhx?=
 =?utf-8?B?enhKYTFUK2hmbURXa3hVTkdmRm5IbTR5SmpXTHlNdi9UN3MyenJSMVV0T3FE?=
 =?utf-8?B?QnlBZGV2cFNFVW9uU1p1cWVxRHo1dGFNWWcvZ3REVkYwcm1VbFdoR0lzK3pR?=
 =?utf-8?B?TmxWT24ra0JTSjNpRnA4TEZtb0poaDhUN1d3bmVRejZvNFhyT3hTaVdzemFU?=
 =?utf-8?Q?SvSY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2krR3JZQ1czMDFQblNoVDNacEk5MUlJTzk5MXExMnE2Zk1iamxEcmNVSHlp?=
 =?utf-8?B?dUNYc3hLYUdkN1FmZTh6TVBQd0dObzZ6YWJsejlZNXRVQ2RxaGVlWjlLY0Rn?=
 =?utf-8?B?VVFiR3JyRVluUHNkNVlJTkNvQWl6KzFEZXFPaUhOdVU5dTNzRVFDSytxeFh5?=
 =?utf-8?B?dko0c1BhZUI4WUtja1ptY1NaTWM5VkdMWWZwbGlqUldtVTAxZTRkQkJNTGdF?=
 =?utf-8?B?am9yY29ZTW01Z0N5TndaNmYwY1dYMk1QM0dWQ2VSeDBoQmhPYUp2QjZEZUZH?=
 =?utf-8?B?aHZoS0RjRnlEQWwxYWxwWW93c202RndPQWc3c3dlSkxicnV0bWRna3Nxckp2?=
 =?utf-8?B?UzNtZm9sMDd4V3d5V0lLUmZPTnFvNnJVaXhxT21aUHRkaVlPUmt2eVFPeWdI?=
 =?utf-8?B?SE1ucWJ5dHd5ZmFFaEs4YTVCL1JiMEtxZVFKNVNpL05YbVVSQ1NSQUcwSG5v?=
 =?utf-8?B?T0dNZDdqbnRsL05TMWNZb1MrVUErWEs3ZUk1OUQzL2NxM01BbUdJRGZ6bXZV?=
 =?utf-8?B?Y2Z6Z2JVUXhkWnVtMWdlaEF5YVMxajUxQml0K0h1bDZxT2VYRjU4bktBNkw0?=
 =?utf-8?B?YW8zdkdhS01XV0tibDhQblpPdGR1WVlmZEt1Um5YU0VQVVNyMi9xZkJYNG54?=
 =?utf-8?B?eGRFWjhQV0h5ZmZRQ3JaTHBNbXJGeml0c1licFgwSU5MQ1EwMU5UU0FLZ2hH?=
 =?utf-8?B?N3FzekZQeDBmbTJtajkxaDg0VVVnclozRG0rYXBOa2Nta0ZUSU41VGplYVla?=
 =?utf-8?B?Wm9qYWNmWHYzSFRtemxCTzYyN2srOGp3ajE0K09XczRwMjFrRkFQSU5WNk01?=
 =?utf-8?B?NFcrZC9FYlg1R1NHY3dLdWlpZUozaVFUMjkvMVlhcEpIRFljYXZiUERCSzNW?=
 =?utf-8?B?UjB5TVZaMUdSSzdxY3lKcVpPNmFTN1BteUxQRGZaZi9tT3pZRWRQU2pLUGVB?=
 =?utf-8?B?VU5xOXR6djdaajZxV2tGTnpYdEZVUkNaTjZiVnY4REg4cEJoZHBMREdHdFNC?=
 =?utf-8?B?QXI5NnNRMnRrWlpweGlIWWtMRmdIMDEySWU0NXQ0TFJ0R3IyU3ZSaXYvUVJG?=
 =?utf-8?B?ZTFhZElnSEllTVlaVCtaM2hHUzM1c1d6RW9Xbnpvdm5WTTI0MkwwNkxQeTFX?=
 =?utf-8?B?bWY3N3QxbVJybkIxNDRUdGUrb09UbmxuVENRU3lzTXBNaG42MzlHQVZlT2ZW?=
 =?utf-8?B?MmtSN1NjRFRESnBudUxHUHV6UjU1MGRkYTdzMGIrYTFGK0ZkaTBOMFlYdmJV?=
 =?utf-8?B?VGpaek1jVk82Y0psakdyTjZiWE1lREZEdGZPeEdoM3RvMXo3bDArZGZHV3dM?=
 =?utf-8?B?TEt2YTlpNmRIc1NzbE1FTnRJOWNVVERKS25JRkdwVXBETGxHSWx0ZUhPdGtV?=
 =?utf-8?B?dEEwdENoZFhzZytOM3RWK3Q0WlkzclRJY01lTlhVNGZRUFZ4d3dqaUVucUJ1?=
 =?utf-8?B?N3J1cElQbEdqSnRSWGtNNlpwTUZpTE1USHFKc3NuKzVMSkFhNkFEdWYrYlFD?=
 =?utf-8?B?NXZzbmkvK3FyRVl5UURxWDB2cVJiUEFjOWc1RnExQUk4VWRucnZ3ZmlRSk9L?=
 =?utf-8?B?MXNMeHNucUhydnI0Mktacm9jeklmbHV1NlVnVGFQVytTY2tsamJITmhtOGtF?=
 =?utf-8?B?ZXpFaHlwNjFqT2p5V1dsdjhMR1A3eWpZRnpUc24wbmlXT2loa0wwWkdteGhH?=
 =?utf-8?B?T2tTNU5NV0lFU0UweUt3WXZ2akt2SGZFNmJ5bmJ3TnVoZFN4UWhvSkNBang3?=
 =?utf-8?B?Z1JNMVdFcVpCbHZCS3ZqTWdQejZFT0lYNXNDUXpYT2Y3MEdPWlQ5OUhFTURH?=
 =?utf-8?B?L3M3OHMzWVVHd1BrZ2JJWHlxS3ozazhVbkRVcDR0WWRUdE91Mk5Fek0xdk1X?=
 =?utf-8?B?UHFKcGt0Z2hka1NYRjJ5V1dvblpnNWtpeWZhQjBJaFFwUTBOYVJZQnJXcFdn?=
 =?utf-8?B?bkpvY1dMeUVHei9aaHFScTZpREdrbCszMzZYWVAwaGdkTHk2NGh4aHJTMGxB?=
 =?utf-8?B?RmxFOHRRc1JINEZkS0RkaG0yY3NobnBYaG5mY21TK2FjSDRGa2dicy94bTJo?=
 =?utf-8?B?c3FMTnYzUDl3Z3ZSaUs5L0d4NGVOQlZIZmI0cng3NVZkNk9IWFRpMFR5VmJr?=
 =?utf-8?B?SllWb2NHcDErVkQ1dWN6cW5jY0dMQklsUFBHZkRtMDVvVUJtaVZRdzRRYmtH?=
 =?utf-8?B?ZEtaMjV5Sit4T2p4R3MxYWp2YTZFK3pHSStUeFNtdUluc3dORlRVeXFBSXA5?=
 =?utf-8?B?VjZtUFFVQTQvOXJvdmZ4aWo2U1c5dkt5SDFXdTkvMnE5OVlURFZkQ291OEdl?=
 =?utf-8?B?VEM2NHRtSmo0V0tScEU2TG1OeXFReUg0Wi9jUGp5SVpLTUFrTmM0UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6eef6f-e47b-4b2c-6595-08de58e2c642
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 11:46:54.5942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6bsC+FB25McNuFlL94JXV4M08qqAfwcKeUuHIS+ZOeF57moyBiOxR9EOuAYgh6X6fKdfMqe8ROgS87O71q4udA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6303

On Wed Jan 21, 2026 at 9:43 AM GMT, Andreas Hindborg wrote:
> "Gary Guo" <gary@garyguo.net> writes:
>
>> On Mon Jan 19, 2026 at 11:36 PM GMT, FUJITA Tomonori wrote:
>>> Add MIN_*/MAX_* constants for Delta::from_micros(), from_millis(), and
>>> from_secs() constructors, and update their documentation to reference
>>> these constants instead of integer literals.
>>>
>>> This improves documentation readability and makes the valid ranges
>>> reusable.
>>
>> I think they're really just their for documentation purpose, and we shou=
ldn't be
>> expecting anybody to use these constants.
>>
>> I would rather just drop these constants given that we already specify t=
he
>> behaviour on when this is non-representable.
>>
>> If you have a geniune use case of these constants, I would like to see t=
hem, and
>> they likely can be replaced by something else?
>>
>
> I specifically asked for these constants to be added, because I do not
> want to see something like
>
>   The `secs` can range from -9_223_372_036 to 9_223_372_036
>
> in the documentation. It is useless.

Then drop it.

> Reading this:
>
>   The `secs` can range from [`Delta::MIN_SECS`] to [`Delta::MAX_SECS`].
>
> makes much more sense. If the reader requires the actual number, they
> can go use the constant in code, or they can click through the link if
> they are browsing docs.

I don't see a user for these APIs. I'd rather not have an API for documenta=
tion
purpose only, especially, to me, the documentation reads fine without these
constants at all. Simply stating "If `millies` is outside representable
range..." etc would be fine.

If there is a need for APIs that don't staturate on overflow but rather ret=
urns
an error, good, then let's add a try_from_* API that returns an error. Nobo=
dy
shouldn't check against these constants manually.

Best,
Gary
