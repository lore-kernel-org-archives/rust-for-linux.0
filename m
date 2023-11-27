Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hqNCjuDj"
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD951198
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Nov 2023 09:41:09 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-77d67000b69so258489385a.2
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Nov 2023 09:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701106869; x=1701711669; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d+goW60gH4pIf6lGMe0NKKsrqxucWdmRn6bsI4rl9Pc=;
        b=hqNCjuDji2ypq31C559mURIhyJ8RPbx3weVWzHnx5JQRHAO/oovVWtk7UD2Ri4ErS2
         bWw2DyZfn/7fU7/R9CVesM/eZwj8nnciNLthVHaM5kPsSrLAlvoj+Nk++rQnovgrSNWn
         lLHBTLpye7HqueWfNOhl1XH6TXS0t3Qn9+6WolD43zj4gUhk7lYrGDokhmCHcVFbdGqh
         pFzldXmCUQgod+5tX1FCMdBBkGH6cSY/H4MZcX2sTMSNONrJnSLa6lEX6oVUpFxE0T+P
         l100JbnEqtgojxe3SEshh9m5AvSSh+OvPT/nEUt5RE6MW6fGgi9wKlt//IiYr843FFJZ
         zJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701106869; x=1701711669;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d+goW60gH4pIf6lGMe0NKKsrqxucWdmRn6bsI4rl9Pc=;
        b=VuoF0LAssMmiALuJCZXRCVzaLUTRPcHL/1LKYsNxS2svseFUZrLzO2stCutA/JQ3Dk
         P0luIkCB43ZLtvyknuqhoy6jfoNdPSccFK3zb0N0YXgbwhf2J1gb75XoSjljYUp6XE4A
         gQWwc/93lvC0FgndeCx8EDyHqEiukcT+ISI9180A0yFyeu/WRbFe//uh4xz/ySgATcWH
         5DDqGGTMe3W1N99LYmZAlUh7XCcR0gel7VIgsiw1kdmCcHJADTQx+6fFR8i3vdehymYJ
         3udJzz1Kj0C85+Ye7BVbe6A87eN7hDFNBsm4D0uJkV0fRcOPaMZ7IK4N3D97lCrNFao7
         PZ5w==
X-Gm-Message-State: AOJu0YwsrPZWJdFaE4sQ+JUb1cfcGzCxTJD/UHT1Qv2lhE6lU6Ig65tl
	C2V8F5sJlyWwinJzmaRVRl8=
X-Google-Smtp-Source: AGHT+IG22bNGuOe5cGMEceBV1xJWo/mU0SjoW4hzH2U77yyts7RhKNRqnomYcqfaq1UvdDLdP7C8kA==
X-Received: by 2002:a05:620a:45a0:b0:77d:8775:eb03 with SMTP id bp32-20020a05620a45a000b0077d8775eb03mr11718952qkb.69.1701106868954;
        Mon, 27 Nov 2023 09:41:08 -0800 (PST)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com. [66.111.4.228])
        by smtp.gmail.com with ESMTPSA id l20-20020a05620a28d400b0077d9aa74e40sm1865588qkp.68.2023.11.27.09.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 09:41:08 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailauth.nyi.internal (Postfix) with ESMTP id D81A027C005B;
	Mon, 27 Nov 2023 12:41:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 27 Nov 2023 12:41:07 -0500
X-ME-Sender: <xms:stRkZY8llCLO3PLSpt_hqLsPPKncfJ5J78g4Dp-vJ7CsAIjwWhndNA>
    <xme:stRkZQuUnLwP0hXx6We9kwLuDrbqT4SVUnDcz2fKyNn7AogzEXjcHBNTS0VxOjcpm
    mhLyoNeDR-zP45VOg>
X-ME-Received: <xmr:stRkZeBCMfeRJj2WImZLLe4d_5mtidQT6T0iI6wh6q4geWCFpWbp31BBdUU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeiuddguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepueho
    qhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtf
    frrghtthgvrhhnpeegkeegtedtleffkeeftdevleeuieduveejgeeikedvgeekudefteef
    ieeivdeuleenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghu
    thhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqh
    hunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:stRkZYclcq2rPzRvrEpeyja8Bng6ciuAvIUATLuxL5hdpD070NX0lg>
    <xmx:stRkZdMICU40WoMFoVZ7Ay1RYlSUvFWTwU-Ve3GyGIY5D6vyrtxJnQ>
    <xmx:stRkZSnwMPUGwOjAFXFPZR7sSGbS2gvP_-vzKIvXfIs_KyVzlbP31g>
    <xmx:s9RkZRne6CbZwR8Yvj7ZDOfhOjSlZH_Gdd57_LeBmbH-qZHSa4gP_A>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Nov 2023 12:41:06 -0500 (EST)
Date: Mon, 27 Nov 2023 09:40:27 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Matthew Wilcox <willy@infradead.org>,
	rust-for-linux@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH v4] rust: xarray: Add an abstraction for XArray
Message-ID: <ZWTUi8mNvjszP7yw@boqun-archlinux>
References: <20231126131210.1384490-1-mcanal@igalia.com>
 <CAH5fLghV0jtXCJ2aetH9ZNvJ=Tu-48DCjNQMPxAWf1GW-1Mbcw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLghV0jtXCJ2aetH9ZNvJ=Tu-48DCjNQMPxAWf1GW-1Mbcw@mail.gmail.com>

On Mon, Nov 27, 2023 at 02:51:33PM +0100, Alice Ryhl wrote:
> On Sun, Nov 26, 2023 at 2:13 PM Maíra Canal <mcanal@igalia.com> wrote:
> > +// Convenience impl for `ForeignOwnable` types whose `Borrowed`
> > +// form implements Deref.
> > +impl<'a, T: ForeignOwnable> Deref for Guard<'a, T>
> > +where
> > +    T::Borrowed<'static>: Deref,
> > +{
> > +    type Target = <T::Borrowed<'static> as Deref>::Target;
> > +
> > +    fn deref(&self) -> &Self::Target {
> > +        // SAFETY: See the `borrow()` method. The dereferenced `T::Borrowed` value
> > +        // must share the same lifetime, so we can return a reference to it.
> > +        unsafe { &*(T::borrow(self.0 as _).deref() as *const _) }
> > +    }
> > +}
> 
> I don't think this is sound. Deref could return a reference into the
> `T::Borrowed` itself, but it doesn't outlive this function. I would
> either omit this impl, or provide a sub-trait for ForeignOwnable that

Agreed. FWIW, there was some discussion around this:

	https://github.com/Rust-for-Linux/linux/pull/952#discussion_r1096791211

now think about it, how about the following?

	impl<'a, T: ForeignOwnable> Deref for Guard<'a, T>
	where
	    for<'b> T::Borrowed<'b>: Into<&'b T>,

	{
	    type Target = T;

	    fn deref(&self) -> &Self::Target {
		// SAFETY: See the `borrow()` method.
		unsafe { T::borrow(self.0 as _) }.into()
	    }
	}

Regards,
Boqun

> provides a borrow as a reference.
> 
> Alice
