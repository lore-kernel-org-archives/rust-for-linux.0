Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF4F25776;
	Wed, 15 Jul 2026 02:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784082995; cv=pass; b=VUh5E+Kpx/fv9SZKW3E1uhfv7iQyoDnopBlKT+SebV4u6rpSQhlA57l3JAET9affkY9GhJ+8rMTeGsXoJ8AmkRFybCMOR/0ZiREfMZjjsyzwU48KUem3OFKUM+Gm0eFAW/ZcXS9HE5IYZyZbqYnJ8OlXnwA2LLFecHqvw+vQnd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784082995; c=relaxed/simple;
	bh=CCCoBKWdYOZIqsZgs6d6JT73LJGIMyFaB4POVbHF6tk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=bXoNkeJ6PbSl8Xmgws+pb50BCFv67/zdY5Za5omn2Mp2kiiB3eNMwI+SmjSFTyOQ6m+f9tvl+6nnVzzPRraadBvBzJlMCWkIGrDnl5UlD1TxCtZI8MNO1NhuwY4BtdW3ZcLyZRCQRYwOigXXG05XSx6tMmDajWMSt4hspY5zL7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=X40AoUZd; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="X40AoUZd"
ARC-Seal: i=1; a=rsa-sha256; t=1784082971; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EDMJI5+Zxodtl29AzYLlxHF57BTQIVOnpBYHfLqeaaKfm4KN402UVrwnQ6z58zUD2cfzR6Wo+K5qm2Wf8H614lVlHMBRPYDVKK0836cBgOFPhh4/I/xSjNlPDZUsVBcjCCtb+9sbR/75Stjze82gUR2pQ3S0Vce85fjNrmEX7xc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784082971; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CCCoBKWdYOZIqsZgs6d6JT73LJGIMyFaB4POVbHF6tk=; 
	b=UEmXXmSGthgKtaAlykKaIpMraEpboC50k978gJBOQSgrS8SrLOW7jGGaoJdmweOk3iTqAzNsp9arabgrxuHnPXQa2VEbYH6IrKa4kSDUkvHlFWn/1XrK2uvDSoWAZIF4+1t2LvPv8+D9iLIZrNDmDfIEx/x6xxGWAaE+1k27Uo0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784082971;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=CCCoBKWdYOZIqsZgs6d6JT73LJGIMyFaB4POVbHF6tk=;
	b=X40AoUZdJrMD6AA+fIConpeuYtY+IfQs3BgFWVGlwjjTTigymnkm/P4FHOq4GOYZ
	UIY/qPO7nlqzKY25ii63TsxVQuV7aHoiTU1NiqGDF/3153D4MhYihznqgM6Na0F8752
	6vmttJ+ULPVtsj7fJ+eanxiJT0uKI1wq06qu95Mw=
Received: by mx.zohomail.com with SMTPS id 1784082969609978.1531201799045;
	Tue, 14 Jul 2026 19:36:09 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [RFC PATCH 0/4] rust: usb: add usb request block abstractions and
 a user
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <alVGanOux7SJ5dpM@pendragon>
Date: Tue, 14 Jul 2026 23:35:50 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Mathias Nyman <mathias.nyman@intel.com>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 linux-usb@vger.kernel.org,
 linux-media@vger.kernel.org,
 Colin Braun <colin.braun.cl@gmail.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0CCB6F69-1336-4254-AE1A-5DDC63BCA7B1@collabora.com>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <1E924102-5CC7-427A-9FD0-3B15BA1BEAEB@collabora.com>
 <alVGanOux7SJ5dpM@pendragon>
To: Colin Braun <colinbrauncl@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Colin,

> On 13 Jul 2026, at 17:32, Colin Braun <colinbrauncl@gmail.com> wrote:
>=20
> On Mon, Jul 13, 2026 at 10:53:53AM -0300, Daniel Almeida wrote:
>>=20
>> Have you talked to the media people about adding a Rust driver?
>>=20
>=20
> I have not. I was actually wondering if this belongs in
> drivers/staging/media, given how much work still needs to be done for =
it
> to support basic functionality. I had seen some v4l2 Rust abstraction
> work done but not merged in, so I had hoped this could eventually be a

Yep, I was behind this for a few years, in a few different ways.

> user of that work. Still trying to get a lay of the land, this is my
> first attempt at contributing to the kernel.
>=20

I=E2=80=99m cc=E2=80=99ing my colleague Nicolas. He was at the media =
summit this year
discussing a topic somewhat related to Rust.

IIUC, the consensus is unfavorable for Rust media drivers at the moment. =
They
are waiting for more progress on gcc-rs before allowing it, as clang =
does not
fit some of their infrastructure.

This doesn't have to discourage you from this work, though. Last I spoke =
to
Greg, I think he was OK with having enough infrastructure to build a =
Rust
version of usb-skeleton.c. You could perhaps work on that? I never =
really found
the time to, but I can chime in with reviews. It's always nice to =
onboard new people :)

As Danilo pointed out, there is a competing implementation, though that =
seems
to be completely AI-generated, IIRC. Perhaps Mike would be interested in
letting you take it over? It's already a lot of work on their plate to =
do
hardware RE + KMS + usb, so you could work together instead.

Just a suggestion, of course.

-- Daniel






