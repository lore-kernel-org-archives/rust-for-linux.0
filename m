Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794066182;
	b=OPxyTOFDQCMZ0FJxWLa38X/LfL7dHeHp0Ld95jbsPgQr7ZVFbPql6LBAr0Vb53tx+AYQ
	 hks+jgRVofBZj9rF/0sYXap3L+2igGfkEKPgZikQZYAZo8+uP2PleY1nitHFehiw7Pik3
	 LTU9BbXW9ciWRmdA0g/TOAlsf32pOYqu1Xh05R/JzUC732Wo22RekyXyJHgjBVF1NjR5z
	 Q6Xv+pp945dwff25rlpcjBcRL1dCOVXyCyK4Au9gn6Q20H9WS5zVp05iA3v8EUvd6Rve7
	 xAu4YvMryT3/NlRkaPUo/6HWRGo3I9TSPz0d1DZxmpzSFFbDhT/F4bmkdRNgv3qLM/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=D3NoZ9xEC4313Trcgt2ltEJwS8UgPUcORECDaAKh+WA=;
	b=V/tAwzfHSF2XwuoYUgy0EmjdbFLJjt2k0eSvZlR0DRqQWXjiLpAlKHVsDl3urozH2PBh
	 6IScZrK/ikaCKxs7DAZCUT8q0yewzyahJDayY4XdIjSNFaAYKphjlLM614MRgqXbXAcXk
	 tCHS0CRvCGqAB+ElNG2pgJOkr4EODW4oVgH5DOAVO2e2tNmjrkGMRHDVCF1luDcKFPTP2
	 GJSutZ7SmfYdZEFppjj6sTPXxCI9n1YTG387pieoa7j1CPwvgZoFHs/sFgCq6Ub/uHxDu
	 L4nOSA/K22Qw5tctc41LUAC3cBXAV7ZqOJxzH71gXQFqj5Ki55036gS/ysGfaspZ5og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QHLr+Sz6;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE38606D805
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Nov 2026 15:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAE38606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QHLr+Sz6
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e0461e040so1310003f8f.0
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Nov 2026 07:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794066180; x=1794670980; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D3NoZ9xEC4313Trcgt2ltEJwS8UgPUcORECDaAKh+WA=;
        b=QHLr+Sz6EuJzpH5UKRFi58k+ZMvGnunrgxZrEbGXiOj+FHhHlM46qHV2xPGFlvhaTF
         6RwjUHXF/71Gh34qI5AWsgmZcxIzCueatFANJSps35TVlpZRHBd3idWVCEbbIatEMGu8
         oI25fuMXV986do690kQNcS4vQ60dDhts/+jUWWsJpPbaaCeCBIMFUmS0gCgjntznzzVr
         gD1+EGJIOXoj2JLqpbWGI9fB7ULWcR51XbUDA29FM51CoPKNJYloj8za7GTbAFBc3NHB
         CBe3QSDu09OKTHNKuxpOis4gGRrjvUpddgnHgRBmLykmweyfXN6DWHs7WMxNzZ5vzEhz
         iwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794066180; x=1794670980;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3NoZ9xEC4313Trcgt2ltEJwS8UgPUcORECDaAKh+WA=;
        b=KIVTMigNVnZeyCToNlPlrUXEhjkEjprjBH4TLvUTESxj2XJ9CVHOaptNMxlNuZ8oXB
         iiYkAMRbC4xQHVRmxdKrobdl0Cs2woq/H+1YyIXrFCHHjWVPqP6MU90oUu6SIsRv4jvz
         tO+c8m0CVtbQDC8ie1yl7BI4To/RVycLJtPZWMlwHYrRAnGBrbrcwW3I1hC4HTjaUCnt
         sDndSzRkrvXcOnk4HzgX1AD+DTJ2Zse0+ePyFh9wg33dZJ+i9nk6ckAYgDZNoprJKxN8
         6bvF5nOv7B0Uevgf0c1oZFCPoepo2326UKz6gqy3ZLo6aXmdxoGqJmsmhLVcM2HIDAet
         5p6Q==
X-Forwarded-Encrypted: i=1; AL+hErEMExzYr5iUVgvNuNzdOKD/3e2N0fsT4I9lIlrjxfiAMcf9beja5p2gnR9PF+XINZL/b16rM7a4NQDHIneMkA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/EBdogV2yV9WBWZESnOl9Q5yEvbTt24mVXXgjN1A1/oWCrTmwu
	0BhCHOPjwEpzjAt8VrO44lVna5zYQtEOZuAwQGIc70EmSEfG87zbyRZQc6T0g8q39CgZOBaaR+A
	SNXkOuCke7fkzqIRQWg==
X-Received: from wrsn15.prod.google.com ([2002:a5d:484f:0:b0:490:3c0:b998])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64ce:0:b0:48f:e879:5890 with SMTP id ffacd0b85a97d-492760da597mr10504618f8f.32.1794066180064;
 Sat, 07 Nov 2026 07:43:00 -0800 (PST)
Date: Sat,  7 Nov 2026 15:42:58 +0000
In-Reply-To: <20261019-chid-v10-3-67de9180b4ed@nvidia.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019-chid-v10-0-67de9180b4ed@nvidia.com> <20261019-chid-v10-3-67de9180b4ed@nvidia.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261107154258.3547690-1-aliceryhl@google.com>
Subject: Re: [PATCH v10 3/3] gpu: nova-core: add ChannelIdPool
From: Alice Ryhl <aliceryhl@google.com>
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 19, 2026 at 01:29:28PM +0900, Eliot Courtney wrote:
> Add `ChannelIdPool` which adds automatic tracking and releasing of
> channel IDs on top of `IdPool`. This is necessary for apportioning
> ranges of channel IDs to be used in e.g. vGPU.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
