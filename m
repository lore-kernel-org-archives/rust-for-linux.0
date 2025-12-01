Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010050.outbound.protection.outlook.com [52.101.56.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DC56FC5;
	Mon,  1 Dec 2025 03:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764560686; cv=fail; b=Q0IayhtEAWtFHP8mKdMTarV/cPZ70IlaGZD/La+/PclKojqa56EQvJ/pD1vMLdN94VQLTK10WWQjNVSgpZ7QcKfVZ3UG5cT2N1DLcuaY27rjalPGXEuZG10BCN7pLWwvIXAgx1YRrDK5i8H+qRsKKGdqjl86l5hDjrpioGsvPD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764560686; c=relaxed/simple;
	bh=arm/YZdwwopG6l0em+fW0ary73FmjzdFbwdZk6QH+zc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Y1gTMXFZV6Jbj49NNU+/o/eLgiNuzQn6bcsDukoxrWdaxBs0YLCrBEj0Xk1AdRL4ZnY4qxPhQ5TPtsLK641VyP5pj/2eutcJFNztsk9bOgnG1Ma92a7o2FdhAoH4LUMvcQ3zgyAZ+75/kPQkRyz8VUbpHF0QJr5wO+spo87uAss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RY3gHosp; arc=fail smtp.client-ip=52.101.56.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RY3gHosp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCIWcWcsTx9MrgXM2HQWp28UUqB3onrKQUDNnRMmZbNgDbFBQBxBdh9voMJ8rfYl3KB1tWDMyMxkYyCP3wWbQN5KxxOzPYbNYZN1/UYnfRj6bCJHJJsgaCDwVluhPhOtmzsrVwugmAOSvUTN9cJUJqNTtKe3KFW7OK3TclULTNTCTGAo6hC44wPlqWP1b4BWRceh5jkDeUpGTalngfamZoW/SulZSfoK7OO0tpzbNXE5ENUO3l0r62qwwTzoFt1rtnlnZHnEGSHz2YppNCFbHZo5oCK2lY4MOx27lI0YWL4QVuPwOTXuRlmqHygsQqZK/XArDvobgl6iNUtlMw2lpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pi0bElamze5D0kQy3gz9Fz0U+ifAKEgvEkZncn/VJqw=;
 b=sPMeNWJFZOyTiM7YeXnmGawD/Q38mZ5YZVk05bC/nDGHOg2V5/srf/RML/Mal6VuQcFFgyRp7iYh6csT2x8FyTOmbWyeU9wpcTBLhXZLNYEZgiO9gp5/f8xaPJwR/XErEkhqe1QkH5Hgu55ixHeWoRDoT/llQI5fnXshdSGELuids+4sCVNzHvfAO/ATdMRGP0n/AtdQZT1KUPIQeThNcrr4X7QDsZgXrNM94ttyaShZEN4v9PUdc4JdGJaL2TmsntFdjpGWrKFxFex5asXZf9ytJCob7LaYIeX8wCtxo9djvC74TYTU4PFdTtbXCE8VjWoqasGBvLB9grvr3rYLcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pi0bElamze5D0kQy3gz9Fz0U+ifAKEgvEkZncn/VJqw=;
 b=RY3gHosp0ATCcoQ2MF13Kq3uVRQy3eJOy1bY3LSU50/z1SzmfFMmJmuyliCjNpB8wbZy7FvYdOTBM9lDZewzczK6LQa6h5FYo4KIcjP53gUy4WgSug5b4/LdkkFNn9/En8UH3OkczsR3/7h/zPd9S4eu6mC2I7jh07Xxln/pezasez5354duc5DZ3WdsetKUIAb/phKn6lJtyS3ls0PZflgUL2MTPWdCRbY9jT4Sgn79F/dd8oFgGP8n0bYmAskjOUCBlKI5WTJC+DDdOdewVJYUQ8dMmwGDURfJAFhMABmNBqzy6iLC1w+3zipDv+H/n2hhzTHmlcrOyWgtcnzORw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV5PR12MB9777.namprd12.prod.outlook.com (2603:10b6:408:2b7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 03:44:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 03:44:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Dec 2025 12:44:38 +0900
Message-Id: <DEMKK0Z8DWR1.3EBQYP6YO32JA@nvidia.com>
Cc: <david.m.ertman@intel.com>, <ira.weiny@intel.com>, <leon@kernel.org>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: auxiliary: use `pin_init::zeroed()` for  device
 ID
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Atharv Dubey"
 <atharvd440@gmail.com>, <gregkh@linuxfoundation.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251129124706.26263-1-atharvd440@gmail.com>
 <DEMKCLMSAUUX.1Y5ZKG3T3PC1K@nvidia.com>
In-Reply-To: <DEMKCLMSAUUX.1Y5ZKG3T3PC1K@nvidia.com>
X-ClientProxiedBy: TYCP286CA0146.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV5PR12MB9777:EE_
X-MS-Office365-Filtering-Correlation-Id: 8471ca66-8b53-436f-27fe-08de308bf5f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wk52dFBta2RwYU56UzlMeWJ4dnpwVU5WdVVvU3p2OEUwWHdXbzdzdGFZQ0dQ?=
 =?utf-8?B?eXEydGV3N1lrN0JTUDZ4eTZYZ3I0blpTejhod050ZEZaMnB1d3NNd1lMckgy?=
 =?utf-8?B?QU5aNXlsdC9IR3dObFRoTVBySFR0ekViMTNaV0NGclpLQzhwMlpFK2xuZXFZ?=
 =?utf-8?B?aW84UzRRcXhXdW5keldhOUJESlVnQmxsVDcvMGV1KzN5aVlYcGluTG5JWWFC?=
 =?utf-8?B?WmhsVy9TMmFRWUN6RlFscWxWelY0VGdiZ0pueGZnb0FPS2xXcGFBS1RHb0Qr?=
 =?utf-8?B?U2xrWVV5NHFyZ1JTRFlSUStYZklDdkhLTllZK3NjaVRXSjNyUDJ1dGZSWFd0?=
 =?utf-8?B?TnNkRVkyaTN5Z3Vla2tIeEtiUko2YlI1amZTbGs4em5vQnAvV0l4ZC9rTi9W?=
 =?utf-8?B?TlQyZ1dVQ2MzeEorS3ZBQXVuM0dxd2VwUFFCSVZoMm5PTHlhR3pRNDlTdDdM?=
 =?utf-8?B?ZmRBUHNkR3JpbVRzUlR4SHJuM1Y1Qzh3clc2ZUIvR0daNHRKUW5TL3dsV2lt?=
 =?utf-8?B?V1F4SFBqZHJ6eWpHY2t2VzdYZWpGMm5LZDM5QytLaHJnT0lNN3BqWndMc0Rv?=
 =?utf-8?B?cWJhWEVDSis5UXNzbkRzdnRMOWFsTkxwMWNXQkFDazJWS1F0VkZMc00wSk9r?=
 =?utf-8?B?UmVEZTBGbGNzMU1mM2Z5UlRlMlVzZzcyeCs0WUkyTDJtMS8ycjhqb0pXNzlU?=
 =?utf-8?B?b0JvSFQ5THNWalJ0cFp1eHo0VVhYQkMvU3dFSzM3QXBuRmErL0JvQU13YW14?=
 =?utf-8?B?VXh2SHhnVXpCeXdSU0RzQm9yTG5iUmpGMVdUUS91emlzelBqd21pYXNyeWlh?=
 =?utf-8?B?TTVKVkk2UnNxWEtNQXIyU0tuM2lLRVp3WVdXTlRGNWxXQ2VKT0E3dlFzTUdY?=
 =?utf-8?B?NVJFVi9PcnNPRU1lUURrL3dEWUhSejNzK2RrdkZjMTM5cEsvL1VsRTdYSndo?=
 =?utf-8?B?MFIvNlpvWGQ2WW5SdzI0L3BiYmRDb1JCWG5ERGs5UlV2YTlFOWRFRTlxZlR1?=
 =?utf-8?B?TUVpSDFqT3BqWGNvcXZjRlU5M1BkeGhadEtlUW1QTUlDM1ppQ1EzSVl3SW5w?=
 =?utf-8?B?eXhyK2NMMGFSaDM0Y3FqODJwNURHS05NQ1MzUEhlZW90VCtRcUJVTGNmWXZx?=
 =?utf-8?B?NGw0S1RMUEMzaUpLSjdpZUJDeUZ2ZTQwckkvNkJ3d0lkVEFBdFZBbGl5NFJX?=
 =?utf-8?B?Y2VSNWJERW5IVm9nTFArMExaQ0dLQTdXYXNnN1FTcHQ1UFdTTE9hZGlGWFFC?=
 =?utf-8?B?WUpTUXZpT1RjUm0xc3NpamphZTh2bFM0L1pMeWYzZ1RXQVJkRGdtdmwraHVv?=
 =?utf-8?B?ckthZXhGbzZ4VDgyYkhDaDg5Sm1zKzBWOHNxZkxYbkVWMi9nNzFlR3hNNUdY?=
 =?utf-8?B?UXZtR0x2cVhDNjJLZkpvSFBlajBIOVc5cGgzS081VTdlczhQTkIxdERXd2NS?=
 =?utf-8?B?S0Q0STFHbDVaanpGWU9uc1MvbURmNzVwNG0xU3psUEkyVHJtNlJpUjU3RnZE?=
 =?utf-8?B?Tno3MjJOT1Z1M3RhTHdyQllJNU5rQXp0T25rY1kyVE9Ua0lXdEF1VjQ2MXMy?=
 =?utf-8?B?ZWl2N3l3RmZaQVhKM1lySEF2eXdKeE4rYUk5NTQvRVdmN2c1Y2MzR0xIbEd0?=
 =?utf-8?B?UGhDbXdCSGowZk1pZ2xWRzJIcDBQelp1dFlZdUZsOVFyS2tnZ0hicWdlUmhv?=
 =?utf-8?B?amlqVVd6YURpQ3lleGUyc3EyOWtyZFZ6YUR6bUZsa0J3Zk9nOTNjdHEvaldj?=
 =?utf-8?B?VHMyaGdpYXY0cHBQcnRQZGUvMENQVzBNdXdKQ3BTN1VoT25TUm5JMXgrMUt3?=
 =?utf-8?B?bUVtcWJiZk51ejVQa05ycVRDRzE1ZGROUUVVdlpiNStNWk1LR1JHVWJDYWh3?=
 =?utf-8?B?Zk9xWjhMQjA3M1k3Q2NCeEVYM1BzK3E0YnRqRVdkR2FJVUlCeTZlSTd4LzVQ?=
 =?utf-8?Q?s0eEvxIPEx25c8nX4RpS9LtmAq5M5vAi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3pIYkMvUDFWVG1oREsyV0diNHgwS0laMU0yWXRKUjNyUHNQNzZkRjIyN3Jh?=
 =?utf-8?B?akcvQTVLMGFwZHJSbHFsRG9IdzA0cyt5ZWtZUDNkQVN0NW9xNkNBMmRzRzhh?=
 =?utf-8?B?cGdaSUJZRi9nTDRHazBXcVUxNEN4TTFvY20ycnlNTnh1dkNrNFlmQWV2aWp5?=
 =?utf-8?B?K01JYWo2TW9IQUJiSVM2aDM0Wi9zTTI1by9kNGdBM2pWSndOc1RGYWJOVWNI?=
 =?utf-8?B?eVpiN1lIL0dUdk9NWTBoYWRYM01QTmJUcWtwN3Yza0FJQWdaNU5ua0Z3dWw4?=
 =?utf-8?B?MDFmWFFQbmRvYi9hY2ZSbU9WNjJMZ210aUdPd0VoLys2dS9rWEVmVFNSODVn?=
 =?utf-8?B?ZUluVTBIeGdwV3Zqdndua3E1WXE2a0ZiWlZTQkF5WkxSVzRKSlQ5UlIyZksx?=
 =?utf-8?B?amZXaGdheWdPbFF3LzNtejdhbkpUOVhiZjlMRm4yQUI2OWx2dmQxQ21TRkdI?=
 =?utf-8?B?SGZLRU5mUUZSZ2Znb0FYM3VzbjIzYXN2ZUJLZUVZM0pvWjhyQUxpS0I5ZHBD?=
 =?utf-8?B?NC9lb0dqY241ZUsweGt5QjBncnRFSFBCZys2T1ZKaloydVFvWTVvSHZ0d2JC?=
 =?utf-8?B?bU9zaUhZaSt4SmJDeWRpMUhJUzBLZWt2Mm1DWWZyQWx1T0hmb1FoK1ZwVUlP?=
 =?utf-8?B?bWtUc3lUaEl4QWtLQ01ta21nUUV2MjlUTVBaOGNCS1JQVDcySGdpcERXRURY?=
 =?utf-8?B?OFQwaXRmVEdQd1pYYXIwdWhTQ2ZoWHVoVTVZcklROGNYcnF6a29tbW9VaDdi?=
 =?utf-8?B?cjgyUVZzRE5BT2gzZmdzbE0vRXpFUXVrZ3dOTEYxQnYzREgyUTFjcEtQaHdx?=
 =?utf-8?B?ME5sWXAvVmFJOHJwYkxIZXB4bVp3NEt3bndNOFgvL2VlSnp0YlpsY1Vqc2JX?=
 =?utf-8?B?MGQ0T1dOdnArMmZ5RlZWbEl0Yldqam9hL0cxVG51Y2dTK1R3OGZYMGxSRjlq?=
 =?utf-8?B?WENaSnpGNDBwNSt1NksrR0JxNzFkcTk4UTBrQ0pTdTIrb2ZDczV0aTJwTFRS?=
 =?utf-8?B?MlR3TUxRZE9LZU82K29kMFgweXMxQXo5WlBLcDN3MktDQXA4bm1sekZOdk1I?=
 =?utf-8?B?VTdNZXJvbXZaZDAxKytuVHlIbVM1UEM1V3Zjdk9XQzE4VVd3eU1VZi9KYTQ5?=
 =?utf-8?B?cEpaR1k1ZGY5OTlwT3VaTkRTbWI0cmt0dGVFbVlTMlF6djVNVWFmNVlHUWhL?=
 =?utf-8?B?WVBjQ0prWmZPTGN2RlZ5aTlCN2ZZN1BUeWVWbHlDQUtrQXRsQ1hVWVpPdHV6?=
 =?utf-8?B?MTlJeGZVWGFpSmdGczdqQ3pWREg3YVVHNjZONVBwQkRCU2o5Sm1Vei8yTTVL?=
 =?utf-8?B?QmRBZTBaeitCSXl6cDBqT3IyL2ZjdU5HemNad1lHRFllcHhGQTNqVjc2Y0JW?=
 =?utf-8?B?aUltVGxtYzZObS91andrSEhoNHhhOFNTVGNFaHlNbnQ3dXZtMkRPVDE4M1Q0?=
 =?utf-8?B?Rnp4N0RYcXdzejBuM1ZpNVh0UEppdmp4ajkwaGd6cGt5QVAvTWwzVkwxSDJD?=
 =?utf-8?B?QTZkQXVlbmsydFA1ZTlocFR6ZFJodGZ2ZW9uaURySmNhaDhnajY1bW5waCth?=
 =?utf-8?B?eTR0bVpucVRVdzNwNHhrU1FwNUo3ZEx5MHMrKzBodTRWZm5TMS9Kdk1HdWNZ?=
 =?utf-8?B?dHpScnh6NXhDdWRSRE5mczlSZFNLcXRrNHROQ05GTW52OTkzazlUUFBlbTVN?=
 =?utf-8?B?MTVVNzUvc2IvSHVqRFpZYm1qZUthaWl5eUtHS2NNb0xZQ2Y4ME4raHN2V1M2?=
 =?utf-8?B?QXpsSEFaRm5NdlBpSXZqU1FqSEZwZEJEdHpBM1gvN0NmYVhrUGQ2K09VQTQw?=
 =?utf-8?B?ZDlvckJMbjB2MnM3cEtGbW95d25nREsvM0tpNERTL0FxamJ5OVNkaGprZmtE?=
 =?utf-8?B?ZTJTYW51Z1N2RWRnSGN4NmFtYkpjSFFYbEp1UzZhVktDSkhNbHAxRm13S1NR?=
 =?utf-8?B?M1ZiNEZuZ1RZRVg2MExoeWNSdmFKMVZEKzgydTNNVmtHSHhhdkFVaEVWNGxV?=
 =?utf-8?B?UHlkWHd2cFlVNWhrem5waDY1dTI3SG9ZWll6Y2RGeFVNM09xUzdBVEhETUhX?=
 =?utf-8?B?bnJ2cTYxU0dzV2w2S0dDd09LbEREWUNxNkJYbDBiNWJpME5WUlBpK2E2Rlpv?=
 =?utf-8?B?RitHRjZyQzgyZU0wRDJYcmdjRU5qVk9yMlE5NlMzMlQvWm50OEw0b3ZjTHA1?=
 =?utf-8?Q?y9sLiFg+abmI+Cy2BlyO4Mz0d50N6Ep7uiTrr3BwmNai?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8471ca66-8b53-436f-27fe-08de308bf5f8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 03:44:41.9312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXjIlYO1PgnyafEJAW+bL5xjvOYGRTyiK4yvgqB59OR9IKkEdu/qNUbKavSL0u76I0Pj62CcbG7ULzWr7vMi3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9777

On Mon Dec 1, 2025 at 12:34 PM JST, Alexandre Courbot wrote:
> On Sat Nov 29, 2025 at 9:47 PM JST, Atharv Dubey wrote:
>> Replace the previous `unsafe { core::mem::zeroed() }` initialization
>> for `bindings::auxillary_device_id` with `pin_init::zeroed()`. This remo=
ves
>> the explicit unsafe block and uses the safer pinned zero-initialization
>> helper.
>>
>> Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
>> ---
>>  rust/kernel/auxiliary.rs | 6 +-----
>>  1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
>> index 7a3b0b9c418e..67c5d356d754 100644
>> --- a/rust/kernel/auxiliary.rs
>> +++ b/rust/kernel/auxiliary.rs
>> @@ -108,11 +108,7 @@ pub const fn new(modname: &'static CStr, name: &'st=
atic CStr) -> Self {
>>          let name =3D name.to_bytes_with_nul();
>>          let modname =3D modname.to_bytes_with_nul();
>> =20
>> -        // TODO: Replace with `bindings::auxiliary_device_id::default()=
` once stabilized for
>> -        // `const`.
>
> I'd still keep this `TODO`, a `Default` implementation is more adequate
> that `Zeroable` here even if they end up doing the same.

... or maybe not, after all if a type implements `Zeroable` this means
that all zeroes is a valid initial value for it. Let's see what others
think about this.
