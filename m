Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B8118F
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Sep 2023 00:05:58 +0000 (UTC)
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5551B1A5
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Sep 2023 17:05:57 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-59f1dff5298so28195637b3.3
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Sep 2023 17:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695427556; x=1696032356; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpw7ux50huWSMrlaSSPYRdfTbjey4TFgRpvARmmvyIw=;
        b=hSSWw7Z7PzafL9Cv1JbvroKwSj55OJuEm+uXww0A7h4oV6ENIakkAlQMyhnsR5C4qM
         VtDCwI638UtcVEZishPfPatcoAFoVhC3PiAcMrQFuA4YTNDciWF4JxIH8+WRNprQ5no7
         xdkLpQ3Dxk7MR8HmtPBEPjKlHxd9d3dI5aBuby0zg/k01j3t/oSt5l+8VuELKtlnV0Tk
         0nphxUe4fe08e2rmpj0Zav1VtkgITqM9DJ3IlAI3PXpHB7iLnlunDVQCx6GZTG97+Gt2
         i4CyFUnSDpp5FajHK6itntPddFPqhPRltdUYwLZ7ExT4Wiy8nr/iIQJRdYL8U9aYG7yc
         uo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695427556; x=1696032356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cpw7ux50huWSMrlaSSPYRdfTbjey4TFgRpvARmmvyIw=;
        b=EEZDSnnbgag+kIKYqx2qbkKGybnYge9K5UwgAgMtV2YX8wCbc+LfZGM851GkHh8x+X
         1ImLYDJpO2pXD6VK6DH9B+06z9Pd/kkZXl5Yl8pAS1kztJzWXAzEFcDnC0RW+Dk+5N5U
         oVZJq1mFUWMWUz4k15ZIWq840LFArqLu5XO0BAjchVRW+QK5aLhfCQhLZT5/mZi0meUz
         MVIQsuiTbTbWd81HooRJB8Q4SYKsgu9QAA6u0xcegRVTTn1BIPjRkHi+QKJbljUkr27y
         TO/OnNUql+WiGXFZaAlYIJ1mjbLzyoazOtuLPSFO6Tc9SF+LCqG5OU8Vm1/fOgXtvsU4
         hmFA==
X-Gm-Message-State: AOJu0YzPq4X03EBgRNlCEa2LUe+hxl/23acoKHymkb7R/W7GlOwFRiOR
	PI5dBK4J/JLCeEXDU0DUpFOlEOfF279D7jXIzGM0LWaPrPUXO2yl
X-Google-Smtp-Source: AGHT+IFwHUJHKWD3RYx/JEwEY0BT0ZB16lXaeg7Bfs3g5wpd3z5fbHLJzOV05tNJJyl540C08gwbE/7y1yusgP+Gfjs=
X-Received: by 2002:a81:7b83:0:b0:595:89b0:6b41 with SMTP id
 w125-20020a817b83000000b0059589b06b41mr1192393ywc.38.1695427556501; Fri, 22
 Sep 2023 17:05:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-4-fujita.tomonori@gmail.com> <dd12e8b8-16a0-4cc2-8b0c-78386ce2dabc@lunn.ch>
 <20230917.213248.712797486250583805.ubuntu@gmail.com> <CANiq72nBoj=skGOpp0LbARDo1U-ev-GWZad=hq3iVBsQBuwA-w@mail.gmail.com>
 <1299bee8-9378-4a13-8cb2-3b47e0dee417@lunn.ch>
In-Reply-To: <1299bee8-9378-4a13-8cb2-3b47e0dee417@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 23 Sep 2023 02:05:45 +0200
Message-ID: <CANiq72nkmL5jEqdnj+OoDk+Vja_jVUdD+EGneF3h+kdFSOJqPA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 3/4] MAINTAINERS: add Rust PHY abstractions file to
 the ETHERNET PHY LIBRARY
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Sep 19, 2023 at 6:33=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> So a question from a none Rust person. Why would it need to be in the
> 'kernel' crate?

Sorry, I missed this one.

Rust requires to perform some work on dependencies given there are no
headers. One could definitely put the abstractions elsewhere, but
properly sharing them requires a more involved build system. Thus, for
simplicity, abstractions go for the moment in a single translation
unit (called the `kernel` crate) that gets compiled first.

Like Trevor said, leaf modules that use those abstractions can be
already placed in the usual places.

Cheers,
Miguel
