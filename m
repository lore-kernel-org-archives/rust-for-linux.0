Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010003.outbound.protection.outlook.com [52.101.46.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9281C3793D2
	for <rust-for-linux@vger.kernel.org>; Sun,  9 Aug 2026 02:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786242423; cv=fail; b=G7cpRXcjBI2rtVRxxl3l5w319OB3qMwjlmdOBpHCkrnT2NvBRzg2Psmi4vUbcBncaWPAKPOAVg3laP/cKz+6I+nIUzQSWk49ln7IqBZNuJRdbYlMY558TpdwqN7WYxRk7pNvKoKQRU/SfvcykQakuGON0pcNVXUKnElFktgVyq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786242423; c=relaxed/simple;
	bh=Trlb2V1Irm+9cF4r/VKJeaQq3m1m7ewdVWcptFMeuUg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=GNmpEymoQ3DbNqLh7gVnQeRlpSfUFeN2wFarmEgpZdN4hr1KlxzkFJrYECjin1j+iAnPpseKx0h5uS9WHnzPfZyS41e0rokItXaoKhNrzNiLD1c+YoPKnepRvLKP65rJkS51FrM5GMu2sja9IcCzDmW9xCzQJwqjKH2HkEDq1XU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eSiIyytf; arc=fail smtp.client-ip=52.101.46.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eSiIyytf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIQLuNfDRBA6YhyT+HiL17TuXC4yNBRzQS7jOwJUn7s+n25Pld+eK/5KHJWfG+cWoQGgp+f1E9wgYGsja5pueBhk2hyu9pqtCkx+7PKvPv9dUNGpHgB8whxGq8mOckloHos+um4DEwgwVTXy2l6nvz9G64024Uppm8UbTuJVY5ua2tLFFXoiefBk7DMp/GTL5qkpyEWZY/OyGrvGrj8L2nJiY6DVbCHnViP3+vQEl8E0n1CWqUcLZoPH36HkeWxCMOqhczDpZlfyLQPOtcvND7YdV3FVI5SQiXUvwphRfvcxVqBeLA3Tn1CO5jsaISeTrEDBJtQDsivG6XFl+tN8YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dToAccUIPQoJau4Xmep/HMY12So+we1w+uxyVnoa1n4=;
 b=bFBqAblulJ0SvlK2Z8GZvYaLzNxNm404m8mQ2UMkxtQeXxupldT3sQDa3hA7pSecfsFbl9SWKwgomSRnSEJZIg/DW8EnhMiV+adnT9eCn2S4nobCbUJFs9P/NKeL2AEdejhD061tjLCSHc6Qol6VIx9XPPycHT8l7/XPDoEbZ04aqoQTRuhbDcQKUKnx54qt/XAbAmcfa9x6ARJvvzWG3C+yKgi5YtYzpHzf9JUSGihUmoVwu0J08X4HXqhLwlIV81tzWyxavgI+qD9wmpVpYBMTPqpdgZeubrYybh8fCgwR+bLDSGs5W4C7k5/BQGhyREjfjErHker7yBsSuzwd9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dToAccUIPQoJau4Xmep/HMY12So+we1w+uxyVnoa1n4=;
 b=eSiIyytfIUgcNZfxn9aZ+HfLdOJUV0bs+x7Alqur8BE+hM7gNvsva/xECwDzMkivKoDEoM2X5gLS9jRlvwUEPVN4+FQIDI3xfHVJA2y+RNwDEk3PtEZFQNVbZP+JDsxxhmIOc/QPIkW/rRtrWJhSAPPeCSETzcK426lwpwV3cgqDt3u1viUQI3//Hn4op6y7SjmDxIv6sOfG/RkaHZGCKF00Jzc/S8R21NFU7av5tgq7Q9lTJRKnlUaU08lXE+VyB27H+7sxB8z925r3yqR47YW7wQmwCjWqfyUbi2OdQktZGhZCHXOdzUREXERLOuSVpAJwccmkCGJkY+YZqzlwXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW5PR12MB5684.namprd12.prod.outlook.com (2603:10b6:303:1a1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 02:26:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0292.018; Sun, 9 Aug 2026
 02:26:53 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sun, 09 Aug 2026 11:26:49 +0900
Message-Id: <DKK236MNP2NH.MFG9QEPIEH1M@nvidia.com>
Cc: <a.hindborg@kernel.org>, <aliceryhl@google.com>, <arve@android.com>,
 <boqun@kernel.org>, <brauner@kernel.org>, <cmllamas@google.com>,
 <gary@garyguo.net>, <gregkh@linuxfoundation.org>, <ojeda@kernel.org>,
 <tkjos@android.com>, <anna-maria@linutronix.de>,
 <bjorn3_gh@protonmail.com>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <frederic@kernel.org>,
 <jstultz@google.com>, <lossin@kernel.org>, <lyude@redhat.com>,
 <sboyd@kernel.org>, <tamird@kernel.org>, <tglx@kernel.org>,
 <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v5 1/7] rust: time: make Delta generic over its time
 unit
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "FUJITA Tomonori" <tomo@flapping.org>
Content-Transfer-Encoding: quoted-printable
References: <20260806073241.1024319-1-tomo@flapping.org>
 <20260806073241.1024319-2-tomo@flapping.org>
 <878q6j4m8a.fsf@t14s.mail-host-address-is-not-set>
 <20260807.211008.1388653306665929214.tomo@flapping.org>
