Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F1D8829
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Oct 2023 14:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="hiC2E1MN"
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (mail-lo2gbr01on2099.outbound.protection.outlook.com [40.107.10.99])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9267B9
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Oct 2023 07:45:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6wtf8GVOSHuHzg2N6q2wUjtc166QUBRuOKV+aSqnUdKqXEEkBCSlTZQnVDmNL5xP9NtR2gyv/uHgZSpHMbRKlc9Kf44pZQnkfRUQSU1AIjCr89rF/oYHIi/PABUhI4OaOEhNPqu96MoPPWsPII17XaI/zqegcF+PnD2RYvlsp6D92uLco1uVAKrmCLu7YAX1+vNsWJPFsvgFvdtd3bkVQ50rHTVAJyUDylByCMrCWuLAXFb5xiYRs726huTRWkXao21g2x66XdntX+MmI1iP3EZ4nIX0FGJXW6Qdxf40qrKEBb+NmuiY4JiTV42qC0EVPjaQzb/4bzESUYv2bQW+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOiaV1UyCDVImevHBlIJ5po4gzcPvtJpZxrzaXR0iTo=;
 b=b0egUSYYGsBlLzlbKa6sEEZbX/Zk0aVFIRPKJ1KBqI/JSQUM+adfop1LI0tH0qSDd0H83kU+p2pRvWkEf8dFTFiGwnkNqz7eyCEgdE0c8eHmaP6FTjx6RgwwScAHN1sqY68ac7UY3/KXHFTm2xS9k2uyj4P9zhfcIiy21+SMCe7RdR6qLVlxQ2Ion20lL5/qcFPxYaKNW5zQJE6C/vkC9HcJgo8h0hJ0J+nZQgVMatbCyAg556dO6h5fwAez/UhUMyJOcpxbWh7SL0jmzgRMwfj/FOZMfuO/Ep/X+5osWhAYL9aNkA17SPuRTvz/Fj1cg9uqOyeBnpz8KTsP6G3Fmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOiaV1UyCDVImevHBlIJ5po4gzcPvtJpZxrzaXR0iTo=;
 b=hiC2E1MNqIxzQd2huv2eupidObD5J0tJtQGYLIYGn72gP+F/ygdYMVYcCzzX0ByuuE3WSALz/5wENo3ZGPyh5rgXWFdd14O27Cai4uPpOT53RxQ1wt0LgJPnYG9EVWoNhDbdF9ZYHQJUbBCIz6XEgNuU0E94TCf0q63FRSNSJ70=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO4P265MB6682.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2f4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Thu, 26 Oct
 2023 14:45:28 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6331:81d5:43cc:a9a2]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6331:81d5:43cc:a9a2%6]) with mapi id 15.20.6933.019; Thu, 26 Oct 2023
 14:45:28 +0000
Date: Thu, 26 Oct 2023 15:45:25 +0100
From: Gary Guo <gary@garyguo.net>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: fix relative links to kernel header files
Message-ID: <20231026154525.6d14b495@eugeo>
In-Reply-To: <CANiq72=dAYc=EQnJOuBvV5cKLo85O=A1AP03F9B6nJdDwdAT1w@mail.gmail.com>
References: <20231026.110919.517001374342898485.fujita.tomonori@gmail.com>
	<CANiq72=dAYc=EQnJOuBvV5cKLo85O=A1AP03F9B6nJdDwdAT1w@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P123CA0040.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::28)
 To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO4P265MB6682:EE_
