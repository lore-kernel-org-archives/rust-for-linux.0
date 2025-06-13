Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5202672608
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Jun 2025 20:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749845314; cv=fail; b=bKvDDAp/1EF6ITjo7L4D0F0060CZnrRsg2y9HwIfWAUEEBYKN0uuHTKEX2XbHH372chmEow81fYPV7okuwvKTCvv1/1pYbJhWCaEjZlLvsLeTj0sXlHXy8iMKn6CWAQQoIoMl9w3Tst+uBy43H4qohLXRthp0349w2Vhz4Fwzy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749845314; c=relaxed/simple;
	bh=VSVPTnwYTQDZto8XGlvU8LP3jsTtFDN0suwRKRQJrSY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jsGNQ/M1ZKn1KjrbDJTOhY4gbRvgwTNYl0U3mzLrneLf0dJttk0ob5j//n9XaiZNU8h1HwAd6Sw8cWuXFSJvYPW2BVFsYFMqAPLUBByUEk0LkhOxOJI173bfp4O0Wg3QY3uNgmVMdlmtPwEIKWmQOv1lK+yUncbNmuto4BkK6RU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Svx3udmk; arc=fail smtp.client-ip=40.107.93.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Svx3udmk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGAlYBL0Malrf6dS/iXtXBqtEKjSGO3rF17v2MP4DvMfF+MVrHCKGcumnxa6lA1fcC8mTWMEcHe+xGkX8HU/zyGNX9av3VTjDvGV6dIMYiNNGzI6t9lYv2yH+6c21UJWeNoEOkaXR6N9DlTkVIgJYUDWs15PSErUPpJwDyA5cN8ocWIYldh3dU+PhZ8uoqWa12aaBAiCKgbew7N98TR4NHw0U7tl1wjDuW6RVeUEQARCjZlWggRr3ojl2ocbQekK49WoQzszimapTIjf0ijPerO3ql/1My4TRfjfGfUnqAjUp3qilKzK5URlQ+c1YXMcoT/Suv6XExXDWh+rn22cqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSVPTnwYTQDZto8XGlvU8LP3jsTtFDN0suwRKRQJrSY=;
 b=B9Z25BcIDaJf/hbKZRyCWlC/UBbWGSpuayjT5Qocz5Yn9/EEWpcshjHyLNnt0UgKU5hL2BUji7H2+FCbdfEY7/o53cXwJckRj8wqtIL+oI02bZZVptxGf4VvSF4oPrKmoaJGCu9NjB8mAr/xAbTPYRut6VomxZvpKYrt7Rm3rCqDgJsp0tMwC+2iQuh5vdnzRR6USDYJAY4TpIT5DGB3Sz0sh5DOQpFUAgjz4FjecgOWG7Ufx3Wg9NaIgtx/2Dv8ocNwzKVrxqBsm5sWextu4SSmG6rIM21bUC8hSh6YV/9gW27/Q0ettM1sQndpMVbCx2B/8fctHiCtQSkDqqAMLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSVPTnwYTQDZto8XGlvU8LP3jsTtFDN0suwRKRQJrSY=;
 b=Svx3udmk44+en9oI3ZJIHXhDHRSJ9nakC27r2xojwr37ZjmspCOxSPriXo0JEKJN/hNFJGG8NmwHJnerwUggz5uj93ohHNB/1mDFsrZG5eMixFPjXtYZG3Xh/pvTFOaZEHga+bwy4FlZtTby+LLzszao2zJ/dwG6FzQVfnY8drb1HGkbIPJS2QGJczH+gFB9Rj58m7whi932KieV8J6N+FsRS2fyxqz9rhWTkRH0DIC3+hagdu4KHS7cwVci+YlHCLm2Hq/JWy6FFQArb5CMwlxHQYXRgPwKKG2DFcS2KXoubnJ7aLDzNwzQQjwn12AUDTHWkt7U61qiaV+wTRd50A==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by BN5PR12MB9511.namprd12.prod.outlook.com (2603:10b6:408:2a9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 20:08:29 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 20:08:29 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "miguel.ojeda.sandonis@gmail.com" <miguel.ojeda.sandonis@gmail.com>
CC: "ojeda@kernel.org" <ojeda@kernel.org>, "aliceryhl@google.com"
	<aliceryhl@google.com>, "lossin@kernel.org" <lossin@kernel.org>,
	"dakr@kernel.org" <dakr@kernel.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: introduce sfile macro for succinct code tracing
Thread-Topic: [PATCH v3] rust: introduce sfile macro for succinct code tracing
Thread-Index: AQHb2Y76GidriUYRM02FngySpVCBwLP8FOaAgAVCIICAAA8NgIAAFa8AgAAO+gA=
Date: Fri, 13 Jun 2025 20:08:29 +0000
Message-ID: <2b3c88475228d3af65dfa8f97e0d41c289105813.camel@nvidia.com>
References: <20250609223606.2897030-1-ttabi@nvidia.com>
	 <DAIPZJ4YMJOI.2HYMHADQG1YER@kernel.org>
	 <68b469afff19b8612cd1d8502166a9c868fa8ea8.camel@nvidia.com>
	 <CANiq72m6VxkB1GNL=t_Tq+bXSjXYeZjagP_FK5AfLWynvdd67w@mail.gmail.com>
	 <ed233989116edf9c285e1e4b20a1756c98d509cd.camel@nvidia.com>
In-Reply-To: <ed233989116edf9c285e1e4b20a1756c98d509cd.camel@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|BN5PR12MB9511:EE_
x-ms-office365-filtering-correlation-id: 2d871a14-de0f-4847-a461-08ddaab610b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UkhXcmk2N2dzUVJpOVVJaEpmeTZ6OWxWdzRXdU96TUlCdTE2VTdsbkFKd1Vk?=
 =?utf-8?B?MFNsM3Qrajl5UG04ZGJTZXV6RUM5OVBSeFpnRzl0M2N2bE00dFZ4TXdDcnE3?=
 =?utf-8?B?ZGpNWXB2ZkRaUjA0ZTYrNGxLZi80eTMxOUI3MmxTY2R5MlJkVjd3eGRMTkVZ?=
 =?utf-8?B?VnhsekVwdU1rS2hHWjR3ZXB4TkhQOGM3OHFLanZFZUZiYm9qTkdGcUN6MXF1?=
 =?utf-8?B?L2MzcldHU2gvOFFYQ0dLY2VuQXV6Q3VyZW5tNzkwbFY3eTZsazJmZ1lmUUpI?=
 =?utf-8?B?ZjlhZUtQYjNxeU5NeDNMWGVWRlh6RGJ2L1dDaUhqaDF2ZGg5K0RpUzBNN2F3?=
 =?utf-8?B?eHhTRDVXZCtoa3JPV2t4MmQ5OUFNUFRqQ3RDb2luMEFla1JMblFGSjd4alJY?=
 =?utf-8?B?QmVmbk9wZjFra3NlSlFZTVk0TTZrcEhlb1VTVTlKZnluY3c5WUcvT1JZelNZ?=
 =?utf-8?B?TTJRaGkyUGxlM1lSZUJrbzM2cUFla29OQjRDUXVlWjh1RG1ocWI5aitLVWs5?=
 =?utf-8?B?ZVgwY2p5eGdsWGdZSjJ0OWozSlpvbld4UDlONlQreC9zMHZjR1BsQVJYdUls?=
 =?utf-8?B?WDloM3NKR25hLzl0aHozOVhDMDk1ZWxuejNrV3ZlN0FISHFZMWtQQi9QL1JN?=
 =?utf-8?B?UTlpYUhMaTVrNUVhK2p0TjhLTklZekNlT1JNMjlHcWs5dS9nVmxMbFFXL1B0?=
 =?utf-8?B?RzVVUWFDdm4zRGovVnQ0L3NKTWhMVURkN2VzazFGakUrcjhKWmJQdHpkcVFF?=
 =?utf-8?B?UUNDbHJqeG9jTmtQT0REUURuRVVxTDVubkxBUm9HeEZJVTlBbjRwQkZNZmxY?=
 =?utf-8?B?Z01PNzRNb3ArS0ZWVGRoTVZ3Nkt1S2dNVHlvVlFhS3gzTUtMUmZDQ2NTamxQ?=
 =?utf-8?B?WjhIQ3cweXREeEREMXcwNnRvQk5wMUpJelNjTlo2NHhpdk9VUE5zMGJDd1hH?=
 =?utf-8?B?S0JuSEZHZjJOL1ROMUYwMjRUTDhNWXYvaC9uTkozNGJ6ZXZ6TkhiSjFoenBp?=
 =?utf-8?B?cWhPa0RHRXZUM05kSzVVSUlZZnhDNnQveFFTb1g0enhJanhWQUZmUG92R1d5?=
 =?utf-8?B?RzFHVDlNYWlrZ21UaDNNWUsvNDJsdUxrZXZ0MHVoUEV6U2RsNmtwMXhjZDlL?=
 =?utf-8?B?eGhVOXU2RnZxUnJtNkE3SmZUMG5wRDFNYW5RKzVpS1NiSUlYNVZBbmtTSXVU?=
 =?utf-8?B?MnVFTHdNTG1QYWZ3NlUzMkFDRHZxS0g1TEVoMUg2SWl3VXJUS3ZrVE9yc1NR?=
 =?utf-8?B?cWlHT01lc2o1UWp2NlBMOXhPVlg2YjRhWUxsdGl5SHVneW8vOE02ZXFiNkYw?=
 =?utf-8?B?ZVhYK0FIeFFaNkhuUjVMa0ZzYTRLTVVJaC82RjJidG5FM0VySlBxdFFLck5J?=
 =?utf-8?B?bmxmQ3lscXFpbTRKUnhxZkh1NG5MbEYvKzZ3WGtIeXIxS2hxZ1ZwSVZSb0l5?=
 =?utf-8?B?UjFnSWxmSDdGNTdTclNSaTdFSlN2enZwR1hqcTVYVDJaUU1Bc2ZSeWd3bXg0?=
 =?utf-8?B?cFE5UkNJNW9BVERhcWJzdERWNWFUWEFlR1JaM0tpTTZoWWJRU2JuNW5PdFBn?=
 =?utf-8?B?TXNJRXR5eStWckk3cFRkOGFHcFNFYmRDUVBCMk82RURzTEJTQXpzMVZDR2JI?=
 =?utf-8?B?dk0vSnVqZkxud2V5dWdISGhxakVmY3JGZnJ4L3hBN3ZhWTI4QVJlamViVTJL?=
 =?utf-8?B?U0YxcWNyR0k5a1d1WWs2ZzkzNERXMnJrdFl0Z2s5bERPM0JYRlJTT3I3eGF0?=
 =?utf-8?B?NVRXRGt4UjRobXFVU0I0WTd5VXQxODhYZVVzNHVpcXlFd1lqbzMveFpueEpM?=
 =?utf-8?B?S2xQK2h1ZGNRLzhZdzh3ZGtkVGdSbVVqeE5lbFFjQTlrTkxycHJEUUMxM0NB?=
 =?utf-8?B?M2xVSURydzVxMjdKSHFWb2tYb0NaMDduRlc3WnNXRzFCam1YaEhhWWxZSkV1?=
 =?utf-8?B?dTdzd2tabWJYYVh3SnF0bDZZOUVNcjRvRkQvamJFdWNzb1ZhYVFPdWRNUG1N?=
 =?utf-8?B?aytQZXVUUmVBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N1ZGbnRYYjRzWFBxWWo0QlJ0VG9jbmlETEV2L1ZaTmcra3c1dHYwMnhrQTRQ?=
 =?utf-8?B?VEJPRGVmT0pNaUM3WGhFNnhJdTJiRW5GYnV6eWpvNDd3OHNUSWFYa1ZuWUxU?=
 =?utf-8?B?Tk4rT3lRTDFzaElBaC9HTU9Na3NXQlFFN0ExQjkrVFpPb1hjZjZSWVpvazZq?=
 =?utf-8?B?Tmx2V0NSbm5USGtyUHRacHhQQjQ5QXRxK2I1bUdBN3NrZE1vWWpoWlhFT05m?=
 =?utf-8?B?bkVzTlo3UVMvbjY2ZmY0OVp1QlEyNjBpSXI3UGtEMWFkNXg4VVlHY3loSUVw?=
 =?utf-8?B?UE9aMGVDUUZJU0JEV1ZUMm8vanJxMFFMN215Q1I4MFZwaEtHbGV0UVU0ZFNz?=
 =?utf-8?B?QmI4NFBTOS9KWkVxSDR1RjlWbVZYWXg1TGFjbm83VjhqdHRjR2ZCbTk1MGlj?=
 =?utf-8?B?YU1qUS9OTm1pR3VKN2xXVW9PemErcVN2MzZXWkhKTFh2THRQRXY3eGM5ZzZk?=
 =?utf-8?B?bFhlRGd3dXAwbHFJaEgwbDhVTXVKT1hSR3lWUXJuYmNoZFQ0aDljcjRWWjRk?=
 =?utf-8?B?N3hUUk8xWmVKZDRXZUMzNEpValZFWVVoVWNmd0dNTzN5eUpxdmZDaDkwQ2Qx?=
 =?utf-8?B?YzlyNVl4SllMNVNHZW5nN3g5VDY1YlUyZGFob0RXYzNseitCVXBWM2ZzVzNC?=
 =?utf-8?B?UTR1dHJ3Znh3WjhNeDJ0ZXcxZHFua0UzVjdzNEtLSkpFcXJRdHpubDk4WXhZ?=
 =?utf-8?B?Y0g0dnIwZE5QYk5YOFZxWXp1NDF1eVByZWt2VXhKTFBMUDlrUHlyOUROQThH?=
 =?utf-8?B?bnR4KzcwcGN6WXoySWI3dmFFZFMxN3I0dk5WN204eG1CQUtxUDlteXNGWFRv?=
 =?utf-8?B?bE1Bczd5UTJ0bTlUTWVDSTJKYzVtaWFvVXcwMEpMQTUrbUxlQUFZWXJwTWpj?=
 =?utf-8?B?bkNMTzJxaERMdU50VHliY2kwQ2hudnhoZjdiZTRiOVJCUWRtN3FHWmRlcFo4?=
 =?utf-8?B?RkpQRndiSDNxSC93dHRVMzV1cURqQkNSS2ZBYmZ2Q2VvYUpvWHoyVmp4by82?=
 =?utf-8?B?WlpibUdWS2U3SVVXdUJhV0FiR2FtMHc3QS9DWEw1a2tZekhndFlpY09kY1Zn?=
 =?utf-8?B?a1RveWNyN0xkRFEvalVTSHFoQTBFSTdaUytONlRuTGZpQkJIMmxQWGFiRU1i?=
 =?utf-8?B?b0JvRjRnRUF1LzBTcUt6di8zWVhmVUE4L2JHTlUwdk1PQ0QycERoYXhmeUxB?=
 =?utf-8?B?dkZWaVRRVHJTTXlTSHByMm44TlExd1cwSHdLVU9pakVkWUN6QURUaGoyeHdu?=
 =?utf-8?B?WWdhNUN6WXRjVURkZVVLcEJVMU1KWmRvTWZISlRiaE1mNnZZd2xldkFyTTRL?=
 =?utf-8?B?NDZneUpkcGsxenJJQVhVL3hidHpKc3ZQRitVMkNnOTNuWVlxOFJGdXlZVmpM?=
 =?utf-8?B?UUU2WG1wT01lenY2cUZBb0ZhWkh3aC9seFowUjVzMkxya2NWSnNxcitZdndp?=
 =?utf-8?B?THNTSTB0NFhHOGlra3lSZDM3SEJoaHo3M0U1K1h6dWJuS1BXSU40NUdMREMw?=
 =?utf-8?B?ZXYzM3F5ZU1BdVIxZm1TalZHS0E4dmZkb0ZCeEFYdUw5Y3IrelJ3SkpHMTNv?=
 =?utf-8?B?Uys1U1NCQkNGK3pMb0RLRHo0L3NTakJwYmVPVDB4T1VvMjFxa0FVd0RvV3h1?=
 =?utf-8?B?QmVUVlNYN0pnRVRqeU9wdWNLWHRJMnladnZOdFZIY0dMSHQrUjNVOGZYeGRv?=
 =?utf-8?B?QkJrZS9tRFp4V2YrZjdPZUJHODUybytLUE9qbnhlQ3pETVVJU2c5emhsc2Vr?=
 =?utf-8?B?cE9aSTRPeWJHNkQ3ZHlFcTJQZC9Sc24wZDJEbm9RL1ViTHJwY3pMSm9oSGtj?=
 =?utf-8?B?VXp3a3dFbUFuNEFzVm4vdGRuU09wdHhUZ0lBc0FFQVhJcVg2eFQycHlYZUpS?=
 =?utf-8?B?ZXdBUmlNTStFOVJrWlgxUUY1Mjg1Tm53S01vMnFoaWg0TmJuRit6bDVYbjBU?=
 =?utf-8?B?cVd2ajJZNW5QdVF6TEhiNjhYZzF3NDBwcE9ZeGRGQ01UQWFIUTJHY1piNTRW?=
 =?utf-8?B?Tm5MMVZ2ZmE3Y2M3L2JQSFlkc2hBdWxqT2dzK3NTUEU4VEREdU12QzdSYm92?=
 =?utf-8?B?ZWtRclM1OU9YNDNEbEZaaWJ5ZUFaMys5VzlKcHhvVzVlU1h2RXJuSlI2cEFK?=
 =?utf-8?Q?bbeln7YSE3xM4rKeRaIBU0cVv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF41114BDEE32A4EBB6494EDB15BE4F7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d871a14-de0f-4847-a461-08ddaab610b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2025 20:08:29.7349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HkSgyGlLmJCbx7+H9WVW2XrP1beAbWpTtl1jWfc6MFM/VjHBIgWF8W0rXcXEYko5Mf/Y6o/QJgXu4DeXxTHEMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9511

T24gRnJpLCAyMDI1LTA2LTEzIGF0IDE0OjE0IC0wNTAwLCBUaW11ciBUYWJpIHdyb3RlOg0KPiA+
IEkgdGhpbmsgQmVubm8gbWVhbnQganVzdCB3cmFwcGluZyBhbGwgeW91ciBtYWNybyBleHBhbmRl
ZCBjb2RlIHdpdGhpbg0KPiA+IGEgYGNvbnN0YCBibG9jayBpbnN0ZWFkIG9mIGEgbm9ybWFsIGJs
b2NrIC0tIG5vIG5lZWQgdG8gZGVjbGFyZSBhbg0KPiA+IGludGVybWVkaWF0ZS4NCj4gDQo+IEkg
Y2FuJ3Qgc2VlbSB0byBnZXQgdGhpcyB0byB3b3JrLiDCoEhvdyBleGFjdGx5IGRvIEkgd3JhcCB0
aGlzIGluIGEgY29uc3QgYmxvY2s/wqAgRXZlcnl0aGluZyBJJ3ZlDQo+IHRyaWVkIGp1c3QgZ2Vu
ZXJhdGVzIGFsbCBzb3J0cyBvZiBjb21waWxhdGlvbiBlcnJvcnMgSSBkb24ndCB1bmRlcnN0YW5k
Lg0KDQpJIGZpZ3VyZWQgdGhpcyBvdXQsIGFsc286DQoNCm1hY3JvX3J1bGVzISBzZmlsZSB7DQog
ICAgKCkgPT4ge3sNCiAgICAgICAgY29uc3Qgew0KICAgICAgICAgICAgY29uc3QgRklMRTogJnN0
ciA9IDo6Y29yZTo6ZmlsZSEoKTsNCg0KDQoNCg0K
