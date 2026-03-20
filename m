Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC4D377037;
	Fri, 20 Mar 2026 08:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773997128; cv=none; b=aEIlE5dvztNaeluVzr7+n3GDsLH+e1+rtwQwWfJSkXRl2LCpPnzhi4kvaMhePm+KpAp2j2wFOKQQpuSoF5MCc4/edn4M0zQvgWeT4Zwg2NUNwEBgL8cpfJpGbbeanR0fmFDlCDST/WnUJDzcU21PqPyCcdc6vdN6dncfr9l1OUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773997128; c=relaxed/simple;
	bh=3ldYIMVmK8cMcto/OnDJoQIpqx0Ud6RDo0kyESSOmRM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=iOVxsKTQWl2AzO4Jfw4xYZWd6mvc+hfbTvhIDesZGa4rC3Kc5efUC0uB8oJfJgsP4zIMPzkiVOpwFvKA5A5oWZussu1aMkEo7sCAMaPC9TI9A7w2W/lQak+cOI6ZyCMr/R6+xpmB7RzqQR8cbGxn6XXBh35/1HUCx7V24zilto0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=YAqivZp0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=E/A1XySe; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="YAqivZp0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E/A1XySe"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D17431400215;
	Fri, 20 Mar 2026 04:58:45 -0400 (EDT)
Received: from phl-imap-18 ([10.202.2.89])
  by phl-compute-12.internal (MEProxy); Fri, 20 Mar 2026 04:58:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1773997125;
	 x=1774083525; bh=Eflgzl01mXjIkGT2kuJ0PYWyFz/i76TguJxyUULYZE0=; b=
	YAqivZp0DA065US0pta4UvJgfq6UHKY3qjURPJBpTiZMmp8VQwv5x6hoTylJ7iaV
	OM42SlQO36iTtlMxVrntx/Sb14iTy1NEWnDB7uBkzyyZr4d1nuBCyX1ztJ1tU8xS
	skr2jaM6u2pghNXK0ZTLXEioPmV4IsayCr1q+LCT+12y+LfBpmqyUpuPRdKxI2qz
	8De1DM6nYZLZEAXsd4chkrdhzuZ04HKUefSZznUw+i6sIbEfsXpeBfkVDdRgLvS0
	6r6J3/LnBhN6cGrZA/O3cjGlZC6y19Yz1nv5Vf7HChirA+yzkVBzqU0+X/vFWvaF
	v+JbnoBReBn4EpxIGHEiRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773997125; x=
	1774083525; bh=Eflgzl01mXjIkGT2kuJ0PYWyFz/i76TguJxyUULYZE0=; b=E
	/A1XySeRv+31CBPE0hcEtCTKIz4ymBNvvfF5J7A01tM4+EvrUu2VrDmRqzadcr41
	2f4gQ4ESB6bn4nlm01yOfsK5ODIGL3jbHHV5gKI+zXqsuVE1qRLQaGS9CBfKll+J
	C16J+c/jOcS+xxzI7qJb5kRNY2WccXb2zAFlFj5E38wHJORH8krqyB//8ow3DzbM
	rV5XX9BOAIUpSBPrSCGmMyWm1CtuRlGPavQsrTrmLg26Hepyu/PPNkt6zh+6+XLO
	NjpteLVq6DH1TT9wNlYR9+unetdjmLs97sA941PWbiAl90akgqoXyv39KGJS8jS5
	+4UdOPbWiYoySxEJROkyQ==
X-ME-Sender: <xms:RQy9acSEt0ooIvY_q_Wkf_oY9FHSCiYmIrCkIAAT5t-kYsVJbHpNlw>
    <xme:RQy9aUlzqukGgjjP2Y-0QBSZgZA33O6tDjaH09clyKiYZpNJ_K2J-SnPtSfqD5rPe
    jf0NTCi9SMBmF3l1Dy6_UxbEYwhZVcMxnY7pb6YXyt-mC5cK9wpEY9I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdelgeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfffgrvhhi
    ugcutfhhvghinhhssggvrhhgfdcuoegurghvihgusehrvggruggrhhgvrggurdgvuheqne
    cuggftrfgrthhtvghrnhepgfeftddvgefgtdejvdefvddutefgvdeiuefgudffkeelhfek
    veegieehtddvueegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepuggrvhhiugesrhgvrggurghhvggrugdrvghupdhnsggprhgtphhtthhopedv
    fedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrd
    gthhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegr
    ihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlvgigrdhgrgihnhhorh
    esghhmrghilhdrtghomhdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdr
    tghomhdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtph
    htthhopegshhgvlhhgrggrshesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprgdrhhhi
    nhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvg
    hlrdhorhhg
X-ME-Proxy: <xmx:RQy9aZFJq4-fvW-RFJyoqqQnLC_Audp1aaio2XWwSbGuJj644JyRyA>
    <xmx:RQy9af-fe7UoGlmry3p9xFhJpx4PFywjbESBu2erg70XzSjByvGyVA>
    <xmx:RQy9afMeOF-KDROc0NeIADZeojZZOJZkoK14zDARR9uIjsho5lD9qg>
    <xmx:RQy9aVgmyf5FR9pfPpZQxynywoI5jCtRpAUAoaHD-m6vbmhsbD8PYw>
    <xmx:RQy9aTCP-PsfuY2_0p0oOAWP-VXeVX5mTwLFKUgFy216B9zVVS7ohO8L>