X-MS-Office365-Filtering-Correlation-Id: e90f7afc-1b3d-41fe-e19b-08dbd63231ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mUR2B0gViAAj+GimRjCZlIEpfrANx3hsz3Ro+YToL8EZkPobFsuWgY1YirHgOLTbPX7DMCG9DhlRzgXt2+3+HIue7+njHZwix1nLoitQj7WOJ/pxSoS7gELkEBhdDQq8dy/ZWb/ghQrYAvAgichP5Sky0fOsNuQXsYyw4teSljPpz2Jo+daN75H6xATr/NnS7orlYy4br263cGt/fJ+E+MrwJJ1x/9PnyKbgL2SjhvopqPCPUhFuS+LVeF7MnYFoyqVgXWR86p++Nvalk3JjtLBI6z3L7PodAznsThxhmYQW14T1XStbgNvdnSoCEKXNzTGIj7pZ9j9grYoAsdSNy7igVZQddp7UqWPi185qT1y1TnsLnnYc4GSoC6/rNu7QjfRJp6XjsqkToxlNTCDAbhFevYqS/n9i8+R2DOmSto8GeLiYZUZRrOb+NmPYRr/sdlXgChtKEtzl5LUFKiooGuhBg30pkpSKOvtLuJjBCFzEzZcdhZYPJjQ4PzOXWYJ3bjIHBsgLFu0YtoUj8BOh/4hUij/ZBFgfyUknolmbXJYUuIS6PxCeI87ZImwdJTom
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(366004)(136003)(376002)(39830400003)(396003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(6512007)(478600001)(6486002)(9686003)(6506007)(6666004)(53546011)(38100700002)(86362001)(33716001)(2906002)(4744005)(26005)(1076003)(4326008)(66476007)(66556008)(5660300002)(66946007)(41300700001)(8676002)(6916009)(316002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTJtT1RLc25yb0xia1RIN0ZDblpHRzhlVjJINU9jZVBMZWtUbW90V2tjd3Rs?=
 =?utf-8?B?S21hWFI2MXRyTldaMWE0eW4yNWVPVzNmRWovc3l2NjEwL0dOMnlwdEdrZ2J5?=
 =?utf-8?B?L0RJUWJiT1hWNHJpU3BHdjVpaXhxcTdVL0dwajhVdmdIa2ZpYzBMbTdFUzhX?=
 =?utf-8?B?Rm5CZ01NNFNzV1BFS1V0YnVnaHoyd3BQZ3laRGRqa1ordFZ2TmNsc05DRDhS?=
 =?utf-8?B?Y1owTTJreFBrZ0hFcGd6Q1BRWk00MEthTExCbnlacVFMZE9uMXl2SUtJZmk0?=
 =?utf-8?B?R2RxdkhCbWozcFRTczc3YWJEZjc4dTFRSnhuZlpQdFdJWExIQmQ1Wkt4WHUw?=
 =?utf-8?B?N0F4b0ZrY3owRkRWeUkzazU5RGlDL2EySzVUZm5xQ1BNWWxyeDVQWXhoNW4y?=
 =?utf-8?B?UXNqOEpyUGFINDBEMHRCTDRxV0ZXVEMvU3RjRzZGRXJla0FxQ1dhdStXL0dq?=
 =?utf-8?B?UG5rMHdIVHpuVDRlbTdUaFRwWVFqOVdxelZtamxCNFBwc3g3SDQ2OTBLUWo2?=
 =?utf-8?B?OEl5OUhIQ29VYW1pMkwxWWtMVHg2VDhVc3VyWGVSckErZW0yYzI5WXU1VlpC?=
 =?utf-8?B?MzNRZ2prclhwenVaSlMwclR0UVVuWEg1bEUza29ybWpEM0NCZjZKVFRUTkVn?=
 =?utf-8?B?UWp2NDFQQlRUSDhBWkUrY3hJLzdpdDhSMU0wQWxGZWx1ZG1PUWJIWXVvVUt6?=
 =?utf-8?B?OVRvYUJ2TDZHZzEvczJSZG91bkVEdXVzdWx6OHdGK0xnUUVnVjU5MzEzb3V5?=
 =?utf-8?B?VytUV2VmZzJldjhEUWc1TUVtbnZXaSt2QmZpUW55RStLOUJOTTQ3dWNRZFlp?=
 =?utf-8?B?K3h6QjVVS0RPVlRsMEQzekFuRVBmV1d5MHJUYWlwRmNZdG45ZjJhbnZyeUg5?=
 =?utf-8?B?Z1QzMlYzaTM3bzhlYjd3bVFvdklCQkRsbmNLQnlENE80d29zYWxjK0JWOVRK?=
 =?utf-8?B?cDZyd0I4aWNEQ2MrYlRxc3lDdTdrN3BNQ2tyRlVwUFhPbzNPMHpLQUpGSzV1?=
 =?utf-8?B?OVJjeXlZQTd0WnJNZ0xIcWkyZGU3TmJOcXlvcU5waWVtUForUThDQmlTS00w?=
 =?utf-8?B?anU5dTBFOUxyNEZoODR5amhVN0lhQktlWENYeDNiZk82TEVLUHpnZThPVGQ4?=
 =?utf-8?B?TU4yTDZmbVUxRkdCdm9qMkswRDRRNGY1L2ZiYk85YjFFNkJjd0FGSTMvSTFv?=
 =?utf-8?B?ZUF0OGFPTFd4aXFickhERGtUVWdJV0VPc0dHcXdvcUtPdm85Ry9ZMEZzNnV1?=
 =?utf-8?B?Q2dEM2Vmd21mOHJNVVhaUFh5TTVDWVAzS1hUUnk2b2psa0RYZUZLQzRGVkh4?=
 =?utf-8?B?U2dneHllZFppdlRBRHJUeitKQWMxSDV4SjFQS1ZCc0lLbWxPeEZzYXp0UGda?=
 =?utf-8?B?dTZDemd2dWMxeEgvV3RjaVBGR3BDTjZFL2VxM0Z2d3VZalkwODUyVVNKS1ZP?=
 =?utf-8?B?S3BVTmZJbm5LME8rbDg1THhyOWZ4YnlRQWk1YkhNVVNKbVdBU3NCbmdYOW5R?=
 =?utf-8?B?YWdYVHludG1KZnYzQ0d4bGZZNTZvZWpHK3N5eG45UnBhN0FuVEx3cytTaVA3?=
 =?utf-8?B?RDdUbnNhbytGNEhXaE1hTjZQb2tYeGYxb2k3YmJOREg5TWZpUXc3enh1MVo4?=
 =?utf-8?B?V0llbE1aSy91ODVyZ3VEOEZwRElpVnZia0VQZWlRRmdrQU5xRE1mS0lCdTZR?=
 =?utf-8?B?eFM0OHBPbzNNZXV2SFBNWWl5US8yQndDcmdpRVg4RVgwRmhRWXNzYkdzU1pN?=
 =?utf-8?B?bSt1eFZCbFh4Yi9vd0ZySzhsUEk5WU9TNHZKMG5USjkwL01YTXpwOVB4QlpT?=
 =?utf-8?B?ZzVwSm8ya2h0RTJZeUxwWnI5VkVzWTkwWUlQeGpiUlBqTWtSbHNhVWhhK3A2?=
 =?utf-8?B?U1c1Wm45Uy9YOFFYalhtUFA5SSs0V0FyVC9WdTJ2RWhOUHV2QmY5SDI5VlVD?=
 =?utf-8?B?N3lNeGNiVFJ0Q0JDWk9WU1VobHJaZ3lMekdLWkNpUWIrWCtJQktPbmNSeXlT?=
 =?utf-8?B?Tmg1Mi96WHpOUVBKYStqNWVtS0szK3pPay9ENkFjcU1nVmViN3gvVys5OHBT?=
 =?utf-8?B?ck04eGtIR1dlMWFWUFdpN2ZrYVVOL2w5S055ZmlzZDBEQlB1ZlRDc0tFMUdy?=
 =?utf-8?Q?uEl0Pu91ZKVMCxXdXm3WXYi3t?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e90f7afc-1b3d-41fe-e19b-08dbd63231ef
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 14:45:27.9660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bLX99mNZvaUR0s9MgDsQoc8VpPlSfbENhQw9+EPZzqlCM/6vM9gpiaaMnIfxAbKKiuH7ekmInGy99V3WPwLVkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6682

On Thu, 26 Oct 2023 13:16:05 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Thu, Oct 26, 2023 at 4:09=E2=80=AFAM FUJITA Tomonori
> <fujita.tomonori@gmail.com> wrote:
> >
> > Relative links to kernel header files are broken due to the move of
> > the output path? Looks like some of links has been broken before that. =
=20
>=20
> Yeah, we wanted to clean these up when these paths stabilized  --
> thanks for this!

Would it be possible to use source-relative paths and then have them
fixed-up later when generating the docs? It's quite ugly and not very
maintainable to count the number of dotdots.

Best,
Gary
