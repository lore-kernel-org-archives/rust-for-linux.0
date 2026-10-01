Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC362343897;
	Thu,  1 Oct 2026 23:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790897559; cv=pass; b=hxjdnNUywckBlpkvU0Qi6jlHjMVU7BXqnPkxAi8xgvn55kDyrGUd72eAWgWjXOmsB+xwewAjswk55jPHUK1GfmfLzlDoszC7CFO9hO3n2d/lTgm+f7NU6fbs1j8CMrOD8NLBgnx+ZptrW4KI94Wr8qTnVeORpwh5/Nzjnhhva0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790897559; c=relaxed/simple;
	bh=kC7eGM7vc/pcNfhHT3ieoSvnmpZngxVz9CoOJzybcWc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=fhzNrW9GzCyXS0Y9DkzBY2SyLeIogzddjuwQJonDjHxf6xXyY/7E8U6lYlIG7vxW75+wR6B6JVWkG3ASMaieIT4G06LxN25bxJz9GoFWplgVegmXAv8M036zeq1EOXyqCw1uYnwi6DTXP329o6gF0ZvI2loUnHtGK6/X/Q9pRY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Xelkg4Sz; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Xelkg4Sz"
ARC-Seal: i=1; a=rsa-sha256; t=1790897536; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PaCJ/FxRvxuGkmAKeA/dJBQatUZRJduT+uOkwqpoMB3p8lqXYJV7yWBTp2o3ClgUb3aZXsPeY07c7ydaBC6ct4GwNsLZyWRh36lNoRZ+GRU6ZYIiDHSmreA1lspejJTrjPewgegQraQu5zoJ8rUlK5xywUmnOU54fXBbga7juKU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790897536; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ML/G9TCgidLNp9h/dgAreV05rTYl+PPPnPd9CLWnMJ0=; 
	b=N/90EF549kovPAMYT/0ZyHHUVQMK1B4a3uoHaNsX7A7MhTariHvwijo3J2u/q+RbGzHoNp/5U5Ybbn6LSUsIQsjMGLvc+CZwqpsb1WchHw7GMysPTcLG7G9KjQTyCghIUn/HWxftN30cOBSP3dxwt8bbOSOrde799LusS7cLvCY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790897536;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=ML/G9TCgidLNp9h/dgAreV05rTYl+PPPnPd9CLWnMJ0=;
	b=Xelkg4Szjjy9XuPD6+I2m20pH8PNbsBSpWssZG4uLKlkAka7wnY6ZddJJ5j8pXMC
	FFw1ds0Xw/bMcQPmyoJrBWFc6yyJvT8qTm9lB5v8ehHZmHYEF5CvNbHBXTQq/h0Ps/t
	negmMTPSKUCMSXAmAiw+2DVJ54mnbbiFssDRXiUw=
Received: by smtp.zohomail.com with SMTPS id 1790897535210114.7548273610214;
	Thu, 1 Oct 2026 16:32:15 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH RFC v2 1/4] rust: usb: add endpoint abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260811-rust-usb_control_msg-v2-1-ef79c92bd898@wyliodrin.com>
Date: Thu, 1 Oct 2026 20:31:57 -0300
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>,
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
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 driver-core@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <0BD94D14-E5CB-4260-8B3C-AC49AF340CD4@collabora.com>
References: <20260811-rust-usb_control_msg-v2-0-ef79c92bd898@wyliodrin.com>
 <20260811-rust-usb_control_msg-v2-1-ef79c92bd898@wyliodrin.com>
To: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
X-Mailer: Apple Mail (2.3901.100.1.1.11)
X-ZohoMailClient: External

Hi Alexandru,

I think the typestate should go away in favor of something simpler:

#[derive(Clone, Copy)]
pub struct Endpoint(u8);  <------- private constructor

Drivers ask the Rust layer for their endpoints at probe time, through a
wrapper around the C helpers, e.g. usb_find_common_endpoints()
or similar

    pub fn find_bulk_endpoints(&self) -> Result<(Endpoint, Endpoint)>

Unlike your current &HostEndpoint, an Endpoint can be stored in the
driver's data, since it=E2=80=99s just a u8.

Also, perhaps the control endpoint should be its own type, i.e.:

/// # Invariants
///
/// The wrapped [`Endpoint`] is a control endpoint of the device.
#[derive(Clone, Copy)]
pub struct ControlEndpoint(Endpoint);

impl Deref for ControlEndpoint {
    type Target =3D Endpoint;

    fn deref(&self) -> &Endpoint {
        &self.0
    }
}

impl Interface<device::Bound> {
    pub fn control_endpoint(&self) -> ControlEndpoint {
        // INVARIANT: Endpoint 0 is always a control endpoint.
        ControlEndpoint(Endpoint(0))
    }

    pub fn control_message_send(&self, ep: ControlEndpoint, ...) -> =
Result
    pub fn control_message_receive(&self, ep: ControlEndpoint, ...) -> =
Result
}

By the way, the alternate setting accessors and making usb::Device
public don't have a user, not even a planned one, so I'd drop them.

-- Daniel