In-Reply-To: <20260807.211008.1388653306665929214.tomo@flapping.org>
X-ClientProxiedBy: TY4P301CA0114.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW5PR12MB5684:EE_
X-MS-Office365-Filtering-Correlation-Id: f44d28ee-0d69-480e-fc84-08def5bdacf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|366016|1800799024|10070799003|6133799003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yMwToAYjccLuLhQC6v0LsLdUZRAT8HW8bLZiuVsHENPYErOqEGfyUdXjBReRZhALOLwvyFh04N7XwLBKzny/GesFLt36ARMeaNJScKslcxF/YrFWaXgWya1MA4aiB+KKmXKECUOgBN1eq+aS2hmhMKY0GUJniIK5+977LpjgaWsBWDA9P51D3dWfaq+mTNbFAuI1lq8QDMQw3MSQ4WAkougDxVBX6z9No9vty2trDEnJJsL5l8ogK0Ht8laGB0oWDK5+IIYHBDL2+zg7DvxmPScXKT4QkxU8KbXam94TvHQPysuu/SRIcUqlD4GSpo8mPik+D+dHKKXI135RDUsvt0tIIhSsLxQAM2fCP81VMOvqVuMbIYcFcRnbUq3Smj3CJPnU9dIIYZA4lV/xUaQu2eECSibrihxyBA3CPuWTCr/Hvif6b/Mt/IxInZ/TTWxeuzb9yz/N4PrBBFXeSm1VaaFjDIXvYuu9RttUHTttQXR/OXfdRVNg9HnNVZ73zNyA8bxBxSMzsqEf+WOVQFqyaWvDwucaQ1zj8brqcrAv5iovMOrbVFtYnDOPxn4iHJC35+TNfi3Vu/GbUOd1kpQXR1vARpAK/onjX0lqF4q4Ng2GFXd4LirQ8WL2EwoZ3As9DAiCQjDyxFOyd0DzZuWeZ7PhUJi/LcyU/c4xv+2ZLyk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(366016)(1800799024)(10070799003)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkNKNmVUb0NCVkRienEzc0JaL0JPcGJtU2d2OFpJUDBJY3NZQ3BYUEQxWURV?=
 =?utf-8?B?aFJmUlNKRE1WbmxqTTJxNHk0VWhtZWlEWkNSWnY5OUh1TEhHbEtCWThtV2Qv?=
 =?utf-8?B?SnRtVGZ6VUU3QWlSaUo2dXJPdTBoOWlvM1NkMzRFeGxyUmpkc2tJQkhiNkd1?=
 =?utf-8?B?MVJsVWorZWZZWnR1Rm56c3l1Z296aCsreUVzVW85djZRbjNLMHQxUmdyMUVB?=
 =?utf-8?B?VDBmeFN1bkRpenVCV3pqQ3JuN2UvUjl4VmtiVTJBbVRsRnMrK2xMQnh1NlhF?=
 =?utf-8?B?czduSXU0SnhVclcxanBFczBIUWRRT1JCSXNlckxsTDFFM0tpN2xESTBBemR4?=
 =?utf-8?B?a01rKzVES2E0UkhRUDloTlNaUjZlYUFuU25zY1dFMFpzUG9nVjhJVUtIZXlU?=
 =?utf-8?B?bUhxTzd6am92NmdycTFhOWdlOGNYa2syUG9nT003em1qcmIzdXBxZ0NGM0FJ?=
 =?utf-8?B?SEpFbC9MTGcrRElabmg1MFFGYnE0dWk0UlZxWDVyZm1ha2EydW1hc2liMHJo?=
 =?utf-8?B?K1Rsc2xNQ2ZyVmNLa1ovNnF1bTRrdE1Mc2s3NHBKUHBkV3UwVFJjZEtGZGRE?=
 =?utf-8?B?U243Qmg2TjJsbEJMMi9Mb0M4ZEN1Q3RnaWxwM3JDMjJ6ekdTWXVib3VJMjVX?=
 =?utf-8?B?MXZEaXVucE12bmptUnJDQ2lnc0NsekpDM1VSZi9yMGwwT05oazMzdFJWcFRV?=
 =?utf-8?B?MlhieHFBTTFYUUozdXc1eW1HVmVGTXpwWVlrQVNkcCtvUkNvbTVNWTlzd2FM?=
 =?utf-8?B?eXVGZTNZWS9oTERKTXMwUDlGT3Bwbmc5OHV5M2NSaGdhcCtJUHNRVG8rcVpl?=
 =?utf-8?B?d2Z5eVdqWGU2MGQrNWlJUUpERElMWFQ2RytHT1BGWDFKcWRKSkdwV0lSOVB0?=
 =?utf-8?B?aTRISmY5WmdGUFZIQUhRRVIzdXdlWTZhYTVlbWRROFVkeWNVQ3QvaTkwV2Uv?=
 =?utf-8?B?N1FTRG5STWVZMGtmT3M0RXFMNTRtU1diUGE4bG9sTnVtTmNCbjZWZjA5d1Jn?=
 =?utf-8?B?S3dJTGRKKzhzSU95Zkp5VVlGS2p0QXB5Y1VONytDTnBWQzJ6SnkxdlFFby90?=
 =?utf-8?B?MTFUWitCaEF5QW5aYzNlK0RpN3kzYkdjZGRNVGVyeUM2S0hqWEVUaHJEUkZt?=
 =?utf-8?B?a0VZS2N2YkhJbEdGRndaSmwwbWFVUTVVdVZDdDJTVC8yTmVwTDBOOURuRDBk?=
 =?utf-8?B?dHVXYTZnZFh4MEE2VW5sWkRVWmRQSGZCRVRiV3J6RzRnckFYOE4xcTJPbHo1?=
 =?utf-8?B?SDRkNGxocHJESmp3Qkk4RGRZSHpzNWFXUzkvL3JiKzN2VVVGRytibjJtejVS?=
 =?utf-8?B?Ui9YT3hWaFZaZSs2SjNRSU9aSjN2UXdEeTg3WDg1YTNBenBRWXVOMDBCNlFO?=
 =?utf-8?B?WjJhVW1pTDBEUzk3YmFJSDh0UWNsaEdwQXIwOXdqWGloTmYxMmx3L0loMGtL?=
 =?utf-8?B?d0FJaVVML3BIOGowSmFEQUxOYWtJeE42VFhDSkFrbWllL3QxY0Z1TThta2c4?=
 =?utf-8?B?NHd0NHZ0cWNsemtTQ0lWQVA5Q0d4U2JyMDVaZ3crc29pY3c3TzFaMG0wQmFK?=
 =?utf-8?B?b0EweXlaVmt6N3Jna2RtKzVlNFEzSTRqR3cxblpjWlNnTFhjaHJtQlVqM0Rv?=
 =?utf-8?B?Rld2NkhHSEJPUTU0VVRUVWNRNytFc1VnR0g4d09URE15YVF2dXdsQlF2UjU3?=
 =?utf-8?B?bDlpdXJQaEl2cWRGZ3p6ZnQxcDVmYjdZajMwZkZCV0I0dHYrelBpOGRnVUFR?=
 =?utf-8?B?Z0YvenlNSGRHMjFaUmczVDU3Zm05UDRsQm5LWi84NzFraFlNYXJqRFJDcXhn?=
 =?utf-8?B?UDFPK0NRMnhsVXYrR0c0R2ZrVXNRVnMzNVFmZzJvbDhlSnhqeEJkSFM0eStj?=
 =?utf-8?B?dWtvZHhGVEJydERFMjNiVVlZeW9KMm92VTVwWElCMThLM2hsdW44QTBUUThG?=
 =?utf-8?B?TUFtTG1tS3BISzRCQzNuQlhlbkx6UGQ1OXdSYmxYTXdzei82cWlWOTFaMnBQ?=
 =?utf-8?B?M0hESEpyTXZrOXRvOXRYY1h0RC9PajVWYThvQ2RvdWpzMUszSWxVdVJxZFpI?=
 =?utf-8?B?UGJ4cDJGRlFaV0N2a0E3TXhzT3RFcW1uUzVwdjNlTENraEZ0bWZTK08zMU11?=
 =?utf-8?B?RVFDSDk5L2ZxamduYWNxbTNiS21QN2pCZWdoRzQ1Qml1UXJqNCt0SmZ0UGZk?=
 =?utf-8?B?bVNIcUVsZlhvcHdpcDg2SHdNcFhDVHpvRmZTUGJ4QnRPQjRnSVNid3NEYjVV?=
 =?utf-8?B?S2F0Z3dhTUY3MkxYMkpPaytCM1NyL2xYa25ja1hnbi9rMlJHVWdOUlFiZ2Qv?=
 =?utf-8?B?UVpTcndRekxNOXFUTW0wRnJOSWR1amJQWHViRDVQODhwWmhOM0NnTWgyRVNm?=
 =?utf-8?Q?MdokxQ7IwsUxWIpNff8gWxJeEgxPh4A+sd1Sp1bZKTJs1?=