Feedback-ID: id2994666:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6EAA715C008F; Fri, 20 Mar 2026 04:58:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AtQVIY85vbR-
Date: Fri, 20 Mar 2026 09:58:24 +0100
From: "David Rheinsberg" <david@readahead.eu>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>,
 "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>,
 "Shashank Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 "Benno Lossin" <lossin@kernel.org>,
 "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
Message-Id: <d766522d-ef82-4300-919c-fed89f2f04fb@app.fastmail.com>
In-Reply-To: 
 <CAH5fLgieAZz4YAp4-Y1240mVt2V_Pu3TJ8YZyMkP1ZG_neafwA@mail.gmail.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
 <20260317225355.549853-17-jhubbard@nvidia.com>
 <125cb5fd-55fe-4c54-bdda-0478f5a8aabd@app.fastmail.com>
 <CAH5fLgieAZz4YAp4-Y1240mVt2V_Pu3TJ8YZyMkP1ZG_neafwA@mail.gmail.com>
Subject: Re: [PATCH v7 16/31] rust: ptr: add const_align_up()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Mar 20, 2026, at 9:44 AM, Alice Ryhl wrote:
> On Fri, Mar 20, 2026 at 9:38=E2=80=AFAM David Rheinsberg <david@readah=
ead.eu> wrote:
>>
>> Hi
>>
>> On Tue, Mar 17, 2026, at 11:53 PM, John Hubbard wrote:
>> > Add const_align_up() to kernel::ptr as the const-compatible equival=
ent
>> > of Alignable::align_up().
>> >
>> > Suggested-by: Danilo Krummrich <dakr@kernel.org>
>> > Suggested-by: Gary Guo <gary@garyguo.net>
>> > Suggested-by: Miguel Ojeda <ojeda@kernel.org>
>> > Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> > ---
>> >  rust/kernel/ptr.rs | 24 ++++++++++++++++++++++++
>> >  1 file changed, 24 insertions(+)
>> >
>> > diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
>> > index bdc2d79ff669..7e99f129543b 100644
>> > --- a/rust/kernel/ptr.rs
>> > +++ b/rust/kernel/ptr.rs
>> > @@ -253,3 +253,27 @@ fn size(p: *const Self) -> usize {
>> >          p.len() * size_of::<T>()
>> >      }
>> >  }
>> > +
>> > +/// Aligns `value` up to `align`.
>> > +///
>> > +/// This is the const-compatible equivalent of [`Alignable::align_=
up`].
>> > +///
>> > +/// Returns [`None`] on overflow.
>> > +///
>> > +/// # Examples
>> > +///
>> > +/// ```
>> > +/// use kernel::ptr::{const_align_up, Alignment};
>> > +/// use kernel::sizes::SZ_4K;
>> > +///
>> > +/// assert_eq!(const_align_up(0x4f, Alignment::new::<16>()), Some(=
0x50));
>> > +/// assert_eq!(const_align_up(0x40, Alignment::new::<16>()), Some(=
0x40));
>> > +/// assert_eq!(const_align_up(1, Alignment::new::<SZ_4K>()), Some(=
SZ_4K));
>> > +/// ```
>> > +#[inline(always)]
>> > +pub const fn const_align_up(value: usize, align: Alignment) -> Opt=
ion<usize> {
>> > +    match value.checked_add(align.as_usize() - 1) {
>> > +        Some(v) =3D> Some(v & align.mask()),
>> > +        None =3D> None,
>> > +    }
>>
>> This would return `None` if the value is already aligned, but the add=
ition overflows `usize`, right? For instance, this would incorrectly ret=
urn `None`: `const_align_up(usize::MAX - 1, 2.into())`
>
> No, in that case it computes `usize::MAX-1 + (2-1)` which is just
> usize::MAX and does not overflow. After applying the mask, it returns
> `usize::MAX-1` as the return value.

My bad! If alignment is below `usize::MAX / 2` then this always works. O=
nce alignment gets bigger, the function fails, though. The following ass=
ertion does not hold:

assert_eq!(const_align_up(usize::MAX - 1, (usize::MAX - 1).into()), Some=
(usize::MAX - 1));

Doesn't matter too much, I guess, but with `checked_next_multiple_of()` =
this assertion holds.

>> FYI, `core` provides `usize::checked_next_multiple_of()` ((const-)sta=
ble since 1.73). So an alternative would be:
>>
>> pub const fn const_align_up(value: usize, align: Alignment) -> Option=
<usize> {
>>     value.checked_next_multiple_of(align.as_usize())
>> }
>
> That would return value+align when value is already aligned, which is =
wrong.

You sure? (emphasis mine:)

"Calculates the smallest value greater than or **EQUAL TO** self that is=
 a multiple of rhs."

assert_eq!(16_u64.next_multiple_of(8), 16);

Thanks
David
