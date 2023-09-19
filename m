Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7863D36AEF
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Sep 2023 16:12:55 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E989A1
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Sep 2023 09:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gv9ug1gvRYrnMn6VUSyA17aos3DgMDjrVvSIfiAkx08=; b=lVT3mGebPv0mqw1btMVCXi7cjg
	mrqnpL93ZV7HjqGmrsdvm/dCBHKe8PpbeKEQUqmB1uQili+ejUZGFSCyyMSfa5L3dQc9p2Ew7N3HP
	Mg8WQF0aXXBk70eVcekEL/va43NmpgNOC1G9Tl3CpX8a4YtR2MHlnc5wwGmxc/9Pbjrw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qidLG-006vaF-MF; Tue, 19 Sep 2023 18:12:50 +0200
Date: Tue, 19 Sep 2023 18:12:50 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: tmgross@umich.edu, rust-for-linux@vger.kernel.org,
	benno.lossin@proton.me
Subject: Re: [RFC PATCH v1 0/4] Rust abstractions for network PHY drivers
Message-ID: <1aefd847-62df-4553-93f2-d4a26d026ff6@lunn.ch>
References: <CALNs47uN7GsEVJ5scqwZbzR-Dfk-uWp7EpafCBg0BarLhy+7ig@mail.gmail.com>
 <439b6ee7-65e0-4849-8028-cbf5e752dd87@lunn.ch>
 <CALNs47taHGkhjPH6j=JtmCAAqgTz=px5gsb6T_TN-TfPeu+Y4A@mail.gmail.com>
 <20230919.152444.1457385307728133204.ubuntu@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919.152444.1457385307728133204.ubuntu@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> bcm87xx.c registers two drivers but registers no
> mdio_device_id.

Which is odd. I suspect this driver cannot be loaded by hotplug as a
module. It is probably only ever used built in.

But i agree with you about the principle, struct phy_device and struct
mdio_device_id have a very loose coupling.

	Andrew