X-MS-Exchange-AntiSpam-MessageData-1: Dm0Jp6jjQe7S9g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f44d28ee-0d69-480e-fc84-08def5bdacf3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 02:26:53.8044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JDDMtx/gf7leq07oJGiBjs29QDCuNGzNLeNI6Nr/v52xUOYdfcicnOdln44NSo9Kl4z7YKILkPR9w80vlZ+PSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5684

On Fri Aug 7, 2026 at 9:10 PM JST, FUJITA Tomonori wrote:
>>> +
>>> +impl TimeUnit for Nsec {
>>> +    type Repr =3D i64;
>>> +}
>>> +
>>>  /// A span of time.
>>>  ///
>>> -/// This struct represents a span of time, with its value stored as na=
noseconds.
>>> -/// The value can represent any valid i64 value, including negative, z=
ero, and
>>> -/// positive numbers.
>>> +/// The span is stored in the unit given by the type parameter `U` (se=
e
>>> +/// [`TimeUnit`]); its value has type `U::Repr`. `U` defaults to [`Nse=
c`], so a
>>> +/// plain [`Delta`] is a span in nanoseconds. The value can be negativ=
e, zero, or
>>> +/// positive.
>>>  #[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord, Debug)]
>>> -pub struct Delta {
>>> -    nanos: i64,
>>> +pub struct Delta<U: TimeUnit =3D Nsec> {
>>> +    value: U::Repr,
>>>  }
>>> =20
>>>  impl ops::Add for Delta {
>>=20
>> When you add `Jiffy` later, this impl block will only cover
>> `Delta<Nsec>`. Is that intentional, or did you intend to support
>> all these operations operations for `Delta<Jiffy>` as well?
>
> Intentional. Delta<Jiffy> exists to carry a jiffies-valued timeout
> across the C boundary; it is not meant as a general arithmetic type. I
> can add them if a user needs them.

Is there a reason for not doing it now? Common arithmetic sounds useful
for any unit, and since they are already agreed to panic at the bounds
we can constrain them on `U` implementing the corresponding traits.
